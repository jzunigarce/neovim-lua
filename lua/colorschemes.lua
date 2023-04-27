-- Config colorschemes
local cmd = vim.cmd
local opt = vim.opt
local M = {}

M.colorschemes = {
	dracula = 'dracula',
	tokyonight = 'tokyonight',
	tokyonight_night = 'tokyonight-night',
	tokyonight_storm = 'tokyonight-storm',
	tokyonight_day = 'tokyonight-day',
	tokyonight_moon = 'tokyonight-moon',
  gruvbox = 'gruvbox',
}

M.set_colorschema = function(scheme)
	require("themes/" .. M.colorschemes[scheme])
end

M.set_colorschema('gruvbox')
