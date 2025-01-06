return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            size = 80,
            open_mapping = [[<A-v>]],
            direction = "vertical",
            close_on_exit = true,
            shell = vim.o.shell,
        })

        vim.keymap.set("n", "<A-v>", function()
            vim.cmd("ToggleTerm direction=vertical")
        end, { desc = "Toggle vertical terminal" })
    end,
}
