vim.cmd('colorscheme gruvbox')
vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })

vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set('n', '<leader>se', vim.diagnostic.open_float)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

-- Setup autocomplete and the lsp 
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require 'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- Rust stuff
vim.g.rustfmt_autosave = 1
vim.g.rustfmt_emit_files = 1
vim.g.rustfmt_fail_silently = 0

require'lspconfig'.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        enable = false
      },
      diagonstics = {
        enable = false,
      },
      cargo = {
       allFeatures = true,
      },
    }
  }
}

require 'lspconfig'.tsserver.setup { capabilities = capabilities }


vim.keymap.set('n', '<leader>mc', ":make c<CR>")
vim.keymap.set('n', '<leader>ro', ":RustTest<CR>")
vim.keymap.set('n', '<leader>ra', ":RustTest!<CR>")
