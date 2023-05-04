return {
	"williamboman/mason.nvim",
    
    dependencies = {
        "williamboman/mason-lspconfig",
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim",
    },

    event = { "BufReadPre", "BufNewFile" },
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
        require("mason").setup {
            ensure_installed = { "nimlsp" },
        }
        require("mason-lspconfig").setup()
        local lspconfig = require("lspconfig")

        -- setup all lsp servers installed with mason with the default settings
        require("mason-lspconfig").setup_handlers {
            function (server_name)
                lspconfig[server_name].setup {}
            end,
        }

        -- setup experimental nim lsp
        lspconfig.nim_langserver.setup{}
    end,
}

