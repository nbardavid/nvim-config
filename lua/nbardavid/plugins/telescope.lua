return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local transform_mod = require("telescope.actions.mt").transform_mod

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        local keymap = vim.keymap

        keymap.set("n", "<leader>ff", function() vim.cmd("Telescope find_files") end, { desc = "Fuzzy find files in cwd" })
        -- keymap.set("n", "<leader>fr", function() vim.cmd("Telescope oldfiles") end, { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fw", function() vim.cmd("Telescope live_grep") end, { desc = "Find word in cwd" })
        keymap.set("n", "<leader>fc", function() vim.cmd("Telescope grep_string") end, { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>ft", function() vim.cmd("TodoTelescope") end, { desc = "Find todos" })
        keymap.set("n", "<leader>fr", function() vim.cmd("Telescope lsp_references") end, { desc = "Find lsp_references"} )
    end,
}
