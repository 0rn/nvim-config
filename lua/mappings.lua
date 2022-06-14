local ok, wk = pcall(require, "which-key")

if not ok then
    return
end

local opts = {
    mode = "n",
    prefix = "",
    silent = true,
    noremap = true,
    nowait = true,
}

wk.register({
    ["D"] = {"diw", "Delete entire word"},
    ["C"] = {"ciw", "Change entire word"},

    -- leader commands
    ["<leader>"] = {
        name = "Leader commands",
        q = { "<cmd>bd<cr>", "[BUFFER] Close current buffer" },
        ["]"] = { "<cmd>bn<cr>", "[BUFFER] Go previous buffer" },
        ["["] = { "<cmd>bp<cr>", "[BUFFER] Go next buffer" },
        -- lsp labels
        -- TODO: finish this and move to lsp config
        -- (to only enable when lsp is enabled?)
        e = "Open diaginostics",


        l = {
            name = "LSP extended ->",
            p = "Prev diagnostic",
            n = "Next diagnostic",
            r = "Rename buffer",
            c = "Code action",
            f = "Format",
        },
    },
    -- just labels, defined in cmp
    -- TODO: find a way to do this there??
    --["<C-d>"] = "Scroll docs down",
    ["<C-f>"] = "Scroll docs down",
    ["<C-Space>"] = "Open completion window",
    ["<C-q>"] = "Close completion window",

    ["gd"] = "Go to definition",
    ["gD"] = "Get declaration",

    --["<c-n>"] = { "<cmd>NvimTreeToggle<cr> <cmd>NvimTreeRefresh<cr>", "[NVIMTREE] Toggle" },

    --[[["<leader>f"] = {
        name = "[TELESCOPE]",
        f = { "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "[TELESCOPE] Find File" },
        g = { "<cmd>Telescope live_grep<cr>", "[TELESCOPE] Find File by grep" },
        b = { "<cmd>Telescope buffers<cr>", "[TELESCOPE] Find buffers" },
        h = { "<cmd>Telescope help_tags<cr>", "[TELESCOPE] Help tags" },
        m = { "<cmd>Telescope marks<cr>", "[TELESCOPE] Marks" },
    },
    ]]--

    --[[["<leader>g"] = {
        name = "[GITSIGNS]",
        s = { "<cmd>Gitsigns toggle_signs<cr>", "[GITSIGNS] Toggle signs" },
        h = { "<cmd>Gitsigns preview_hunk<cr>", "[GITSIGNS] Preview hunk" },
        d = { "<cmd>Gitsigns diffthis<cr>", "[GITSIGNS] Show diff" },
    },
    ]]--
}, opts)

local topts = {
    mode = "t",
    prefix = "",
    silent = true,
    noremap = true,
    --nowait = true,
}

--wk.register({
    --["<Esc>"] = {"<C-\\><C-n>", "Change to normal mode"},
--}, opts)

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {silent = true, noremap = true})

wk.setup {}
