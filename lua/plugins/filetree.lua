return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          never_show = {
            '.git',
            'node_modules',
            '.DS_Store',
          },
        },
      },
    }

    vim.keymap.set('n', '<leader>n', ':Neotree toggle filesystem right<CR>', { desc = 'Toggle filetree' })
  end,
}
