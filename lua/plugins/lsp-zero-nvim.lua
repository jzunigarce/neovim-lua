local lsp = require('lsp-zero')
require('lspconfig').intelephense.setup({})

-- lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed ={
    'ts_ls',
    'eslint',
    'lua_ls',
    'html',
    'emmet_ls',
    'pyright',
    },
  handlers = {
    lsp.default_setup,
  },
})

local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({select = false}),
    }),
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
})

require('lspconfig').emmet_language_server.setup({
    filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact", "php" },
    init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
    on_attach = function(client, bufnr)
    end
})


lsp.configure('ts_ls', {
  on_attach = function(client, bufnr)
    print('ts_ls')
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

-- lsp.setup_servers({
--  'html',
--  opts = {
--    filetypes = {"html"}
--  }
-- })

-- configure lua language server for neovim
-- see :help lsp-zero.nvim_workspace()
-- lsp.nvim_workspace()
require('lspconfig').lua_ls.setup({})


-- initialize rust_analyzer with rust-tools
-- local rust_lsp = lsp.build_options('rust_analyzer', {
--  single_file_support = false,
--  on_attach = function(client, bufnr)
--  end
-- })

lsp.setup_servers({
  'pyright',
  opts={
    on_attach = on_attach,settings = {pyright = {autoImportCompletion = true,},
    python = {analysis = {autoSearchPaths = true,diagnosticMode = 'openFilesOnly',useLibraryCodeForTypes = true,typeCheckingMode = 'off'}}}}
})

lsp.setup()
