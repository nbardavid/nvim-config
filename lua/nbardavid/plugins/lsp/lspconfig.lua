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

        local function on_attach(client, bufnr)
            local opts = { buffer = bufnr, silent = true }
            keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            keymap.set("n", "K", vim.lsp.buf.hover, opts)

            -- Format on save pour Go
            if vim.bo[bufnr].filetype == "go" then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ async = false })
                    end,
                })
            end

            if client.name == "biome" then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ 
                            async = false,
                            timeout_ms = 2000,
                        })
                    end,
                })
            end
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

        vim.lsp.config("biome", {
          cmd = { "biome", "lsp-proxy" },
          root_dir = vim.fs.root(0, { "biome.json", ".git" }),
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("biome")

        local disabled_servers = { tsserver = true }
        mason_lspconfig.setup_handlers({
            function(server_name)
                if disabled_servers[server_name] then return end
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
