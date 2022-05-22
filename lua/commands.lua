--`vim.api.nvim_create_user_command("Format", vim.lsp.buf.format, {})
vim.api.nvim_create_user_command('EditConfig', 'cd ~/.config/nvim/lua | edit ~/.config/nvim/init.lua', {})
vim.api.nvim_create_user_command('SourceConfig', 'source ~/.config/nvim/init.lua', {})
