-- TODO: remove since this is built in with nvim 10: https://github.com/ojroques/nvim-osc52?tab=readme-ov-file#nvim-osc52 & https://github.com/neovim/neovim/pull/25872
return {
  'ojroques/nvim-osc52',
  config = function()
    require('osc52').setup {
      max_length = 0,
      silent = false,
      trim = true,
      tmux_passthrough = true,
    }
    -- TODO: remove keymaps since yanking and deleting seem to work over ssh with normal keybinds. figure out why it works
    -- vim.keymap.set('n', '<leader>y', require('osc52').copy_operator, { desc = 'Yank to clipboard', expr = true })
    -- vim.keymap.set('v', '<leader>y', require('osc52').copy_visual, { desc = 'Yank to clipboard' })
  end,
}
