return {
  -- manipulate surroundings with ease
  'tpope/vim-surround',

  -- delete means delete, not cut
  'svermeulen/vim-cutlass',

  -- editorconfig for vim
  'editorconfig/editorconfig-vim',

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

  -- text object for entire buffer
  {
    'kana/vim-textobj-entire',
    dependencies = {
      -- create your own text objects
      'kana/vim-textobj-user',
    },
  },
}
