with import <nixpkgs> {};


stdenv.mkDerivation {
    name = "name";

    buildInputs = [
      pkgs.nodejs
    ];
  }



