{
  description = "a project!";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.tar.gz";
  };

  outputs =
    { self
    , nixpkgs
    , ...
    } @ inputs:
    {
      devShells = let pkgs = nixpkgs.legacyPackages.x86_64-linux; in {
        x86_64-linux.default = pkgs.mkShell {
          buildInputs = [ pkgs.toml-cli ];
        };
      };
    };
}
