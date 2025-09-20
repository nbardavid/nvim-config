return {
    "xiyaowong/transparent.nvim",
    config = function()
        require("transparent").setup({
            groups = {
                "Normal","NormalNC","NormalFloat",
                "SignColumn","LineNr","CursorLine","CursorLineNr",
                "EndOfBuffer","Folded","FoldColumn",
                "Pmenu","PmenuSel","PmenuSbar","PmenuThumb",
                "FloatBorder","WinSeparator",
                "Visual","Search","IncSearch",
            },
            extra_groups = {
                "TelescopeNormal","TelescopeBorder",
                "TelescopePromptNormal","TelescopePromptBorder",
                "TelescopeResultsNormal","TelescopePreviewNormal",
                "DiagnosticFloatingError","DiagnosticFloatingWarn",
                "DiagnosticFloatingInfo","DiagnosticFloatingHint",
            },
            exclude_groups = {},
        })
        local colors = require("catppuccin.palettes").get_palette("macchiato")

        -- vim.api.nvim_set_hl(0, "Visual", {
        --     bg = "none",
        --     fg = colors.mauve, -- ou colors.sky, colors.blue, etc.
        --     underline = true,
        -- })
    end
}
