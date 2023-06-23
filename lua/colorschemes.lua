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
  catppuccin_latte = 'catppuccin-latte',
  catppuccin_frappe = 'catppuccin-frappe',
  catppuccin_macchiato = 'catppuccin-macchiato',
  catppuccin_mocha = 'catppuccin-mocha'
}

M.file_exists = function(name)
  local ext = '.lua'
  local full_file = os.getenv( "HOME" ) .. '/.config/nvim/lua/themes/' .. name .. ext
  local f = io.open(full_file, "r")
  return f ~= nil and io.close(f)
end

M.set_colorscheme = function(theme)
  if M.file_exists(M.colorschemes[theme]) then
    require("themes/" .. M.colorschemes[theme])
  else
    default_scheme.set_colorscheme(M.colorschemes[theme])
  end
end


return M
