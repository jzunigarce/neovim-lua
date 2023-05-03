-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- local api = vim.api

local api = require("nvim-tree.api")

local function on_attach(bufnr)
  
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  
  vim.keymap.set('n', 'u', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'r', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', 'R', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 'A', api.tree.expand_all, opts('Expand All'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
  vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
  vim.keymap.set('n', 'O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    --mappings = {
    --  list = {
    --    { key = "u", action = "dir_up" },
    --   { key = "s", action = "vsplit"},
    --    { key = "i", action = "split"},
    --    { key = "t", action = "tabnew"},
    --    { key = "r", action = "refresh"},
    --    { key = "R", action = "rename"},
    -- },
    --},
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
   ignore = false, 
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  on_attach = on_attach,
})

local function open_nvim_tree()
  api.tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function() open_nvim_tree() end })
