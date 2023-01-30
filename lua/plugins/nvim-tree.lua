-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "s", action = "vsplit"},
        { key = "i", action = "split"},
        { key = "t", action = "tabnew"},
        { key = "r", action = "refresh"},
        { key = "R", action = "rename"},
      },
    },
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
})
