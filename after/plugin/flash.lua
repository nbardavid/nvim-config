-- Charger le plugin et configurer ses options
require("flash").setup({
  -- Configuration des modes
  modes = {
    search = {
      enabled = true, -- Activer les labels pour les recherches normales
    },
    jump = {
      autojump = true, -- Aller automatiquement à la première correspondance
    },
    treesitter = {
      labels = "abcdefghijklmnopqrstuvwxyz", -- Définir les labels pour Treesitter
    },
  },
  -- Autres options
})

-- Définir les raccourcis clavier
vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })

