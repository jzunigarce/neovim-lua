local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Your plugins go here
  use "Mofiqul/dracula.nvim"
  use "morhetz/gruvbox"
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  use 'nvim-tree/nvim-web-devicons'

  -- lualine
  use 'nvim-lualine/lualine.nvim'
  use {
    'nvim-tree/nvim-tree.lua',
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- using packer.nvim
  use {'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons'}
  use "lukas-reineke/indent-blankline.nvim"
  use {"akinsho/toggleterm.nvim"}
  use 'tpope/vim-fugitive'
  use 'editorconfig/editorconfig-vim'
   -- use {
    --  'nvim-treesitter/nvim-treesitter',
    -- },
   -- use {
    --  'numToStr/Comment.nvim'
    --},
  
end)
require("plugins/nvim-web-devicons")
require("plugins/lualine")
require("plugins/nvim-tree")
require("plugins/telescope-nvim")
require("plugins/bufferline")
require("plugins/indent-blankline")
require("plugins/editorconfig")
-- require("plugins/treesitter-nvim")
-- require("plugins/comment")
