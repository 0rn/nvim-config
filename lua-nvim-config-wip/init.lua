-- nvim config file

-- first load plugins
require('plugins')


-- then load others
require('utils')
require('settings')
require('maps')
--require('autocmds')


-- then configure
require('config.lsp')
require('config.cmp')



--vim.colorscheme = 'kanagawa'
vim.cmd('colorscheme kanagawa')



utils.create_augroup({
  {'FileType', '*', 'setlocal', 'shiftwidth=4'},
  {'FileType', 'nim,lua', 'setlocal', 'shiftwidth=2'},
}, 'Tab2')

