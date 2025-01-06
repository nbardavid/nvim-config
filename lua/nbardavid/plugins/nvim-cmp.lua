return {
    "hrsh7th/nvim-cmp",
    event = {"InsertEnter", "CmdlineEnter"},
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        "hrsh7th/cmp-cmdline",
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim", -- vs-code like pictograms
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        -- Load VSCode-style snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        -- Main setup
        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            mapping = {
                ['<CR>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if luasnip.expandable() then
                            luasnip.expand()
                        else
                            cmp.confirm({
                                select = true,
                            })
                        end
                    else
                        fallback()
                    end
                end),

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
        })

        cmp.setup.cmdline('/', {
            view = {
                entries = {name = 'wildmenu', separator = '|' }
            },
            mapping = cmp.mapping.preset.cmdline(),
            sources = ({
                { name = "buffer" },
            }),
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })
    end,
}
