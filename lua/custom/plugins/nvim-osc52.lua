return {
  'ojroques/nvim-osc52',
  config = function()
    require('osc52').setup {
      max_length = 0,
      silent = false,
      trim = true,
      tmux_passthrough = true,
    }
    vim.keymap.set('n', '<leader>y', require('osc52').copy_operator, { desc = 'Yank to clipboard', expr = true })
    vim.keymap.set('v', '<leader>y', require('osc52').copy_visual, { desc = 'Yank to clipboard' })
  end,
}
