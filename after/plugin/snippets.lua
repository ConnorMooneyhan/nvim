local ls = require'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix

local copy_first = function(one) return one[1][1] end
local capitalize_first_letter = function(one)
  return string.gsub(one[1][1], "^(.)", function(firstLetter)
    return string.upper(firstLetter)
  end)
end

ls.add_snippets("javascript", {
  s("lg", {
    t("console.log(\""), f(copy_first, {1}), t("\", "), i(1), t(");")
  }),
  s("st", {
    t("const ["), i(1, "state"), t(", "),
    f(function(one) return 'set' .. capitalize_first_letter(one) end, {1}),
    t("] = useState("), i(2, "null"), t(');')
  }),
  s("ds", {
    t("const { "), i(1), t(" } = "), i(2), t(";")
  }),
  s("im", {
    t("import { "), i(1), t(" } from \""), i(2), t("\";")
  }),
  s("iife", {
    t("(() => {"), i(0), t("})()")
  }),
})
ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("javascriptreact", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascript" })

ls.add_snippets("tex", {
  s("m", {
    t("$"), i(1), t("$")
  }),
  s("b", {
    t("\\mathbb{"), i(1), t("}")
  }),
  s("mb", {
    t("$\\mathbb{"), i(1), t("}$")
  }),
  s("s", {
    t("\\mathscr{"), i(1), t("}")
  }),
  s("ms", {
    t("$\\mathscr{"), i(1), t("}$")
  }),
  s("be", {
    t("\\begin{"), i(1), t("}"), i(0), t("\\end{"), f(copy_first, {1}), t("}")
  }),
  s("im", {
    t("\\implies")
  })
})
