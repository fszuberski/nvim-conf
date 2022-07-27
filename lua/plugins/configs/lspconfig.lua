local present, lspconfig = pcall(require, "lspconfig")


if not present then
    return
end

require "plugins.configs.mason"

local servers = { "html", "cssls" }

local M = {}

M.on_attach = function(client, bufnr)
    local vim_version = vim.version()

    if vim_version.minor > 7 then
        -- nightly
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
    else
        -- stable
        client.resolved_capabilities.document_formatting = true
        client.resolved_capabilities.document_range_formatting = true
    end

    -- local lsp_mappings = utils.load_config().mappings.lspconfig
    -- utils.load_mappings({ lsp_mappings }, { buffer = bufnr })

end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

M.flags = {
    debounce_text_changes = 150,
}


for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        flags = M.flags,
    }
end

lspconfig.gopls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = M.flags,

    -- cmd = {"gopls", "--remote=auto"},
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unreachable = true,
                unusedparams = true,
            },
            staticcheck = true
        }
    }
}

-- https://github.com/lighttiger2505/sqls
lspconfig.sqls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = M.flags,
}

lspconfig.yamlls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = M.flags,

    settings = {
        yaml = {
            validate = true,
            hover = true,
            completion = true,
            format = {
                enable = true
            },
            schemas = {
                ['https://raw.githubusercontent.com/docker/cli/master/cli/compose/schema/data/config_schema_v3.9.json'] = '**/docker-compose.yml'
            }
        }
    }
}

lspconfig.sumneko_lua.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = M.flags,

    settings = {
        Lua = {
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "2",
                }
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
            telemetry = {
                enable = false,
            }
        },
    },
}

return M
