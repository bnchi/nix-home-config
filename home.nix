{ config, pkgs, ... }:

let 
 vimsettings = import ./vim.nix pkgs;
 tmuxsettings = import ./tmux.nix;
 rustpkgs = import <nixpkgs> { overlays = [(import <rust-overlay>)]; };
 rustlatest = rustpkgs.rust-bin.stable.latest.default.override {
   extensions = ["rust-analyzer"];
  };
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bnchi";
  home.homeDirectory = "/home/bnchi";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    htop
    ripgrep
    mold

    # so neovim can copy to clipboard
    xclip
    wl-clipboard

    # Rust
    rustlatest
    gcc

    ffmpeg
    firefox

    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server

    streamlink
    jq
  ];

  programs.neovim = vimsettings;
  programs.alacritty.enable = true; 
  programs.tmux = tmuxsettings;

  programs.obs-studio = {
    enable = true;
  };

  xsession.windowManager.i3 = {
   enable = true;
   config = {
     keybindings = import ./i3-keybindings.nix "Mod4";
   };
  };

  programs.git = {
    enable = true;
    userName = "Bnchi";
    userEmail = "bnchifahmi@gmail.com";
    extraConfig = {
      branch.autosetuprebase = "always";
      color.ui = true;
      core.askPass = ""; # needs to be empty to use the terminal for ask pass
      github.user = "bnchi";
      push.default = "tracking";
      init.defaultBranch = "main";
    };
  };

  programs.mpv.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {};

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/bnchi/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
