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
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- using packer.nvim
    use { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' }
    use "lukas-reineke/indent-blankline.nvim"
    use { "akinsho/toggleterm.nvim" }
    use 'tpope/vim-fugitive'
    use 'editorconfig/editorconfig-vim'

    -- LSP server
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- Soporte LSP
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'neovim/nvim-lspconfig' },
            -- Autocompletado
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use "jwalton512/vim-blade"
    use "windwp/nvim-autopairs"
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        "folke/zen-mode.nvim"
    }
    use { 'prettier/vim-prettier', run = 'npm install' }
end)

require("plugins/nvim-web-devicons")
require("plugins/lualine")
require("plugins/nvim-tree")
require("plugins/telescope-nvim")
require("plugins/bufferline")
require("plugins/indent-blankline")
require("plugins/editorconfig")
require("plugins/toogleterm-nvim")
require("plugins/lsp-zero-nvim")
require("plugins/windwp-nvim-autopairs")
require("plugins/trouble-nvim")
require("plugins/treesitter-nvim")
require("plugins/vue-template")
