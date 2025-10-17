-- -------------------------------------------------------------------------- --
--                                                                            --
--                                                        :::      ::::::::   --
--   options.lua                                        :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: nbardavi <nbardavi@student.42.fr>          +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2025/01/15 09:50:10 by nbardavi          #+#    #+#             --
--   Updated: 2025/03/12 14:41:51 by nbardavi         ###   ########.fr       --
--                                                                            --
-- -------------------------------------------------------------------------- --

vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    callback = function()
        local hl = vim.api.nvim_get_hl(0, {name="CursorLine"})
        vim.api.nvim_set_hl(0, "CursorColumn", {bg=hl.bg});
        vim.wo.cursorline = true
        vim.wo.cursorcolumn = true
    end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    callback = function()
        vim.wo.cursorline = false
        vim.wo.cursorcolumn = false
    end,
})

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.inccommand = "split"

vim.o.winborder = "single"

vim.o.exrc = true

vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
]]
