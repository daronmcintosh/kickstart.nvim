return {
  'ruifm/gitlinker.nvim',
  opts = {
    action_callback = function(url)
      -- yank to unnamed register
      vim.api.nvim_command('let @" = \'' .. url .. "'")
      -- copy to the system clipboard using OSC52
      -- vim.fn.OSCYankString(url)
      vim.print(url)
    end,
  },
}
