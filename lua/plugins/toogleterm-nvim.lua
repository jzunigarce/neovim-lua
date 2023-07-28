require('toggleterm').setup({
  direction = 'horizontal',
  shade_terminals = true
})

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ 
  cmd = "lazygit",
  hidden = true,
  direction = 'float',
  float_opts = {
    border = 'double'
  }
})

function _lazygit_toggle()
  lazygit:toggle()
end

