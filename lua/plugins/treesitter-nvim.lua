require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true;
    disable = {},
  },
  ensure_installed = {
    'javascript',
    'typescript',
    'tsx',
    'css',
    'sql',
    'python',
    'json',
    'lua',
    'php',
    'html',
    'vue',
  },
  autotag = {
    enable = true,
  }
})



