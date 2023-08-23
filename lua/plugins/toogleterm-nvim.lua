require('toggleterm').setup({
  direction = 'float',
  shade_terminals = true,
  close_on_exit = true,
})

local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({ 
  cmd = "lazygit",
  hidden = true,
  -- direction = 'float',
  float_opts = {
    border = 'double'
  }
})

function _lazygit_toggle()
  lazygit:toggle()
end

local node = Terminal:new({
  cmd = 'node', hidden = true
}) 

function _node_toggle()
  node:toggle()
end

local python = Terminal:new({
  cmd = 'python3', hidden = true
})

function _python_toggle()
  python:toggle()
end
