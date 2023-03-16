{
  description = "Tree-sitter parser for EdgeQL query language for the EdgeDB database";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs;
              [
                clang
                libiconv
                nodejs-18_x
              ] ++ (if stdenv.isDarwin then [ libiconv clang ] else [ gcc ]);
          };
        });
}
