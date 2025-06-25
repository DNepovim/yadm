-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>rn", ":IncRename ")

vim.keymap.set({ "i", "v" }, "kj", "<Esc>")
vim.keymap.set({ "i", "v" }, "KJ", "<Esc>")

vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")

vim.keymap.set("n", "<tab>", ":bnext<Return>")
vim.keymap.set("n", "<S-tab>", ":bprev<Return>")

-- Window splitting
vim.keymap.set("n", "ss", ":vsplit<CR>", { silent = true, desc = "Split window horizontally" })
vim.keymap.set("n", "sv", ":split<CR>", { silent = true, desc = "Split window vertically" })
vim.keymap.set("n", "sd", ":close<CR>", { silent = true, desc = "close window" })

-- Smart splits
-- resizing splits
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)

-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)

vim.keymap.set("n", "sh", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "sj", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "sk", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "sl", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "so", require("smart-splits").move_cursor_previous)

-- swapping buffers between windows
vim.keymap.set("n", "SH", require("smart-splits").swap_buf_left, { desc = "Swap buffer left" })
vim.keymap.set("n", "SJ", require("smart-splits").swap_buf_down, { desc = "Swap buffer down" })
vim.keymap.set("n", "SK", require("smart-splits").swap_buf_up, { desc = "Swap buffer up" })
vim.keymap.set("n", "SL", require("smart-splits").swap_buf_right, { desc = "Swap buffer right" })

