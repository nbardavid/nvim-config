return {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    config = function()
        require("showkeys").setup({
            maxkeys = 5,
            position = "top-right",
        })
    end,
}
