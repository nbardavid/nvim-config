return {
    "numToStr/Comment.nvim",
    opts = {
        toggler = {
            line = "<leader>/",
        },
        opleader = {
            line = "<leader>/",
        },
        mappings = {
            basic = true,
            extra = false,
        },
    },
    config = function(_, opts)
        require("Comment").setup(opts)
    end,
}
