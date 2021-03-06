-- auto install
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
end
vim.cmd [[packadd packer.nvim]]

local ok, packer = pcall(require, "packer")


if not ok then
    return
end


packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
        prompt_border = "single",
    },
    git = {
        clone_timeout = 600,
    },
    auto_clean = true,
    compile_on_sync = true,
}

return packer.startup(function(use)
    use { "wbthomason/packer.nvim" }

    -- UI
    use { "rebelot/kanagawa.nvim" }
    use { "folke/which-key.nvim" }
    --[[
    use { "kyazdani42/nvim-web-devicons", config = require "plugins.configs.icons" }
    use {
        "nvim-lualine/lualine.nvim",
        config = require "plugins.configs.lualine",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    }
    use {
        "akinsho/bufferline.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = require "plugins.configs.bufferline",
    }
    use { "karb94/neoscroll.nvim", config = require "plugins.configs.neoscroll" }
    ]]--

    -- Syntax
    -- use { "alaviss/nim.nvim" }
    use { "bfrg/vim-cpp-modern" }
    --use { "0rn/nim_syntax.vim" }
    use "~/Programming/nim/syntax"
    --[[
    use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
            "windwp/nvim-ts-autotag",
            "p00f/nvim-ts-rainbow",
        },
        run = ":TSUpdate",
        config = require "plugins.configs.treesitter",
    }
    ]]--

    -- Utilities
    --[[
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        config = require "plugins.configs.nvimtree",
    }
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = require "plugins.configs.telescope",
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    ]]--
    --use { "lukas-reineke/indent-blankline.nvim", config = 'require "plugins.configs.indent"' }
    --use { "windwp/nvim-autopairs", config = require "plugins.configs.autopairs" }
    use { "tpope/vim-surround" }
    use { "norcalli/nvim-colorizer.lua", config = 'require "plugins.configs.colorizer"' }

    -- LSP
    use { "neovim/nvim-lspconfig" }
    --[[use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }

    ]]--
    -- -- Comment
    --use { "numToStr/Comment.nvim", config = 'require "plugins.configs.comment"' }


    -- Snippets
    use { "L3MON4D3/LuaSnip" }
    
    -- Completion
    use {
        "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lua",
                "saadparwaiz1/cmp_luasnip",
       },
       -- needs to be a string or return a function
        config = 'require("plugins.configs.cmp")',
    }



    -- Tmux
    --use { "aserowy/tmux.nvim", config = require "plugins.configs.tmux" }

    -- Git
    --[[
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = require "plugins.configs.gitsigns",
    }
    ]]--

    -- Markdown
    --[[use {
        "davidgranstrom/nvim-markdown-preview",
        config = function()
            vim.g.nvim_markdown_preview_format = "gfm"
            vim.g.nvim_markdown_preview_theme = "github"
        end,
    }
    ]]--

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
