-- Aliases API
local g = vim.g

-- Key leader
g.mapleader = ','

function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', 'Y', 'yy')
-- neovim-tree
map('', '<F2>', ':NvimTreeToggle<CR>') -- Toogle tree

-- Telescope
map('n', '<C-P>', ':Telescope find_files<CR>')
map('n', '<C-G>', ':Telescope live_grep<CR>')
map('n', '<C-B>', ':Telescopelescope builtinffers<CR>')
map('n', '<C-S-G>', ':Telescope grep_string<CR>')

-- toogleterm-nvim
map('', '<C-t>', ':ToggleTerm<CR>')
