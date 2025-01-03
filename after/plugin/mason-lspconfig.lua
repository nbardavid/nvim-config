require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "clangd", "rust_analyzer" },
}
