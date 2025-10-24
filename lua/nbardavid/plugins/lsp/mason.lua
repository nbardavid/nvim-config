return {
    "williamboman/mason.nvim",
    version = "v1.11.0",
    dependencies = {
        { "williamboman/mason-lspconfig.nvim", version = "v1.32.0" },
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "cssls",
                "lua_ls",
                "clangd",
                "zls",
            },
        })

    end,
}
