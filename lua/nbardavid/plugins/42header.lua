return {
    "42Paris/42header",
    config = function()
        vim.g.user42 = "nbardavi"
        vim.g.mail42 = "nbardavi@student.42.fr"

        vim.api.nvim_set_keymap(
            "n",
            "<F1>",
            ":Stdheader<CR>",
            { noremap = true, silent = true }
        )
    end
}
