with import <nixpkgs> {};

mkShell {
  name = "python";
  buildInputs = with pkgs; [
    rustc 
    cargo 
    rustfmt 
    rustPackages.clippy 
    rust-analyzer
  ];
}

