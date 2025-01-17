{ pkgs ? import <nixpkgs> {}
, extraPkgs ? []
}:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    bashInteractive
    pkg-config
    autoreconfHook
    python3.pkgs.setuptools
    python3
    libxslt
    doxygen
    graphviz
  ];
  # fix homeassistant-pyozw build
  NIX_CFLAGS_COMPILE = [ "-Wno-error=format-security" ];
  buildInputs = with pkgs; [
    libxml2
    openssl
    libxslt
    libffi
    udev
    zlib
    ffmpeg
  ] ++ extraPkgs;
}
