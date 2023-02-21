return {
  -- theme for the night owl
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 999,
    config = function()
      vim.cmd 'colorscheme tokyonight'
      vim.opt.cursorcolumn = false -- disable column hightlight
      vim.opt.cursorline = false -- disable line hightlight
      vim.cmd "call matchadd('ColorColumn', '\\%81v')" -- hightlight characters at column 81
    end,
  },
}
