{ pkgs, ... }:

let
  common = import ./common.nix { inherit pkgs; };
in
pkgs.mkShell {
  name = "kompile";

  packages = with pkgs; [
    # build essentials
    gcc
    gnumake
    cmake
    pkg-config
    binutils
    file

    # rust
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer

    # python
    python3
    python3Packages.pip
    python3Packages.virtualenv
    python3Packages.setuptools

    # common native deps
    openssl
    openssl.dev
    zlib
    libffi
    alsa-lib
  ] ++ common.packages;

  shellHook = ''
    export DEVSHELL_NAME="kompile"
    export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"

    ${common.shellHook}

    echo "rustc:  $(rustc --version)"
    echo "cargo:  $(cargo --version)"
    echo "python: $(python3 --version)"
  '';
}
