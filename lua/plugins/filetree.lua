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
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
      -- see: https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/370#discussioncomment-4144005
      -- TODO: integrate with telescope for menu and actions
      window = {
        mappings = {
          ['Y'] = function(state)
            -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
            -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local filename = node.name
            local modify = vim.fn.fnamemodify

            local results = {
              filepath,
              modify(filepath, ':.'),
              modify(filepath, ':~'),
              filename,
              modify(filename, ':r'),
              modify(filename, ':e'),
            }

            -- absolute path to clipboard
            local i = vim.fn.inputlist {
              'Choose to copy to clipboard:',
              '1. Absolute path: ' .. results[1],
              '2. Path relative to CWD: ' .. results[2],
              '3. Path relative to HOME: ' .. results[3],
              '4. Filename: ' .. results[4],
              '5. Filename without extension: ' .. results[5],
              '6. Extension of the filename: ' .. results[6],
            }

            if i > 0 then
              local result = results[i]
              if not result then
                return print('\nInvalid choice: ' .. i)
              end
              vim.fn.setreg('"', result)
              -- vim.api.nvim_command('let @" = \'' .. result .. "'")
              print('\n Copied:', result)
            end
          end,
        },
      },
    }

    vim.keymap.set('n', '<leader>n', ':Neotree toggle filesystem right<CR>', { desc = 'Toggle filetree' })
  end,
}
