return {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },

    vim.keymap.set("n", "<leader>tr", function()
        vim.cmd("Typr")
    end, { desc = "Typr run" }),

    vim.keymap.set("n", "<leader>ts", function()
        vim.cmd("TyprStats")
    end, { desc = "Typr stats" })
}
