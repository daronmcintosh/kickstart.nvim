return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.code_actions.gitsigns,
      },
    }
    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { desc = 'Format document' })
  end,
}