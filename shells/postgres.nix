with import <nixpkgs> {};

mkShell {
  name = "Postgres";
  buildInputs = with pkgs; [
    postgresql
  ];
}
