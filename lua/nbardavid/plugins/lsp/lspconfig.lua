return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- Autocompletion support
        { "folke/neodev.nvim", opts = {} }, -- Enhanced Lua LSP for Neovim
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local mason_lspconfig = require("mason-lspconfig")
        local capabilities = cmp_nvim_lsp.default_capabilities()
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
            cmd = {"gopls", "serve"},
            capabilities = capabilities,
            on_attach = on_attach,
        })
        -- vim.lsp.config("pyright", {
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     before_init = function(_, config)
        --         default_venv_path = path.join(vim.env.HOME, "venv")
        --         config.settings.python.pythonPath = default_venv_path
        --     end,
        -- })
        -- vim.lsp.config("qmlls", {
        --     cmd = { "qmlls6" },
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     cmd_env = {
        --         QML_IMPORT_PATH = vim.fn.expand("~/.local/share/quickshell/modules"),
        --         QML2_IMPORT_PATH = vim.fn.expand("~/.local/share/quickshell/modules"),
        --     },
        -- })
        -- vim.lsp.config("nixd", {
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --     root_dir = function(fname)
        --         local util = require("lspconfig.util")
        --         return util.root_pattern("flake.nix", "default.nix", "shell.nix")(fname)
        --             or "/etc/nixos"
        --     end,
        --     settings = {
        --         nixd = {
        --             nixpkgs = {
        --                 expr = "import <nixpkgs> {}",
        --             },
        --             formatting = {
        --                 command = { "alejandra" },
        --             },
        --             options = {
        --                 nixos = {
        --                     expr = 'with import <nixpkgs/nixos> { configuration = {}; }; options',
        --                 },
        --             },
        --         },
        --     },
        -- })

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

