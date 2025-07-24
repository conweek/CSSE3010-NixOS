{ pkgs ? import <nixpkgs> {}, ... }:
pkgs.mkShell {
  
    packages = [
      pkgs.screen
      pkgs.gcc-arm-embedded
      pkgs.segger-jlink
      (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.pylink-square
      ]))
      ];
  
      shellHook = ''
      export ROOT_PATH=$(git rev-parse --show-toplevel)
      export SOURCELIB_ROOT=$ROOT_PATH
      export PATH=$SOURCELIB_ROOT/tools:$PATH
      export PATH=$HOME/.local/bin:$PATH
      export LD_LIBRARY_PATH=${pkgs.segger-jlink}/bin:$LD_LIBRARY_PATH
      export PATH=${pkgs.segger-jlink}:$PATH
    '';
}
