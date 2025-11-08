return {
    dir = "~/.config/nvim/lua/nbardavid/fake-typing-core",
    name = "fake-typing",
    config = function()
        local ft = require("nbardavid.fake-typing-core")
        
        -- Active le mode fake typing avec <leader>ft en mode visuel
        vim.keymap.set('v', '<leader>ft', function()
            ft.start()
        end, { desc = "Start fake typing mode" })
    end,
}
