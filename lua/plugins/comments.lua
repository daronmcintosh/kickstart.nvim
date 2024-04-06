return {
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
    lazy = false,
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    opts = {},
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end,
  },
}
