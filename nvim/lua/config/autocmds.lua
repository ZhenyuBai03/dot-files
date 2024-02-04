-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local status_ok, ntree = pcall(require, "neo-tree")
if not status_ok then
  return
end

ntree.setup({
  filesystem = {
    window = {
      mappings = {
        ["<S-CR>"] = "system_open",
      },
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()

        local special_characters = "([% %'%(%)%&])"
        path = string.gsub(path, special_characters, "\\%1")
        --print(path)
        -- Execute the system command to open the file externally
        vim.fn.system("open " .. path)
        --vim.fn.system("open " .. path)
        -- vim.ui.open("https://neovim.io/")
        --local cmd = vim.system({ "echo", "hello" }, { text = true })
        --execute 'silent !open '.shellescape(path, 1)
      end,
    },
  },
})

-- Autocommand to open PDF and JPG files using an external command
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*.pdf", "*.jpg", "*.jpeg", "*.png", "*.gif", "*.svg", "*.mov", "*.mp4", "*.avi" },
  callback = function()
    -- Get the filename of the current buffer
    local filename = vim.api.nvim_buf_get_name(0)
    -- Check if the buffer is loaded (to avoid running on buffer switch)
    if vim.fn.bufloaded(filename) == 1 then
      -- Use vim.fn.system to call the external open command
      vim.fn.system("open " .. vim.fn.shellescape(filename))
      -- Close the buffer without saving
      vim.api.nvim_buf_delete(0, { force = true })
    end
  end,
})
