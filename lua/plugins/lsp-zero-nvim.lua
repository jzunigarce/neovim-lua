local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.nvim_workspace()

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

lsp.setup()
