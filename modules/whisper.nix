{ config, pkgs, lib, ... }:

let
  # 1. Define the Python environment with faster-whisper.
  #    This is the NixOS-native way to get a working Python package
  #    without pip or virtualenv issues.
  fasterWhisperEnv = pkgs.python3.withPackages (ps: with ps; [
    faster-whisper
  ]);

  # 2. The transcription script. It uses CPU-optimized settings
  #    for your i5 and 8GB RAM.
  transcribeScript = pkgs.writeScript "transcribe-lecture.py" ''
    #!${fasterWhisperEnv}/bin/python3
    import sys
    import os
    from faster_whisper import WhisperModel

    # Load the model once with optimal CPU settings.
    model = WhisperModel(
        "base",                # "base" is a good speed/accuracy balance.
        device="cpu",
        compute_type="int8",   # Essential for 8GB RAM: ~75% less memory.
        cpu_threads=4,         # Match physical cores on your i5 (check `nproc`).
        num_workers=1,
    )

    audio_file = sys.argv[1]
    output_file = os.path.splitext(audio_file)[0] + ".txt"

    segments, info = model.transcribe(
        audio_file,
        language="en",
        vad_filter=True,       # Skip silence, speeds up long lectures.
        beam_size=5,
    )

    with open(output_file, "w", encoding="utf-8") as f:
        for segment in segments:
            f.write(segment.text + "\n")
    print(f"Transcription saved to {output_file}")
  '';

  # 3. The watcher script: processes all audio files in the watch folder.
  watcherScript = pkgs.writeScript "watch-and-transcribe.sh" ''
    #!${pkgs.bash}/bin/bash
    WATCH_DIR="/var/lib/whisper/audio"
    mkdir -p "$WATCH_DIR"
    for file in "$WATCH_DIR"/*.{mp3,wav,m4a,flac,ogg}; do
      if [ -f "$file" ]; then
        echo "Transcribing $file..."
        ${transcribeScript} "$file"
        # Move processed file to an archive folder to avoid re-processing.
        mkdir -p "$WATCH_DIR/processed"
        mv "$file" "$WATCH_DIR/processed/"
      fi
    done
  '';

  # 4. Create a dedicated system user.
  whisperUser = "whisper";
in
{
  # Create the user and group.
  users.users.${whisperUser} = {
    isSystemUser = true;
    group = whisperUser;
    home = "/var/lib/whisper";
    createHome = true;
  };
  users.groups.${whisperUser} = {};

  # The systemd service that runs the watcher.
  systemd.services.whisper-transcribe = {
    description = "Faster-Whisper CPU Transcription Service";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      Type = "oneshot";
      User = whisperUser;
      Group = whisperUser;
      WorkingDirectory = "/var/lib/whisper";
      ExecStart = "${watcherScript}";
      # Run every 5 minutes. Adjust as needed.
      # For a oneshot service, you can use a timer instead.
    };
  };

  # A timer to trigger the service periodically.
  systemd.timers.whisper-transcribe = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*:0/5"; # Every 5 minutes
      Persistent = true;
    };
  };

  # Ensure the environment is available system-wide if needed.
  environment.systemPackages = [ fasterWhisperEnv ];
}
