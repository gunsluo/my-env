-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    "ellisonleao/gruvbox.nvim",
  }

  use 'MattesGroeger/vim-bookmarks'

  -- LSP
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
  }

  use {
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'VonHeikemen/lsp-zero.nvim'

  use {
    'ray-x/lsp_signature.nvim',
  }

  use {
    'numToStr/Comment.nvim',
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      'tom-anders/telescope-vim-bookmarks.nvim',
    } },
  }

  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use {
    'Shatur/neovim-session-manager',
  }

  use {
    "ahmedkhalf/project.nvim",
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }


  require('plug-cfgs/gruvbox').config()
  require('plug-cfgs/mason').config()
  require('plug-cfgs/mason-lspconfig').config()
  require('plug-cfgs/comment').config()
  require('plug-cfgs/telescope').setup()
  require('plug-cfgs/telescope').config()

  require('plug-cfgs/bufferline').setup()
  require('plug-cfgs/bufferline').config()
  require('plug-cfgs/nvim-tree').setup()
  require('plug-cfgs/nvim-tree').config()
  require('plug-cfgs/nvim-session-manager').config()
  require('plug-cfgs/project').config()

  -- re-install to run TSInstall
  require('plug-cfgs/treesitter').config()
  -- lsp config
  require('plug-cfgs/lsp/config').setup()
end)
