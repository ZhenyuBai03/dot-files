-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init

local map = vim.keymap.set
local del = vim.keymap.del

vim.g.maplocalleader = ","
-- Disable functions
vim.keymap.del("n", "<leader>`")
vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>wd")
del("n", "<leader>L")

-- Resize window using <option> arrow keys
map("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-Right>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-Left>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
map("n", "<leader>wp", "<cmd>sp <cr> <cmd>term python3<cr>", {})
map("n", "<leader>t", "<cmd>vsp <cr> <cmd>term<cr>", {})

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w\\", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>wp", "<cmd>sp <cr> <cmd>term python3<cr>", {})
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })

-- tabs
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- undo tree
map("n", "<leader>h", "<cmd>UndotreeToggle<cr>", { desc = "Toggle Undo Tree" })

-- git commands
map("n", "<leader>gd", "<cmd>Gvdiff<cr>", { desc = "Diff Split" })
map("n", "<leader>gds", "<cmd>Gvdiffsplit!<cr>", { desc = "3 way Diff Split" })

-- vimwiki remaps
map("n", "<leader>vv", "<cmd>VimwikiIndex<cr>", { desc = "Open Vimwiki Index", remap = true })
map("n", "<leader>vt", "<cmd>VimwikiTabIndex<cr>", { desc = "wiki index file in new tab", remap = true })
map("n", "<leader>vs", "<cmd>VimwikiUISelect<cr>", { desc = "select and open", remap = true })
map("n", "<leader>vd", "<cmd>VimwikiDeleteFile<cr>", { desc = "delete vimwiki file", remap = true })
map("n", "<leader>vr", "<cmd>VimwikiRenameFile<cr>", { desc = "rename vimwiki file", remap = true })
map("n", "<leader>va", "<cmd>VimwikiTOC<cr>", { desc = "create Table of Content", remap = true })
