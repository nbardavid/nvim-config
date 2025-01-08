return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    config = function()
        vim.opt.termguicolors = true

        require("bufferline").setup({
            options = {
                show_buffer_close_icons = true,
                show_close_icon = false,
                always_show_bufferline = true,
                enforce_regular_tabs = false,
                separator_style = "slant",
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
        })


        local keymap = vim.keymap
        keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
        keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

        keymap.set("n", "<leader>bc", function() require("nbardavid.core.utils").custom_bdelete() end, { desc = "Close buffer" })

        keymap.set("n", "<leader>bp", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
        keymap.set("n", "<leader>bn", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
    end,
}

