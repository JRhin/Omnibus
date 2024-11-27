{
 description = "The Omnibus Nix Flake";

 inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

 outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      system = system;
      config = {
        allowUnfree = true;
      };
    };
  in {
    devShell.${system} = with pkgs; mkShell {
      buildInputs = [
        obsidian
      ];
    };
  };
}
