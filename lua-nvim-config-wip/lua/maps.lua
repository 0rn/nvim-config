-- keyboard mappings for nvim
local u = require('utils')

local M = {}


-- TABS

u.map('n', '<C-t>', ':tabnext<CR>', {noremap = true})
--u.map('n', '<C-S-t>', ':tabprev<CR>', {noremap = true})

u.map('n', '<Up>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
u.map('n', '<Down>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
u.map('n', '<Left>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
u.map('n', '<Right>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})


-- use tab to cycle autocomplete
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.smart_tab = function()
  if vim.fn.pumvisible() then
    return t'<C-n>'
  else
    return t'<Tab>'
  end
end

u.map('i', '<Tab>', 'v:lua.smart_tab()', {noremap = true, expr = true})



-- LSP
u.map_lua('n', '<space>e', 'vim.diagnostic.open_float()', opts)
u.map_lua('n', '[d', 'lua vim.diagnostic.goto_prev()', opts)
u.map_lua('n', ']d', 'vim.diagnostic.goto_next()', opts)
u.map_lua('n', '<space>q', 'vim.diagnostic.setloclist()', opts)


M.attach_maps = function()
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }

  u.map_lua_buf('n', 'gD', 'vim.lsp.buf.declaration()', opts)
  u.map_lua_buf('n', 'gd', 'vim.lsp.buf.definition()', opts)
  u.map_lua_buf('n', 'K', 'vim.lsp.buf.hover()', opts)
  u.map_lua_buf('n', 'gi', 'vim.lsp.buf.implementation()', opts)
  u.map_lua_buf('n', '<C-k>', 'vim.lsp.buf.signature_help()', opts)
  u.map_lua_buf('n', '<space>wa', 'vim.lsp.buf.add_workspace_folder()', opts)
  u.map_lua_buf('n', '<space>wr', 'vim.lsp.buf.remove_workspace_folder()', opts)
  u.map_lua_buf('n', '<space>wl', 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))', opts)
  u.map_lua_buf('n', '<space>D', 'vim.lsp.buf.type_definition()', opts)
  u.map_lua_buf('n', '<space>rn', 'vim.lsp.buf.rename()', opts)
  u.map_lua_buf('n', '<space>ca', 'vim.lsp.buf.code_action()', opts)
  u.map_lua_buf('n', 'gr', 'vim.lsp.buf.references()', opts)
  u.map_lua_buf('n', '<space>f', 'vim.lsp.buf.formatting()', opts)
end

_G.maps = M
return M
