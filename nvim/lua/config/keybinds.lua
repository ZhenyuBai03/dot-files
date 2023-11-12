-- setting for keybinds


-- buffer
vim.keymap.set('n', '<leader>bq', '<cmd>bw<cr>', { desc = "Quit buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Swap buffers" })
vim.keymap.set("n", "<leader>bp", "<cmd>:let @+ = expand('%:p')<cr>", {desc = "copy absolute path"})

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- window
vim.keymap.set("n", "<leader>ww", "<c-w>p", { desc = "Swap window" })
vim.keymap.set("n", "<leader>wq", "<c-w>c", { desc = "Quit window" })
vim.keymap.set("n", "<leader>w-", "<c-w>s", { desc = "Split window below" })
vim.keymap.set("n", "<leader>w^", "<c-w>v", { desc = "Split window right" })
vim.keymap.set("n", "<leader>-", "<c-w>s", { desc = "Split window below" })
vim.keymap.set("n", "<leader>^", "<c-w>v", { desc = "Split window right" })
vim.keymap.set("n", "<leader>w=", "<c-w>=", { desc = "Equalize width and height" })

-- tab
vim.keymap.set("n", "<C-t>", "<cmd>tabnew<cr>", { desc = "new tab" })

vim.keymap.set("n", "<C-c>", "<cmd>tabclose<cr>", { desc = "close tab" })
vim.keymap.set("n", "<C-n>", "<cmd>tabnext<cr>", { desc = "switch tab" })

-- terminal
vim.keymap.set("n", "<leader>t", "<cmd>terminal<cr>", { desc = "open terminal" })

-- neotree
vim.keymap.set('n', '<leader>e', '<cmd>Neotree<cr>', { desc = 'Neo-tree' })

