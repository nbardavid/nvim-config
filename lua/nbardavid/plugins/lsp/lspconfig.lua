return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "folke/neodev.nvim", opts = {} }, -- Enhanced Lua LSP for Neovim
    },
    config = function()
        local mason_lspconfig = require("mason-lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        local keymap = vim.keymap

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        local function on_attach(_, bufnr)
            local opts = { buffer = bufnr, silent = true }
            keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end

        vim.lsp.config("clangd", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config("gopls", {
            cmd = { "gopls", "-remote=auto", "serve", "-logfile=auto" },
            capabilities = capabilities,
            on_attach = on_attach,
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                vim.lsp.config(server_name, {
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
                vim.lsp.enable(server_name)
            end,

            ["pyright"] = function()
                vim.lsp.config("pyright", {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        python = {
                            analysis = {
                                typeCheckingMode = "basic",
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                            },
                            pythonPath = "~/.venv/nvim/bin/python",
                        },
                    },
                })
                vim.lsp.enable("pyright")
            end,
        })
    end,
}
