{
  description = "dev env for hersho mono font family";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
        {
          devShells = rec {
            default = hersho_mono_shell;

            hersho_mono_shell = pkgs.mkShell {
              buildInputs = with pkgs; [
                fontforge-gtk
              ];
            };
          };
        }
    ); 
}
