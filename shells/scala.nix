with import <nixpkgs> {};

mkShell {
  name = "Scala";
  buildInputs = with pkgs; [
    sbt
    jdk
    coursier
    scala
  ];

  shellHook = ''
    echo "done"
    '';
}
