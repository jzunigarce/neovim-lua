-- Settings
local utils = require("utils")
require("settings")
require("keymaps")

require("plugins")
require("colorschemes").set_colorscheme('dracula')
utils.load_module("custom")
