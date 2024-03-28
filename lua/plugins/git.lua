return {
  {
    'tpope/vim-fugitive',
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }
    end,
  },
  {
    'ruifm/gitlinker.nvim',
    opts = {
      action_callback = function(url)
        -- yank to unnamed register
        vim.api.nvim_command('let @" = \'' .. url .. "'")
        -- copy to the system clipboard using OSC52
        -- vim.fn.OSCYankString(url)
        vim.print(url)
      end,
      -- TODO: change keymap to something more sensible
    },
  },
}
