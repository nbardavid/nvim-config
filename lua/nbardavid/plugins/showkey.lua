return {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    config = function()
        require("showkeys").setup({
            position = "top-right",
        })
    end,
}
