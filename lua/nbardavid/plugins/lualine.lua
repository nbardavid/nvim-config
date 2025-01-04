return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
  config = function()
    local lualine = require("lualine")

    -- Configure lualine avec le thème Catppuccin
    lualine.setup({
      options = {
        theme = "catppuccin", -- Utilise le thème Catppuccin
        section_separators = { left = "", right = "" }, -- Style des séparateurs
        component_separators = { left = "", right = "" },
        icons_enabled = true, -- Active les icônes
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } }, -- Affiche le chemin relatif du fichier
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } }, -- Chemin du fichier pour les buffers inactifs
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "nvim-tree", "quickfix" }, -- Ajout de support pour NvimTree et quickfix
    })
  end,
}
