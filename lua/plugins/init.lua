return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'folke/tokyonight.nvim'

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

    use 'nvim-treesitter/playground'

end)
