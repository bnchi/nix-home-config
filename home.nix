{ config, pkgs, ... }:

{
  # manage.
  home.username = "noor";
  home.homeDirectory = "/Users/noor";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    yarn
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    ripgrep
    qemu
    minikube
    kubectl
  ];

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    EDITOR = "nvim";
  };

  programs.zsh = { 
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    shellAliases = {
      szsh = "source ~/.zshrc";
      nixswitch = "home-manager switch && source ~/.zshrc";
      scala-dev = "nix-shell ~/.config/home-manager/shells/scala.nix";
      postgres-dev = "nix-shell ~/.config/home-manager/shells/postgres.nix";
      python-dev = "nix-shell ~/.config/home-manager/shells/python3.nix";
      rust-dev = "nix-shell ~/.config/home-manager/shells/rust.nix";
    };
    initExtraFirst = ''
      export PS1="> \$ "
    '';
  };

  programs.tmux = { 
    enable = true;
    terminal = "xterm-256color";
    sensibleOnTop = false;
    extraConfig = builtins.readFile ./tmux;
  };

  programs.git = {
    enable = true;
    userName = "Bnchi";
    userEmail = "bnchifahmi@gmail.com";
    extraConfig = {
      branch.autosetuprebase = "always";
      color.ui = true;
      core.askPass = ""; # needs to be empty to use terminal for ask pass
      github.user = "bnchi";
      push.default = "tracking";
      init.defaultBranch = "main";
    };
  };

  programs.go.enable = true;

  programs.neovim = { 
    enable = true;
    plugins = with pkgs.vimPlugins; [
      # plugins
      plenary-nvim
      telescope-nvim
      nvim-lspconfig
      gruvbox
      (nvim-treesitter.withPlugins (p: [ p.c p.rust p.lua ]))
      rust-vim

      # completions
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
    ];
    extraConfig = "${builtins.readFile ./neovim/init.vim}" +
    ''
      lua << EOF
        local tsserver_path = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server"
        local typescript_path = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib"
        ${builtins.readFile ./neovim/init.lua}
      EOF
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
