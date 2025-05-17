{
  # Based on https://github.com/bobvanderlinden/templates/blob/master/ruby/flake.nix
  # Useage: see README.md
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
};

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        memorial = pkgs.bundlerEnv {
          name = "memorialGems";
          gemfile = ./Gemfile;
          lockfile = ./Gemfile.lock;
          gemset = ./gemset.nix;
        };
      in {

      defaultPackage = memorial;

      # used by nix shell and nix develop
      devShell = with pkgs;
        mkShell {
          buildInputs = [
            ruby_3_4
            libyaml
            bundix
            memorial  # Include the bundled gems environment
          ];
          
          # Make sure bin directory from bundled gems is in PATH
          shellHook = ''
            export PATH="${memorial}/bin:$PATH"
          '';
      };
  });
}