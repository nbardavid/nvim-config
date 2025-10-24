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

    end,
}
