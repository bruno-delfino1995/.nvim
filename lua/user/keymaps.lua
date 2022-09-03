local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--

-- Cutlass
keymap("n", "x", "d", opts)
keymap("x", "x", "d", opts)

keymap("n", "xx", "dd", opts)
keymap("n", "X", "D", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Reload config
keymap("n", "<leader>ev", ":sp $MYVIMRC<CR>", opts)
keymap("n", "<leader>sv", ":source $MYVIMRC<CR>", opts)

-- Consistency
keymap("n", "U", "<C-r>", opts) -- make `U` behave as redo
keymap("n", "Y", "y$", opts) -- make `Y` more consistent when related to `D` and `C`
keymap("n", "S", "hs", opts) -- make `S` behave like `X`, and keep `s` as `x`

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


keymap("n", "<leader>ff", "<CMD>lua require('telescope.builtin').find_files({ previewer = false, shorten_path = true })<CR>", opts)
keymap("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<CMD>Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "-", "<CMD>lua require('nvim-tree').open_replacing_current_buffer()<CR>", opts)