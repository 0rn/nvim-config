-- keymaps
-- some from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Buffers
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })

-- Better D and C
map("n", "D", "diw", { desc = "Delete entire word" })
map("n", "C", "ciw", { desc = "Change entire word" })

-- Move Lines Around
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })
-- open diagnostics window
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open Diagnostics Pane" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- tabs
map("n", "<c-tab>", "<cmd>tabnew<cr>", {desc = "New tab" })
map("n", "]<tab>", "<cmd>tabnext<cr>", {desc = "Next tab" })
map("n", "[<tab>", "<cmd>tabprevious<cr>", {desc = "Prev tab" })

-- copy
map("v", "<c-c>", '"+y', {desc =  "Copy to clipboard" })

-- terminal mode
map("t", "<esc>", "<c-\\><c-n>", {desc = "Normal mode"})
