return {
  -- icons for your filetypes
  'kyazdani42/nvim-web-devicons',

  -- starting point for your vim session with recent files
  {
    'goolord/alpha-nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      local alpha = require 'alpha'
      alpha.setup(require('alpha.themes.startify').config)
    end,
  },

  -- indentation indicators
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      local indent_blankline = require 'indent_blankline'

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

      indent_blankline.setup {
        -- show_end_of_line = true,
        -- space_char_blankline = " ",
        show_current_context = true,
        -- show_current_context_start = true,
        -- char_highlight_list = {
        --   "IndentBlanklineIndent1",
        --   "IndentBlanklineIndent2",
        --   "IndentBlanklineIndent3",
        -- },
      }
    end,
  },

  -- configurable statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      local lualine = require 'lualine'

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
        local current_line = vim.fn.line '.'
        local total_lines = vim.fn.line '$'
        local chars = { '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██' }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return chars[index]
      end

      lualine.setup {
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
      }
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
    'folke/zen-mode.nvim',
    config = true,
  },

  -- focus only on what you're editing
  {
    'folke/twilight.nvim',
    config = true,
  },
}
