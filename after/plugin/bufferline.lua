vim.opt.termguicolors = true -- Assure que les couleurs fonctionnent
require("bufferline").setup({
    options = {
        show_buffer_close_icons = true, -- Affiche les icônes pour fermer un buffer
        show_close_icon = false,        -- Cache l'icône globale pour fermer
        always_show_bufferline = true,  -- Affiche toujours le bufferline même s'il y a un seul buffer
        enforce_regular_tabs = false,   -- Buffers occupent des espaces proportionnels à leur nom
        separator_style = "slant", -- Style des séparateurs (slant, padded_slant, etc.)
        diagnostics = "nvim_lsp", -- Affiche les diagnostics LSP
        offsets = {
            {
                filetype = "NvimTree", -- Décale le bufferline quand NvimTree est ouvert
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
    },
})

vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- Fermer un buffer
vim.keymap.set("n", "<leader>bc", ":bdelete<CR>", { desc = "Close buffer" })

-- Réorganiser les buffers
vim.keymap.set("n", "<leader>bp", ":BufferLineMovePrev<CR>", { desc = "Move buffer left" })
vim.keymap.set("n", "<leader>bn", ":BufferLineMoveNext<CR>", { desc = "Move buffer right" })
