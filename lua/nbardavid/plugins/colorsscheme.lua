return {
    "catppuccin/nvim",
    priority = 1000,
    config = function()

        require("catppuccin").setup({
            flavour = "macchiato",
        })
        vim.cmd("colorscheme catppuccin")
    end

}