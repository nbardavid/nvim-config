return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } }, -- optional
    },
    ft = "python", -- Load when opening Python files
    keys = {
        { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Python venv" },
    },
    opts = {
        search = {}, -- custom searches if you want
        options = {} -- plugin options
    },
}
