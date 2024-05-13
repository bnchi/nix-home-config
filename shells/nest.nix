with import <nixpkgs> {};

mkShell {
  name = "Java";
  buildInputs = with pkgs; [
    nest-cli
  ];

  shellHook = ''
    echo "done"
    '';
}
