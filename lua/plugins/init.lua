return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim' }

    use { 'folke/tokyonight.nvim' }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons',
        },
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
          require "plugins.configs.nvimtree"
        end,
    }

    use {
        "williamboman/mason.nvim",
        config = function()
            require "plugins.configs.mason"
        end,

    }

    use {
        'neovim/nvim-lspconfig',
        config = function()
            require "plugins.configs.lspconfig"
        end,
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
          require "plugins.configs.treesitter"
        end,
    }

    use {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require "plugins.configs.treesitter-context"
        end,
    }

    use { 'nvim-treesitter/playground' }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} },
        cmd = "Telescope",
        config = function()
          require "plugins.configs.telescope"
        end,
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "plugins.configs.blankline"
        end,
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require "plugins.configs.lualine"
        end,
    }

    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require "plugins.configs.bufferline"
        end,
    }

end)
