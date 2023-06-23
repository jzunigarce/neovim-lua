-- Config colorschemes
local M = {}
local default_scheme = require('themes.default-scheme')

M.colorschemes = {
	dracula = 'dracula',
	tokyonight = 'tokyonight',
	tokyonight_night = 'tokyonight-night',
	tokyonight_storm = 'tokyonight-storm',
	tokyonight_day = 'tokyonight-day',
	tokyonight_moon = 'tokyonight-moon',
  gruvbox = 'gruvbox',
  catppuccin = 'catppuccin',
  catppuccin_latte = 'catppuccin-latte'
}

M.set_colorscheme = function(theme)
 print(theme)
 default_scheme.set_colorscheme(M.colorschemes[theme])
	--require("lua/themes/" .. M.colorschemes[scheme])
end


return M
