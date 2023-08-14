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
-- Duplicate line
map('n', '<Leader>d', ':copy .<CR>')
-- List buffer and require id to open
map('n', '<Leader>b', ':buffers<CR>:buffer<Space>')
-- neovim-tree
map('', '<F2>', ':NvimTreeToggle<CR>') -- Toogle tree

-- Telescope
map('n', '<C-P>', ':Telescope find_files<CR>')
map('n', '<C-G>', ':Telescope live_grep<CR>')
map('n', '<C-B>', ':Telescopelescope builtinffers<CR>')
map('n', '<C-S-G>', ':Telescope grep_string<CR>')

-- toogleterm-nvim
map('', '<C-t>', ':ToggleTerm<CR>')

--Troueble Diagnostic
map('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
map('n', '<leader>dd', '<cmd>TroubleToggle workspace_diagnostics<cr>', {silent = true, noremap = true})
-- map('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
-- map('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
map('n', '<leader>td', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })

-- Vim fugitive
map('n', '<leader>g', ':G<space>')

-- Lazy git
map('n', '<C-L>', '<cmd>lua _lazygit_toggle()<CR>', { silent = true })
 
-- Exit terminal 
map('t', '<C-w>h', '<C-\\><C-n>') 
