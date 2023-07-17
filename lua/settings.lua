local utils = require "utils"

vim.g.mapleader = " "
vim.o.guifont = "NotoSansM Nerd Font Mono:h24:#e-subpixelantialias"

vim.cmd [[set fcs=eob:\ ]]
--vim.cmd [[filetype plugin indent on]]

local options = {
    --termguicolors = true,
    fileencoding = "utf-8",
    backup = false,
    swapfile = false,
    hlsearch = true,
    incsearch = true,
    showmode = false,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    scrolloff = 5,
    sidescrolloff = 5,
    smartindent = true,
    colorcolumn = "80",
    --signcolumn = "yes",
    hidden = true,
    ignorecase = true,
    timeoutlen = 1000,
    shiftround = true,
    smartcase = true,
    splitbelow = true,
    splitright = true,
    --number = true,
    --relativenumber = true,
    --clipboard = "unnamedplus",
    --cursorline = true,
    --mouse = "a",
    cmdheight = 1,
    undodir = "/tmp/.nvimdid",
    undofile = true,
    pumheight = 10,
    laststatus = 3,
    updatetime = 250,
    background = "dark",
}

--vim.opt.shortmess:append "c"

for key, value in pairs(options) do
    vim.opt[key] = value
end

utils.setSpacesSize { go = 4, python = 4, rust = 4, cpp = 4, c = 4, nim = 2, lua = 4}
