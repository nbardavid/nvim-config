return {
    "nvchad/ui",
    config = function()
        require "nvchad"

        local keymap = vim.keymap

        ----------------------------------------------------------------------
        -- 🌐 Tabufline 
        ----------------------------------------------------------------------
        local tabufline = require("nvchad.tabufline")

        keymap.set("n", "<Tab>", tabufline.next, { desc = "Next buffer" })
        keymap.set("n", "<S-Tab>", tabufline.prev, { desc = "Previous buffer" })

        keymap.set("n", "<leader>bc", tabufline.close_buffer, { desc = "Close buffer" })


        ----------------------------------------------------------------------
        -- 🖥️ Terminal
        ----------------------------------------------------------------------
        local term = require("nvchad.term")

        keymap.set({"n","t"}, "<A-v>", function()
            term.toggle { pos = "vsp", id = "vterm" }
        end, { desc = "Toggle vertical terminal" })
        keymap.set({"n","t"}, "<A-i>", function()
            term.toggle { pos = "float", id = "vterm" }
        end, { desc = "Toggle floating terminal" })

    end,
}
