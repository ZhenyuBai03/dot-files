return {
  {
    "karoliskoncevicius/vim-sendtowindow",
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local wk = require("which-key")
          wk.register({
            ["]c"] = {
              function()
                if vim.wo.diff then
                  return "]c"
                end
                vim.schedule(function()
                  gs.next_hunk()
                end)
                return "<Ignore>"
              end,
              "Next git hunk",
              { expr = true, buffer = bufnr },
            },
            ["[c"] = {
              function()
                if vim.wo.diff then
                  return "[c"
                end
                vim.schedule(function()
                  gs.prev_hunk()
                end)
                return "<Ignore>"
              end,
              "Previous git hunk",
              { expr = true, buffer = bufnr },
            },
          })
        end,
      })
    end,
  },
  {
    "mbbill/undotree",
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "svelte",
        "css",
      },
    },
  },
  {
    "github/copilot.vim",
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
