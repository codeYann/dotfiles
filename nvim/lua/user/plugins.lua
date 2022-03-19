local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- Themes
	use("EdenEast/nightfox.nvim")
	use("shaunsingh/nord.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- Completions
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- Autopairs
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

	-- LPS config
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Commenter
	use("numToStr/Comment.nvim")

	-- Git integration
	use("lewis6991/gitsigns.nvim")

	-- Bufferlines
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- Nvim-tree
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	-- Colorize
	use("norcalli/nvim-colorizer.lua")

	-- LuaLine
	use("nvim-lualine/lualine.nvim")

	-- toggleterm
	use("akinsho/toggleterm.nvim")

	-- Project
	use("ahmedkhalf/project.nvim")

	-- Impatient
	use("lewis6991/impatient.nvim")

	-- Indent
	use("lukas-reineke/indent-blankline.nvim")

	-- Alpha
	use("goolord/alpha-nvim")

	-- Rust-tools
	use("simrat39/rust-tools.nvim")

	-- null-ls
	use("jose-elias-alvarez/null-ls.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
