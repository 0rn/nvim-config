-- nim filetype support (if no nim plugin is there)
-- TODO: nimble files?
vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
    pattern = "*.nim",
    callback = function()
        vim.cmd("set filetype=nim")
    end,
})


-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
})

-- Disable comment new line
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove { "c", "r", "o" }
    end,
})

vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
    pattern = "tsconfig.json",
    callback = function()
        vim.opt.filetype = "jsonc"
    end,
})

-- enter text in term mode immediately, without having to press i or a to go into insert mode
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.cmd("startinsert")
    end,
})
