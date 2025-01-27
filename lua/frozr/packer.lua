vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "catppuccin/nvim", as = "catppuccin" }

  use { "scottmckendry/cyberdream.nvim", as = "cyberdream"}

  use { 'f-person/git-blame.nvim' }

  use { 'navarasu/onedark.nvim', as = "onedark" }

  use { 'xiyaowong/transparent.nvim', as = "transparent" }

  use { 'mfussenegger/nvim-dap', as = "dap" }

  use { 'leoluz/nvim-dap-go', as = "dap-go" }

  use { 'nvim-neotest/nvim-nio' }

  use { 'rcarriga/nvim-dap-ui' }

  use { 'theHamsta/nvim-dap-virtual-text' } 

  use { 'folke/trouble.nvim', as = "trouble" }

  use { 'tpope/vim-fugitive', as = "fugitive" }

  use { 'folke/tokyonight.nvim', as = "tokyonight" }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('theprimeagen/harpoon')

  use('mbbill/undotree')

  use {
	'VonHeikemen/lsp-zero.nvim',
	requires = {
		{'neovim/nvim-lspconfig'},
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},
		{'hrsh7th/nvim-cmp'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-path'},
		{'saadparwaiz1/cmp_luasnip'},
		{'hrsh7th/cmp-nvim-lua'},
		{'L3MON4D3/LuaSnip'},
		{'rafamadriz/friendly-snippets'},
	}
  }
end)
