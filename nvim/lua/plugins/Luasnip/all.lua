-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

ls.add_snippets("all", {
  s("test", {
    t("hello world"),
    i(1),
    t("hello world"),
  }),
})
local function text_before_cursor(args, _)
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  return line:sub(1, col)
end

ls.add_snippets("tex", {
  s("mk", {
    t("$"),
    i(1),
    t("$"),
  }),
  s("dm", {
    t("{{$"),
    i(1),
    t("}}$"),
  }),
  s("LL", {
    t("\\mathcal{L}"),
  }),
})
