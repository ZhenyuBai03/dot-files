return {
  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/wiki/vimwiki/",
          syntax = "default",
          ext = ".wiki",
          template_path = "~/wiki/templates/",
          template_default = "default_tmp",
          template_ext = ".html",
          auto_toc = 1,
          vimwiki_listsyms = "✗○◐●✓",
        },
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_method = "skim"
      vim.maplocalleader = ","
      vim.vimtex_view_skim_sync = 1
      vim.vimtex_view_skim_reading_bar = 1
      vim.g.Tex_MultipleCompileFormats = "pdf,bib,pdf"
    end,
  },
  {
    "nvim-neorg/neorg",
    run = ":Neorg sync-parsers", -- This is the important bit!
    config = function()
      require("neorg").setup({
        -- configuration here
        load = {
          ["core.defaults"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                school = "~/notes/school",
                work = "~/notes/work",
              },
            },
          },
          ["core.concealer"] = {},
        },
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "iurimateus/luasnip-latex-snippets.nvim",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip-latex-snippets").setup()
        -- or setup({ use_treesitter = true })
        require("luasnip").config.setup({ enable_autosnippets = true })
        require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/plugins/Luasnip" })
      end,
    },
  },
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    -- vimtex isn't required if using treesitter
    requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    config = function()
      require("luasnip-latex-snippets").setup()
      -- or setup({ use_treesitter = true })
      require("luasnip").config.setup({ enable_autosnippets = true })
    end,
  },
}
