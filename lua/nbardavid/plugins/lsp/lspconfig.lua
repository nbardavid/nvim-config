return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- Autocompletion support
        { "folke/neodev.nvim", opts = {} }, -- Enhanced Lua LSP for Neovim
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local mason_lspconfig = require("mason-lspconfig")
        local keymap = vim.keymap

        -- Keybindings for LSP
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", vim.lsp.buf.definition, opts)

                opts.desc = "Show hover documentation"
                keymap.set("n", "K", vim.lsp.buf.hover, opts)
            end,
        })

        -- Capabilities for autocompletion
        local capabilities = cmp_nvim_lsp.default_capabilities()

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
		})
    end,
}

