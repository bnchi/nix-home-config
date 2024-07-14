with import <nixpkgs> {};

mkShell {
  name = "rust";
  buildInputs = with pkgs; [
    rustc 
    cargo 
    rustfmt 
    rustPackages.clippy 
    rust-analyzer
  ];
}

