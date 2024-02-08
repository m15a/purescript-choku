{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    purs-overlay = {
      url = "github:thomashoneyman/purescript-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, purs-overlay, ... }:
  flake-utils.lib.eachDefaultSystem (system:
  let
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        purs-overlay.overlays.default
      ];
    };
  in
  {
    devShells.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        esbuild
        nodejs
        purs
        purs-backend-es
        spago-unstable
        purs-tidy
        purescript-language-server
      ];
    };
  });
}
