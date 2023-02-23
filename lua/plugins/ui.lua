return {
  -- icons for your filetypes
  'kyazdani42/nvim-web-devicons',

  -- starting point for your vim session with recent files
  {
    'goolord/alpha-nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    event = 'VimEnter',
    config = function()
      local alpha = require('alpha')
      alpha.setup(require('alpha.themes.startify').config)
    end,
  },

  -- indentation indicators
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      local indent_blankline = require('indent_blankline')

      vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
      vim.g.indent_blankline_filetype_exclude = {
        'help',
        'alpha',
        'packer',
        'neogitstatus',
        'carbon.explorer',
        'Trouble',
      }
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = '│'
      -- vim.g.indent_blankline_char = "▏"
      -- vim.g.indent_blankline_char = "▎"
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = true
      vim.g.indent_blankline_use_treesitter = true
      vim.g.indent_blankline_show_current_context = true
      vim.g.indent_blankline_context_patterns = {
        'class',
        'return',
        'function',
        'method',
        '^if',
        '^while',
        'jsx_element',
        '^for',
        '^object',
        '^table',
        'block',
        'arguments',
        'if_statement',
        'else_clause',
        'jsx_element',
        'jsx_self_closing_element',
        'try_statement',
        'catch_clause',
        'import_statement',
        'operation_type',
      }
      -- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
      vim.wo.colorcolumn = '99999'

      -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
      -- vim.opt.list = true
      -- vim.opt.listchars:append "space:⋅"
      -- vim.opt.listchars:append "space:"
      -- vim.opt.listchars:append "eol:↴"

      indent_blankline.setup({
        -- show_end_of_line = true,
        -- space_char_blankline = " ",
        show_current_context = true,
        -- show_current_context_start = true,
        -- char_highlight_list = {
        --   "IndentBlanklineIndent1",
        --   "IndentBlanklineIndent2",
        --   "IndentBlanklineIndent3",
        -- },
      })
    end,
  },

  -- configurable statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      local lualine = require('lualine')

      local hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end

      local diagnostics = {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn' },
        symbols = { error = ' ', warn = ' ' },
        colored = true,
        update_in_insert = false,
        always_visible = true,
      }

      local diff = {
        'diff',
        colored = true,
        symbols = { added = ' ', modified = ' ', removed = ' ' },
        cond = hide_in_width,
      }

      local mode = {
        'mode',
      }

      local filename = {
        'filename',
        file_status = true,
        newfile_status = false,
        path = 0,
        symbols = {
          modified = '[+]',
          readonly = '[-]',
          unnamed = '[?]',
          newfile = '[#]',
        },
      }

      local branch = {
        'branch',
        icons_enabled = true,
        icon = '',
      }

      local location = {
        'location',
      }

      local progress = function()
        local current_line = vim.fn.line('.')
        local total_lines = vim.fn.line('$')
        local chars = { '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██' }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return chars[index]
      end

      lualine.setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '|', right = '|' },
          section_separators = { left = '', right = '' },
          ignore_focus = { 'carbon.explorer' },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { mode },
          lualine_b = { filename },
          lualine_c = {},
          lualine_x = { branch, diff },
          lualine_y = { diagnostics },
          lualine_z = { location, progress },
        },
      })
    end,
  },

  -- what's the LSP doing?
  {
    'j-hui/fidget.nvim',
    config = true,
  },

  -- just because they're errors doesn't mean they have to be ugly
  {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = true,
  },

  -- no more neck pain for focused work
  {
    'shortcuts/no-neck-pain.nvim',
    config = true,
  },

  {
    'stevearc/dressing.nvim',
    opts = {
      input = {
        -- Set to false to disable the vim.ui.input implementation
        enabled = true,

        -- Default prompt string
        default_prompt = 'Input:',

        -- Can be 'left', 'right', or 'center'
        prompt_align = 'left',

        -- When true, <Esc> will close the modal
        insert_only = true,

        -- When true, input will start in insert mode.
        start_in_insert = true,

        -- These are passed to nvim_open_win
        anchor = 'SW',
        border = 'rounded',
        -- 'editor' and 'win' will default to being centered
        relative = 'cursor',

        -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        prefer_width = 40,
        width = nil,
        -- min_width and max_width can be a list of mixed types.
        -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
        max_width = { 140, 0.9 },
        min_width = { 20, 0.2 },

        buf_options = {},
        win_options = {
          -- Window transparency (0-100)
          winblend = 10,
          -- Disable line wrapping
          wrap = false,
        },

        -- Set to `false` to disable
        mappings = {
          n = {
            ['<Esc>'] = 'Close',
            ['<CR>'] = 'Confirm',
          },
          i = {
            ['<C-c>'] = 'Close',
            ['<CR>'] = 'Confirm',
            ['<Up>'] = 'HistoryPrev',
            ['<Down>'] = 'HistoryNext',
          },
        },

        override = function(conf)
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          return conf
        end,

        -- see :help dressing_get_config
        get_config = nil,
      },
      select = {
        -- Set to false to disable the vim.ui.select implementation
        enabled = true,

        -- Priority list of preferred vim.select implementations
        backend = { 'telescope', 'fzf', 'builtin', 'nui' },

        -- Trim trailing `:` from prompt
        trim_prompt = true,

        -- Options for telescope selector
        -- These are passed into the telescope picker directly. Can be used like:
        -- telescope = require('telescope.themes').get_ivy({...})
        telescope = nil,

        -- Options for fzf selector
        fzf = {
          window = {
            width = 0.5,
            height = 0.4,
          },
        },

        -- Options for fzf_lua selector
        fzf_lua = {
          winopts = {
            width = 0.5,
            height = 0.4,
          },
        },

        -- Options for nui Menu
        nui = {
          position = '50%',
          size = nil,
          relative = 'editor',
          border = {
            style = 'rounded',
          },
          buf_options = {
            swapfile = false,
            filetype = 'DressingSelect',
          },
          win_options = {
            winblend = 10,
          },
          max_width = 80,
          max_height = 40,
          min_width = 40,
          min_height = 10,
        },

        -- Options for built-in selector
        builtin = {
          -- These are passed to nvim_open_win
          anchor = 'NW',
          border = 'rounded',
          -- 'editor' and 'win' will default to being centered
          relative = 'editor',

          buf_options = {},
          win_options = {
            -- Window transparency (0-100)
            winblend = 10,
          },

          -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- the min_ and max_ options can be a list of mixed types.
          -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
          width = nil,
          max_width = { 140, 0.8 },
          min_width = { 40, 0.2 },
          height = nil,
          max_height = 0.9,
          min_height = { 10, 0.2 },

          -- Set to `false` to disable
          mappings = {
            ['<Esc>'] = 'Close',
            ['<C-c>'] = 'Close',
            ['<CR>'] = 'Confirm',
          },

          override = function(conf)
            -- This is the config that will be passed to nvim_open_win.
            -- Change values here to customize the layout
            return conf
          end,
        },

        -- Used to override format_item. See :help dressing-format
        format_item_override = {},

        -- see :help dressing_get_config
        get_config = nil,
      },
    },
  },
}
