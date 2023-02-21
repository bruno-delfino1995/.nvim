return {
  -- language parsing from the future
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update { with_sync = true }
    end,
    config = function()
      local configs = require 'nvim-treesitter.configs'

      configs.setup {
        ensure_installed = 'all', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
        ignore_install = { '' }, -- list of parsers to ignore installing
        highlight = {
          enable = true, -- false will disable the whole extension
          disable = { '' }, -- list of language that will be disabled
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
          disable = { '' },
        },
        rainbow = {
          enable = true,
          disable = { '' }, -- list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      }
    end,
  },

  -- match delimiters with colors
  'p00f/nvim-ts-rainbow',

	-- context aware comments
	{
		'JoosepAlviste/nvim-ts-context-commentstring',
		name = 'ts_context_commentstring'
	},

  -- manipulate comments
  {
    'terrortylor/nvim-comment',
    name = 'nvim_comment',
		dependencies = 'ts_context_commentstring',
		opts = {
			hook = function()
				require("ts_context_commentstring.internal").update_commentstring()
			end
		}
  },

  -- don't leave your delimiters alone, integrates with both cmp and treesitter
  {
    'windwp/nvim-autopairs',
    config = function()
      local npairs = require 'nvim-autopairs'

      npairs.setup {
        check_ts = true,
        ts_config = {
          lua = { 'string', 'source' },
          javascript = { 'string', 'template_string' },
          java = false,
        },
        disable_filetype = { 'TelescopePrompt' },
      }

      local cmp_status_ok, cmp = pcall(require, 'cmp')
      if not cmp_status_ok then
        return
      end

      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
    end,
  },

  -- put end after do in elixir/ruby
  'tpope/vim-endwise',
}
