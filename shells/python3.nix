with import <nixpkgs> {};

mkShell {
  name = "python";
  buildInputs = with pkgs; [
    python3
  ];
}
