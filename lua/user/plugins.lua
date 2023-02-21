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
		-- plugin manager that can manage itself
		use "wbthomason/packer.nvim"

		-- icons for your filetypes
		use "kyazdani42/nvim-web-devicons"

		-- simple to use package installer
		use "williamboman/mason.nvim"

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
		use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

		-- fuzzy search everything
		use "nvim-telescope/telescope.nvim"

		-- file explorer from need for speed
		use "SidOfc/carbon.nvim"

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
		use "terrortylor/nvim-comment"

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
		use "goolord/alpha-nvim"

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

		-- theme for the night owl
		use "folke/tokyonight.nvim"

		-- snippets engine
		use "L3MON4D3/LuaSnip"

		-- completion plugin
		use "hrsh7th/nvim-cmp"

		-- buffer completions
		use "hrsh7th/cmp-buffer"

		-- path completions
		use "hrsh7th/cmp-path"

		-- cmdline completions
		use "hrsh7th/cmp-cmdline"

		-- lsp completions
		use "hrsh7th/cmp-nvim-lsp"

		-- nvim lua api completions
		use "hrsh7th/cmp-nvim-lua"

		-- snippet completions
		use "saadparwaiz1/cmp_luasnip"

		-- enable LSP
		use "neovim/nvim-lspconfig"

		-- bridge the gap between lsp client and lsp server installation
		use "williamboman/mason-lspconfig.nvim"

		-- don't leave your delimiters alone, integrates with both cmp and treesitter
		use "windwp/nvim-autopairs"

		-- git status to the side
		use "lewis6991/gitsigns.nvim"

		-- git ware (porcelain in progress) for nvim
		use "TimUntersberger/neogit"
	end,
	config = { git = { clone_timeout = 120 } }
})
