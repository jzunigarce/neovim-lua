local cmd = vim.cmd
local opt = vim.opt

local Default_Scheme = {}

Default_Scheme.set_colorscheme = function(theme)
  opt.termguicolors = true
  cmd('colorscheme ' .. theme)
end

return Default_Scheme
