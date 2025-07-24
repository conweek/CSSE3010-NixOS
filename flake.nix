{
  description = "CSSE3010 Development flake for nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self, nixpkgs, flake-utils, ...
  }@inputs:
  (flake-utils.lib.eachDefaultSystem (
    system:
    let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.permittedInsecurePackages = [
          "segger-jlink-qt4-810"
        ];
        config.segger-jlink.acceptLicense = true;
      };
      inherit (nixpkgs) lib;
      
      callPackage = pkgs.newScope (
        pkgs
        // {
        }
        );
    in
    {
      devShells.default = callPackage ./shell.nix { }; 
    }
  ));
}
