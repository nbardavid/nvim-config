local M = {}

function M.custom_bdelete()
    local curr_buf = vim.api.nvim_get_current_buf()
    local wins = vim.api.nvim_list_wins()
    local visible_buffers = {}

    for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        visible_buffers[buf] = true
    end

    local num_visible_buffers = vim.tbl_count(visible_buffers)

    if num_visible_buffers > 1 then
        require("bufferline").cycle(1)
    end
    vim.cmd("confirm bdelete " .. curr_buf)
end

return M
