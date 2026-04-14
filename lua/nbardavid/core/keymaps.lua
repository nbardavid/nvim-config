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

vim.keymap.set("n", "<leader>th", function ()
    require("nvchad.themes").open()
end, {})

vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })

--vim.api.nvim_create_autocmd({"BufEnter"}, {
--    callback = function()
--        vim.cmd("ShowKeyToggle")
--    end
--})

-- Resize splits
keymap.set({"n", "t"}, "<A-{>", "<Cmd>resize -2<CR>", { desc = "Increase split height" })
keymap.set({"n", "t"}, "<A-\">", "<Cmd>resize +2<CR>", { desc = "Decrease split height" })
keymap.set({"n", "t"}, "<A-|>", "<Cmd>vertical resize -5<CR>", { desc = "Decrease split width" })
keymap.set({"n", "t"}, "<A-:>", "<Cmd>vertical resize +5<CR>", { desc = "Increase split width" })

keymap.set("n", "<leader>tc", "<cmd>tabnew | terminal claude<cr>", { desc = "Claude in tab" })
keymap.set("n", "<leader>tt", "<cmd>tabnew | terminal<cr>", { desc = "Terminal in tab" })
keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- NVCHAD

