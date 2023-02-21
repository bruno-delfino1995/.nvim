return {
  -- fix responsiveness of vim for cursor events
  'antoinemadec/FixCursorHold.nvim',

  -- better buffer grim reaper
  'moll/vim-bbye',

  -- enable repeating supported plugin maps with "."
  'tpope/vim-repeat',

  -- manipulate surroundings with ease
  'tpope/vim-surround',

  -- commands for unix shell
  'tpope/vim-eunuch',

  -- delete means delete, not cut
  'svermeulen/vim-cutlass',

  -- editorconfig for vim
  'editorconfig/editorconfig-vim',

  -- sensible defaults
  'tpope/vim-sensible',

  -- no more linear undo
  'mbbill/undotree',

  -- seamless navigation between tmux and vim panes
  'christoomey/vim-tmux-navigator',

  -- better free writing experience
  'reedes/vim-pencil',

  -- change word casing with ease
  'arthurxavierx/vim-caser',

  -- text object for foldings
  {
    'kana/vim-textobj-fold',
    dependencies = {
      -- create your own text objects
      'kana/vim-textobj-user',
    },
  },

  {
    -- text object for entire buffer
    'kana/vim-textobj-entire',
    dependencies = {
      -- create your own text objects
      'kana/vim-textobj-user',
    },
  },
}
