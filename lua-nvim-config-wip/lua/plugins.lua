-- auto install packer when install path is empty
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Colour
  use 'rebelot/kanagawa.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Languages
  use 'zah/nim.vim'
  use 'bfrg/vim-cpp-modern'

  -- completions
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'

  -- multi cursor
  use 'mg979/vim-visual-multi'

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
