return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {}

    vim.keymap.set('n', '<leader>n', ':Neotree toggle filesystem right<CR>', { desc = 'Toggle filetree' })
  end,
}
