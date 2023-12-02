-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 
    "ellisonleao/gruvbox.nvim",
    require('plug-cfgs/gruvbox').config(),
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    require('plug-cfgs/nvim-tree').setup(),
    require('plug-cfgs/nvim-tree').config(),
  }

  use 'MattesGroeger/vim-bookmarks'

  use {
    "ahmedkhalf/project.nvim",
    require('plug-cfgs/project').config(),
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
  -- or                            , branch = '0.1.x',
    requires = { {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      'tom-anders/telescope-vim-bookmarks.nvim',
    } },
    require('plug-cfgs/telescope').config(),
  }

  use { 
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    require('plug-cfgs/treesitter').config(),
  }

  -- LSP
  use {
    'williamboman/mason.nvim',
    require('plug-cfgs/mason').config(),
  }
  use {
    'williamboman/mason-lspconfig.nvim',
    require('plug-cfgs/mason-lspconfig').config(),
  }
  use 'neovim/nvim-lspconfig'

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
    tag = "*", 
    requires = 'nvim-tree/nvim-web-devicons',
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
    'akinsho/toggleterm.nvim',
    tag = '*',
	  require('plug-cfgs/toggleterm').config()
  }

end)
