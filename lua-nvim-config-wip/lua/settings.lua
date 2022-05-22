-- vim settings
-- global, window, buffer


local o = vim.o
local w = vim.wo
local b = vim.bo

-- set statusline
local stl = require('statusline')
o.statusline = '%!lua "(stl.statusline())"'


-- indent
o.autoindent = true
o.smartindent = true

-- tab
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.tabstop = 4


-- search
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12


-- what does this do?
o.modeline = true



o.backspace = [[indent,eol,start]]
o.hidden = true
w.winfixwidth = true

o.lazyredraw = true

o.splitbelow = true
o.splitright = true
b.synmaxcol = 4000

-- cursor
w.cursorline = true
o.mouse = 'a'

-- line numbers
w.number = true
w.relativenumber = true

w.list = true
if vim.fn.has('multi_byte') == 1 and vim.o.encoding == 'utf-8' then
  o.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]
else
  o.listchars = [[tab:> ,extends:>,precedes:<,nbsp:.,trail:_]]
end

w.colorcolumn = [[100]]
w.wrap = true

o.termguicolors = true

o.clipboard = [[unnamed,unnamedplus]]

o.scrolloff = 4

o.timeoutlen = 300


if o.shell == 'fish$' then
  o.shell = [[/bin/bash]]
end

o.completeopt = [[menuone,noinsert,noselect]]


