-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
return {
  { "catppuccin/nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}

