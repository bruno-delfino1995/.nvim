return {
  -- organize your life inside neovim
  {
    'nvim-neorg/neorg',
    ft = 'norg',
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.norg.concealer'] = {},
        ['core.norg.completion'] = {
          config = { engine = 'nvim-cmp' },
        },
        ['core.integrations.nvim-cmp'] = {},
      },
    },
  },

  -- tabpage for diffs
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
    config = true,
    keys = { { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'DiffView' } },
  },
}
