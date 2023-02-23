return {
  -- simple to use package installer
  {
    'williamboman/mason.nvim',
    config = true,
  },

  -- bridge the gap between lsp client and lsp server installation
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'ansiblels',
        'bashls',
        'cssls',
        'elixirls',
        'erlangls',
        'fennel_language_server',
        'gopls',
        'html',
        'jsonls',
        'jsonnet_ls',
        'lua_ls',
        'pylsp',
        'rust_analyzer',
        'terraformls',
        'tsserver',
        'yamlls',
      },
    },
  },

  -- enable LSP
  'neovim/nvim-lspconfig',

  -- list your tokens in a side buffer
  {
    'stevearc/aerial.nvim',
    config = true,
  },

  -- stop opening files in your info splits
  {
    'stevearc/stickybuf.nvim',
    config = true,
  },
}
