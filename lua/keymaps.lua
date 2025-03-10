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
-- Copy to clipboard
map('', '<Leader>yy', '"+y')
-- Duplicate line
map('n', '<Leader>d', ':copy .<CR>')
-- List buffer and require id to open
map('n', '<Leader>bl', ':buffers<CR>:buffer<Space>', { noremap = true, silent = true })
-- neovim-tree
map('', '<F2>', ':NvimTreeToggle<CR>') -- Toogle tree

-- Telescope
map('n', '<C-P>', ':Telescope find_files<CR>')
map('n', '<C-G>', ':Telescope live_grep<CR>')
--map('n', '<C-B>', ':Telescopelescope builtinffers<CR>')
map('n', '<C-S-G>', ':Telescope grep_string<CR>')

-- toogleterm-nvim
map('', '<C-t>', ':ToggleTerm direction=float<CR>')
map('', '<C-t>h', ':ToggleTerm direction=horizontal<CR>')
map('t', '<C-w>h', '<C-\\><C-n>')
map('n', '<C-t>n', '<cmd>lua _node_toggle()<CR>', { silent = true})
map('n', '<C-t>p', '<cmd>lua _python_toggle()<CR>', { silent = true })

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

-- move buffer 
map('n', '<leader>bn', ':bn<CR>', { noremap = true, silent = true })
map('n', '<leader>bp', ':bp<CR>', { noremap = true, silent = true })
