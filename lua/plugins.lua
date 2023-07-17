return {
    {
        "folke/tokyonight.nvim",
        -- make sure we load this during startup if it is your main colorscheme
        lazy = false, 
        -- make sure to load this before all the other start plugins
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                transparent = (vim.fn.hostname() == "axe"),
            })
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            plugins = { spelling = true },
            popup_mappings = {
                scroll_down = "<c-d>",
                scroll_up = "<c-s>",
            },
        },
        config = function(_, opts)
            require("which-key").setup(opts)
        end,
        keys = {
            { "s", "<cmd>WhichKey<cr>", desc = "Open which-key" },
            --{ "s", "<cmd>WhichKey<cr>", mode = "v", desc = "Open which-key" },
        }
    },
    -- UTIL
    {
        "RaafatTurki/hex.nvim",
        lazy = false,
        config = function(_)
            require("hex").setup()
        end,
    },
    
    -- LANGUAGES
    {
        "baabelfish/nvim-nim",
        event = "BufReadPre *.nim",
        keys = {
            {"<F5>", "<cmd>!nim --hints:off r %<cr>", desc = "Run nim file"},
        }
    },
}
