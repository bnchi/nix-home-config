pkgs:
{
  enable = true;
  plugins = with pkgs.vimPlugins; [
# plugins
    plenary-nvim
    telescope-nvim
    nvim-lspconfig
    rust-vim
    gruvbox

    # completions
    nvim-cmp
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
  ];

  extraConfig = ''
    set scrolloff=8
    set number
    set relativenumber
    set tabstop=2 softtabstop=4
    set shiftwidth=2
    set expandtab
    set smartindent
    set noswapfile
    set guicursor=
    set clipboard+=unnamed,unnamedplus
    '' + 
    '' 
    lua << EOF 
    local tsserver_path = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server"
    local typescript_path = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib"
    ${builtins.readFile ./neovim/init.lua} 
  EOF 
    '';
}
