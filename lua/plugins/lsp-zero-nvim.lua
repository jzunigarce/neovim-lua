local lsp = require('lsp-zero')
lsp.preset('recommended')


lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
})


lsp.configure('tsserver', {
  on_attach = function(client, bufnr)
    print('Tsserver')
  end,
  settings = {
    completions = {
      completeFunctionCalls = true
    }
  }
})

-- share configuration between multiple servers
-- see :help lsp-zero.setup_servers()
lsp.setup_servers({
  'eslint',
  opts = {
    single_file_support = false,
    on_attach = function(client, bufnr)
    end
  }
})

-- configure lua language server for neovim
-- see :help lsp-zero.nvim_workspace()
lsp.nvim_workspace()

lsp.setup()

-- initialize rust_analyzer with rust-tools
-- see :help lsp-zero.build_options()
local rust_lsp = lsp.build_options('rust_analyzer', {
  single_file_support = false,
  on_attach = function(client, bufnr)
  end
})
