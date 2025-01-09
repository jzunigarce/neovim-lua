local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()
end)


lspconfig.intelephense.setup({})

-- lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
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
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
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

lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "css", "htmldjango", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
    init_options = {
        html = {
            options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
            },
        },
    }
})


--[[ lsp.configure('ts_ls', {
  on_attach = function(client, bufnr)
    print('ts_ls')
  end,
  settings = {
    completions = {
      completeFunctionCalls = true
    }
  }
})]]
lspconfig["ts_ls"].setup({ capabilities = capabilities })

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
    opts = {
        on_attach = on_attach,
        settings = {
            pyright = { autoImportCompletion = true, },
            python = { analysis = { autoSearchPaths = true, diagnosticMode = 'openFilesOnly', useLibraryCodeForTypes = true, typeCheckingMode = 'off' } }
        }
    }
})

lsp.setup()
