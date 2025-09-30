return {
    'b0o/incline.nvim',
    event = 'VeryLazy',
    config = function()
        local helpers = require 'incline.helpers'
        local devicons = require 'nvim-web-devicons'
        require('incline').setup {
            window = {
                padding = 0,
                margin = { horizontal = 0 },
            },
            render = function(props)
                local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':.')
                return {
                    ' ',
                    filename,
                    ' ',
                }
            end
        }
    end,
}
