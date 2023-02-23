local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap('', '<space>', '<nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--

-- Cutlass
keymap('n', 'x', 'd', opts)
keymap('x', 'x', 'd', opts)

keymap('n', 'xx', 'dd', opts)
keymap('n', 'X', 'D', opts)

-- Normal --
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Consistency
keymap('n', 'U', '<C-r>', opts) -- make `U` behave as redo
keymap('n', 'Y', 'y$', opts) -- make `Y` more consistent when related to `D` and `C`
keymap('n', 'S', 'hs', opts) -- make `S` behave like `X`, and keep `s` as `x`

-- Resize with arrows
keymap('n', '<C-Up>', ':resize +2<cr>', opts)
keymap('n', '<C-Down>', ':resize -2<cr>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<cr>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<cr>', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<cr>', opts)
keymap('n', '<S-h>', ':bprevious<cr>', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('v', '<A-j>', ':m .+1<cr>==', opts)
keymap('v', '<A-k>', ':m .-2<cr>==', opts)

-- Visual Block --
-- Move text up and down
keymap('x', 'J', ":move '>+1<cr>gv-gv", opts)
keymap('x', 'K', ":move '<-2<cr>gv-gv", opts)
keymap('x', '<A-j>', ":move '>+1<cr>gv-gv", opts)
keymap('x', '<A-k>', ":move '<-2<cr>gv-gv", opts)

-- File browser
keymap('n', '-', ':Carbon!<cr>', opts)
