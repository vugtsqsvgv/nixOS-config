{config, libs, pkgs, ...}:{

programs.nix-ld.enable = true;
programs.nix-ld.libraries = with pkgs; [
  # Add any missing libraries here if you encounter errors later
  libdrm
  mesa
  libxkbcommon
  glib
  nss
  nspr
  dbus
  atk
  cups
  gtk3
  pango
  cairo
  libX11
  libXcomposite
  libXdamage
  libXext
  libXfixes
  electron
  libXrandr
  libgbm
  expat
  stdenv.cc.cc.lib
  libxkbcommon
  libnotify
  alsa-lib
  at-spi2-atk
  libxcb
  spr
];

  }
