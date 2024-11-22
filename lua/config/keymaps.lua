-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "

local keymap = vim.keymap

--插入模式--
keymap.set("i", "jk", "<ESC>")

--视觉模式--
--单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--正常模式--
--窗口
keymap.set("n", "sh", "<C-w>v") --垂向新增窗口
keymap.set("n", "sv", "<C-w>s") --水平向新增窗口

--取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

--插件--
--nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- 切换buffer
-- keymap.set("n", "<C-i>", ":bnext<CR>")
-- keymap.set("n", "<C-u>", ":bprevious<CR>")

-- 上下左右
-- keymap.set("i", "<S-h>", "<Left>")
-- keymap.set("i", "<S-j>", "<Down>")
-- keymap.set("i", "<S-k>", "<Up>")
-- keymap.set("i", "<S-l>", "<Right>")
