return {
    "OXY2DEV/markview.nvim",
    priority = 49,
    config = function()
        local markview = require("markview")
        markview.setup({
            preview = {
                enable = false,
            },
            experimental = {
                -- If there is problems with highlight, it come from that line :skull:
                check_rtp_message = false,
            }
        })

        local keymap = vim.keymap
        keymap.set("n", "<leader>mk", "<cmd>Markview Toggle<CR>", { desc = "Markview Toggle" })
    end,
}

