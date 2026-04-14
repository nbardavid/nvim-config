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

function M.open_term_in_tab(cmd)
    local pad = 6
    vim.cmd("tabnew")
    vim.cmd("terminal " .. (cmd or ""))
    local term_win = vim.api.nvim_get_current_win()

    local function make_pad(side)
        vim.cmd(side .. " vnew")
        local win = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_get_current_buf()
        vim.bo[buf].buftype = "nofile"
        vim.bo[buf].bufhidden = "wipe"
        vim.bo[buf].swapfile = false
        vim.bo[buf].buflisted = false
        vim.wo[win].number = false
        vim.wo[win].relativenumber = false
        vim.wo[win].signcolumn = "no"
        vim.wo[win].statuscolumn = ""
        vim.wo[win].foldcolumn = "0"
        vim.wo[win].winfixwidth = true
        vim.api.nvim_win_set_width(win, pad)
    end

    make_pad("topleft")
    vim.api.nvim_set_current_win(term_win)
    make_pad("botright")
    vim.api.nvim_set_current_win(term_win)
    vim.cmd("startinsert")
end

return M
