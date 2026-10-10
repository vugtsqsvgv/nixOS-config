{config, libs, pkgs, ...}:{

programs.nix-ld.enable = true;
programs.nix-ld.libraries = with pkgs; [
  # Add any missing libraries here if you encounter errors later
  libdrm
  mesa
  libxkbcommon
  glib
];

  }
