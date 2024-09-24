{
  description = "optimParallel-python";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
    {
      defaultPackage.x86_64-linux = pkgs.python3Packages.buildPythonPackage rec {
        pname = "optimparallel";
        version = "0.1.3";

        # Specify source of the package from GitHub
        src = pkgs.fetchFromGitHub {
          owner = "florafauna";
          repo = "optimParallel-python";
          rev = "f6f61dc143fde148db7beb346775993caa18f8ff";  # Actual commit hash
          sha256 = "sha256-R9vxLNDsTQky9HSFtCuvnXIUGsSll0J7V9ePCI6xdx4=";  # Replace with actual SHA256 hash
        };

        # Specify Python package dependencies
        propagatedBuildInputs = with pkgs.python3Packages; [
          numpy
          scipy
        ];

        # Meta information about the package
        meta = with pkgs.lib; {
          description = "A parallel version of scipy.optimize.minimize(method='L-BFGS-B')";
          license = licenses.mit;
        };

      };
    };
}
