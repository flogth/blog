{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        buildInputs = with pkgs; [ racket ];
        site = with pkgs;
          stdenv.mkDerivation {
            name = "site";
            src = ./.;
            nativeBuildInputs = buildInputs;
            buildPhase = "make -j $NIX_BUILD_CORES";
            installPhase = ''
            cp -r public $out
            cp -r assets $out
            '';
          };

      in {
        defaultPackage = site;
        devShell = pkgs.mkShell { inherit buildInputs; };
      });
}
