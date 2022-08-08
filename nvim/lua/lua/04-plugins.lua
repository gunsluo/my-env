-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 
	  'ellisonleao/gruvbox.nvim',
	  require('plug-cfgs/gruvbox').config(),
  }
  use {
	  'kyazdani42/nvim-tree.lua',
	  requires = {
		  'kyazdani42/nvim-web-devicons', -- optional, for file icons
	  },
	  tag = 'nightly', -- optional, updated every week. (see issue #1193)
	  require('plug-cfgs/nvim-tree').setup(),
	  require('plug-cfgs/nvim-tree').config(),
  }

  use 'MattesGroeger/vim-bookmarks'

	use {
		"ahmedkhalf/project.nvim",
	  require('plug-cfgs/project').config(),
		}

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { 
		  'nvim-lua/plenary.nvim',
		  'nvim-telescope/telescope-fzy-native.nvim',
		  'nvim-telescope/telescope-live-grep-args.nvim',
		  'tom-anders/telescope-vim-bookmarks.nvim',
	  },
	  require('plug-cfgs/telescope').config(),
  }

  use { 
	  'nvim-treesitter/nvim-treesitter',
	  run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	  require('plug-cfgs/treesitter').config(),
  }

	-- LSP
	use 'neovim/nvim-lspconfig'
	use {
		'williamboman/nvim-lsp-installer',
	  require('plug-cfgs/lsp-installer').config(),
	}

	use {
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
	}

	use {
		'hrsh7th/nvim-cmp',
	  requires = {
		  'onsails/lspkind-nvim',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
	  },
	  require('plug-cfgs/nvim-cmp').config(),
	}

	use 'hrsh7th/cmp-nvim-lsp'

	use {
		'ray-x/lsp_signature.nvim',
	}

  use {
    'akinsho/bufferline.nvim', 
    tag = "v2.*", 
    requires = 'kyazdani42/nvim-web-devicons',
	  require('plug-cfgs/bufferline').setup(),
	  require('plug-cfgs/bufferline').config()
  }

  use {
    'terrortylor/nvim-comment',
	  require('plug-cfgs/nvim-comment').config()
	}

  use {
    'Shatur/neovim-session-manager',
	  require('plug-cfgs/nvim-session-manager').config()
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = 'v2.*',
	  require('plug-cfgs/toggleterm').config()
  }

end)

