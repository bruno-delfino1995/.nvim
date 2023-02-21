-- :help options

-- Base Settings {{{

vim.opt.shell = '/bin/zsh'
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.cmd 'filetype off' -- do not load $runtime/filetype.vim files
vim.cmd 'filetype plugin indent on' -- auto load plugin filetypes and indent specs
vim.cmd 'syntax on' -- enable syntax highlighting
vim.opt.errorbells = false -- no beeps
vim.opt.backspace = { 'indent', 'eol', 'start' } -- makes backspace key more powerful.
vim.opt.clipboard = 'unnamedplus' -- use X11 Clipboard
vim.opt.autoread = true -- automatically reread changed files without asking me anything
vim.opt.fileformats = { 'unix', 'dos', 'mac' } -- prefer Unix over Windows over OS 9 formats
vim.opt.encoding = 'utf-8' -- set default encoding to UTF-8
vim.opt.ttyfast = true -- improves performance of redrawing by signalizing a fast terminal connection
vim.opt.wildmenu = true -- show a menu for tab completion
vim.opt.modeline = true -- allow lines on extremities to contain vim config - `vim:foldmethod=marker:foldlevel=0`
vim.opt.modelines = 2 -- amount of lines to check on extremities for modelines - 2 at least because of shebang
vim.opt.hidden = true -- allow to change buffers without writing changes
vim.opt.joinspaces = false -- prevents double spaces after punctuation when joining with `J`
vim.opt.linebreak = true -- makes vim break line only on whitespaces
vim.opt.autoindent = true -- start next line at same level as current
vim.opt.smartindent = true -- guess the next indenting and start the line correctly
vim.opt.sessionoptions = { 'blank', 'curdir', 'folds', 'help', 'tabpages', 'winsize' } -- what to persist on :mksession
vim.opt.signcolumn = 'number' -- merge signcolumn and number column into one

-- }}}

-- Backups {{{

-- prevents lsp server errors coc.vim#649
vim.opt.backup = false -- don't write backup for current buffer
vim.opt.writebackup = false -- don't write backups befory overwriting the actual file

-- vim.opt.updatetime = 300 -- lower value for swap write wait threshold
vim.opt.undofile = true -- allow undos even after file has been closed and reopened
vim.opt.backupdir = { '/var/tmp', '/tmp' }
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }

-- }}}

-- Cursor Configuration {{{

vim.o.t_SI = '\\<Esc>[6 q' -- pipe on insert
vim.o.t_SR = '\\<Esc>[4 q' -- underscore on replace
vim.o.t_EI = '\\<Esc>[2 q' -- block on everything else

-- }}}

-- Rendering Settings {{{

vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show line numbers relative to cursor position
vim.opt.showcmd = true -- show me what I'm typing
vim.opt.showmode = false -- show current mode.
vim.opt.wrap = false -- do not wrap long lines
vim.opt.lazyredraw = true -- disables unnecessary redrawings, like on middle of macros
vim.opt.laststatus = 2 -- controls whether to show the bottom status line
vim.opt.showtabline = 1 -- shows tabline when there's more than one tab
vim.opt.list = true -- show invisible characters
vim.opt.listchars = { tab = '<->', eol = '¬', trail = '~', extends = '>', precedes = '<', nbsp = '%' } -- invisible characters representation
-- vim.opt.listchars:append({ space = "·" })
vim.opt.cmdheight = 2 -- more space for displaying messages.
vim.opt.shortmess:append 'c' -- don't display messages about completions
vim.opt.signcolumn = 'yes' -- always show sign column

-- vertical/horizontal scroll off settings
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 7
vim.opt.sidescroll = 1

-- }}}

-- Split Settings {{{

vim.opt.splitright = true -- split vertical windows right to the current windows
vim.opt.splitbelow = true -- split horizontal windows below to the current windows

-- }}}

-- Tab & Folding Settings {{{

vim.opt.expandtab = true -- tabs are spaces
vim.opt.shiftwidth = 2 -- number of spaces by indent
vim.opt.tabstop = 2 -- number of visual spaces per TAB
vim.opt.softtabstop = 2 -- number of spaces in tab when editing
vim.opt.foldenable = true -- enable folding
vim.opt.foldmethod = 'indent' -- fold based on indent level
vim.opt.foldlevelstart = 5 -- open 10 folds by default
vim.opt.foldnestmax = 10 -- limits folds to 10

-- }}}

-- Searching Settings {{{

vim.opt.showmatch = false -- do not show matching brackets by flickering
vim.opt.incsearch = true -- shows the match while typing
vim.opt.hlsearch = true -- highlight found searches
vim.opt.ignorecase = true -- search case insensitive...
vim.opt.smartcase = true -- ... but not when search pattern contains upper case characters

-- }}}

-- Completion Settings {{{

vim.opt.completeopt = { 'menuone', 'noinsert', 'preview' }

-- }}}
