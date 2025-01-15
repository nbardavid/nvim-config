vim.g.mapleader = " " -- Set leader key to space

local keymap = vim.keymap

-- Exit insert mode with 'jk'
keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with 'jk'" })

-- Move selected line/block down in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line/block down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line/block up" })

keymap.set("n", "J", "mzJ z", { desc = "Join lines and center the screen" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center the screen" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center the screen" })

-- Arrow key alternatives in insert mode
keymap.set("i", "<C-h>", "<Left>", { desc = "Move cursor left in insert mode" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Move cursor right in insert mode" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Move cursor up in insert mode" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Move cursor down in insert mode" })

-- Save file with Ctrl+S in normal and insert modes
keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file in normal mode" })
keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file in insert mode" })

keymap.set("v", "<", "<gv", {noremap = true, silent = true})
keymap.set("v", ">", ">gv", {noremap = true, silent = true})

vim.keymap.set("n", "<Esc>", function()
    vim.cmd("nohlsearch")
end, { noremap = true, silent = true })
