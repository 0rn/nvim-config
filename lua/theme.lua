local _M = {}

local ok, kanagawa = pcall(require, "kanagawa")
  if not ok then
    return
  end

_M.init = function()
  
  kanagawa.setup {}
  
  vim.cmd("colorscheme kanagawa")

end

local k = kanagawa

_M.colors = {
  red = k.waveRed,
  orange = k.surimuOrange,
  yellow = k.carpYellow,
  blue = k.crystalBlue,
  green = k.springGreen,
  cyan = k.springBlue,
  magenta = k.oniViolet,
  pink = k.sakuraPink, 
}


return _M
