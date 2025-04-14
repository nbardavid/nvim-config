return {
    "rest-nvim/rest.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        opts = function (_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            table.insert(opts.ensure_installed, "http")

            vim.keymap.set("n", "<leader>rr", function()
                vim.cmd("Rest run")
            end, { desc = "Rest run" })

            vim.keymap.set("n", "<leader>rc", function()
                vim.cmd("vs | Rest cookies")
            end, { desc = "Rest cookies" })

            vim.keymap.set("n", "<leader>rl", function()
                vim.cmd("vs | Rest logs")
            end, { desc = "Rest logs" })

            vim.keymap.set("n", "<leader>ro", function()
                vim.cmd("vs | Rest open")
            end, { desc = "Rest open" })


        end,
    }
}
