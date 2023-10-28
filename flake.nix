{
  description = "Development-shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = (pkgs.buildFHSUserEnv {
          name = "lean-surreal-numbers";
          targetPkgs = pkgs: (with pkgs; [
            git
            curl
            elan
          ]);
        }).env;
      }
    );
}
