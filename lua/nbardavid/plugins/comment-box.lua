return {
    "LudoPinelli/comment-box.nvim",
    config = function()
        local keymap = vim.keymap.set
        local opts = { noremap = true, silent = true }

        keymap({ "n", "v" }, "<Leader>cb", "<Cmd>CBccbox<CR>", opts)    -- Créer une boîte centrée
        keymap({ "n", "v" }, "<Leader>ct", "<Cmd>CBllline<CR>", opts)   -- Créer une ligne longue
        keymap("n", "<Leader>cl", "<Cmd>CBline<CR>", opts)              -- Créer une ligne simple
        keymap({ "n", "v" }, "<Leader>cm", "<Cmd>CBllbox14<CR>", opts)  -- Créer une boîte avec bordure stylisée
    end
}
