return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      -- local logo = [[
      --   ██████╗  █████╗ ███╗   ██╗██╗███████╗██╗    ██╗   ██╗██╗███╗   ███╗
      --             ██╔══██╗██╔══██╗████╗  ██║██║██╔════╝██║    ██║   ██║██║████╗ ████║        z
      --         ██║  ██║███████║██╔██╗ ██║██║█████╗  ██║    ██║   ██║██║██╔████╔██║     z
      --       ██║  ██║██╔══██║██║╚██╗██║██║██╔══╝  ██║    ╚██╗ ██╔╝██║██║╚██╔╝██║  z
      --   ██████╔╝██║  ██║██║ ╚████║██║███████╗███████╗╚████╔╝ ██║██║ ╚═╝ ██║
      --     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚══════╝ ╚═══╝  ╚═╝╚═╝     ╚═╝
      --   ]]
      local logo = [[
      ██╗  ██╗██╗    ██████╗  █████╗ ███╗   ██╗██╗███████╗██╗     
      ██║  ██║██║    ██╔══██╗██╔══██╗████╗  ██║██║██╔════╝██║     
      ███████║██║    ██║  ██║███████║██╔██╗ ██║██║█████╗  ██║     
      ██╔══██║██║    ██║  ██║██╔══██║██║╚██╗██║██║██╔══╝  ██║     
      ██║  ██║██║    ██████╔╝██║  ██║██║ ╚████║██║███████╗███████╗
      ╚═╝  ╚═╝╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚══════╝
                                                            

    ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
            { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
            { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
            { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
            { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
            { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
