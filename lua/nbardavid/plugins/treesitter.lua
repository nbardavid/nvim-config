return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        local ts = require("nvim-treesitter")

        ts.setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        local parsers = {
            "json",
            "javascript",
            "tsx",
            "yaml",
            "html",
            "css",
            "prisma",
            "typescript",
            "markdown",
            "markdown_inline",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "gitignore",
            "vimdoc",
            "c",
            "python",
            "http",
            "zig",
            "glsl",
        }

        ts.install(parsers)

        local filetypes = {}
        for _, p in ipairs(parsers) do
            local ft = vim.treesitter.language.get_filetypes(p)
            vim.list_extend(filetypes, ft)
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetypes,
            callback = function(ev)
                pcall(vim.treesitter.start, ev.buf)
                vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        require("nvim-ts-autotag").setup()
    end,
}
