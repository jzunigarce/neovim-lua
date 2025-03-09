local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.html.setup {
    capabilities = capabilities,
    filetypes = { "html", "blade" },
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        provideFormatter = true
    }
}

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

lspconfig.volar.setup({
    settings = {
        vue = {
            format = {
                enable = false
            }
        }
    },
    filetypes = { 'vue' },
    on_attach = function(client, bufnr)
        local opts = {}
    end,
})

-- lspconfig["ts_ls"].setup({ capabilities = capabilities })
lspconfig["ts_ls"].setup({
    capabilities = capabilities,
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    init_options = {
        plugins = {
            {
                name = '@vue/typescript-plugin',
                location = vim.fn.stdpath('data') ..
                    '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                languages = { 'vue' },
            },
        },
    },
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
