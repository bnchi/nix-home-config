with import <nixpkgs> {};

mkShell {
  name = "Java";
  buildInputs = with pkgs; [
    jdk
    maven
  ];

  shellHook = ''
    echo "done"
    '';
}
