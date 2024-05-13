with import <nixpkgs> {};

mkShell {
  name = "bun";
  buildInputs = with pkgs; [
    bun
  ];

  shellHook = ''
    echo "done"
    '';
}
