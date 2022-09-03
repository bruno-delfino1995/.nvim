local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd("packadd packer.nvim")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins here
return packer.startup({
	function(use)
		-- Packer can manage itself
		use "wbthomason/packer.nvim"

		-- speed up your editor startup so you can have more meetings
		use "lewis6991/impatient.nvim"

		-- fix responsiveness of vim for cursor events
		use "antoinemadec/FixCursorHold.nvim"

		-- popup implementation
		use "nvim-lua/popup.nvim"

		-- useful functions that no one wants to write again
		use "nvim-lua/plenary.nvim"

		-- language parsing from the future
		use {
			"nvim-treesitter/nvim-treesitter",
			run = function()
				require("nvim-treesitter.install").update({ with_sync = true })
			end
		}

		-- match delimiters with colors
		use "p00f/nvim-ts-rainbow"

		-- extension for native fzf
		use {"nvim-telescope/telescope-fzf-native.nvim", run = "make" }

		-- fuzzy search everything
		use "nvim-telescope/telescope.nvim"

		-- manage your projects easily
		use "ahmedkhalf/project.nvim"

		-- better buffer grim reaper
		use "moll/vim-bbye"

		-- never forget your keybinds
		use "folke/which-key.nvim"

		-- indentation indicators
		use "lukas-reineke/indent-blankline.nvim"

		-- enable repeating supported plugin maps with "."
		use "tpope/vim-repeat"

		-- manipulate surroundings with ease
		use "tpope/vim-surround"

		-- configurable statusline
		use "nvim-lualine/lualine.nvim"

		-- manipulate comments
		use "numToStr/Comment.nvim"

		-- context aware comments
		use "JoosepAlviste/nvim-ts-context-commentstring"

		-- commands for unix shell
		use "tpope/vim-eunuch"

		-- delete means delete, not cut
		use "svermeulen/vim-cutlass"

		-- editorconfig for vim
		use "editorconfig/editorconfig-vim"

		-- put end after do in elixir/ruby
		use "tpope/vim-endwise"

		-- sensible defaults
		use "tpope/vim-sensible"

		-- starting point for your vim session with recent files
		use "mhinz/vim-startify"

		-- no more linear undo
		use "mbbill/undotree"

		-- seamless navigation between tmux and vim panes
		use "christoomey/vim-tmux-navigator"

		-- better free writing experience
		use "reedes/vim-pencil"

		-- change word casing with ease
		use "arthurxavierx/vim-caser"

		-- create your own text objects
		use "kana/vim-textobj-user"

		-- text object for foldings
		use "kana/vim-textobj-fold"

		-- text object for entire buffer
		use "kana/vim-textobj-entire"

		-- gruvbox with tree-sitter support
		use "folke/tokyonight.nvim"

		-- completion plugins
		use "hrsh7th/nvim-cmp" -- The completion plugin

		-- buffer completions
		use "hrsh7th/cmp-buffer"

		-- path completions
		use "hrsh7th/cmp-path"

		-- cmdline completions
		use "hrsh7th/cmp-cmdline"

		-- snippet completions
		use "saadparwaiz1/cmp_luasnip"

		-- lsp completions
		use "hrsh7th/cmp-nvim-lsp"

		-- nvim lua api completions
		use "hrsh7th/cmp-nvim-lua"

		-- snippets engine
		use "L3MON4D3/LuaSnip"

		-- enable LSP
		use "neovim/nvim-lspconfig"

		-- simple to use language server installer
		use "williamboman/nvim-lsp-installer"

		-- don't leave your delimiters alone, integrates with both cmp and treesitter
		use "windwp/nvim-autopairs"

		-- git status to the side
		use "lewis6991/gitsigns.nvim"

		-- git ware (porcelain in progress) for nvim
		use "TimUntersberger/neogit"

		-- tree with fruits
		use 'kyazdani42/nvim-web-devicons'

		-- what better than a tree to explore?
		use 'kyazdani42/nvim-tree.lua'

		-- Automatically set up your configuration after cloning packer.nvim
		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end,
	config = { git = { clone_timeout = 120 } }
})
