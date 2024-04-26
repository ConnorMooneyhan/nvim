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
  s("i", {
    t("^{-1}")
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
  s("al", { -- align*
    t("\\begin{align*}"), i(0), t("\\end{align*}")
  }),
  s("bb", { -- \mathbb
    t("\\mathbb{"), i(1), t("}")
  }),
  s("be", { -- begin...end
    t("\\begin{"), i(1), t("}"), i(0), t("\\end{"), f(copy_first, {1}), t("}")
  }),
  s("bf", { -- \mathbf
    t("\\mathbf{"), i(1), t("}"), i(0)
  }),
  s("cal", { -- \mathcal
    t("\\mathcal{"), i(1), t("}")
  }),
  s("em", { -- \emptyset
    t("\\emptyset")
  }),
  s("fr", { -- fraction
    t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0)
  }),
  s("im", { -- implies
    t("\\implies")
  }),
  s("la", { -- \langle
    t("\\langle")
  }),
  s("lam", { -- lambda
    t("\\lambda")
  }),
  s("lb", { -- left brace
    t("\\lbrace")
  }),
  s("le", { -- \leq
    t("\\leq")
  }),
  s("lrp", { -- \left( ... \right)
    t("\\left( "), i(1), t(" \\right)"), i(0)
  }),
  s("lra", { -- \langle ... \rangle
    t("\\left\\langle "), i(1), t(" \\right\\rangle"), i(0)
  }),
  s("lrb", { -- \lbrace ... \rbrace
    t("\\left\\lbrace "), i(1), t(" \\right\\rbrace"), i(0)
  }),
  s("lu", { -- _{...}^{...}
    t("_{"), i(1), t("}^{"), i(2), t("}"), i(0)
  }),
  s("m", { -- $...$
    t("$"), i(1), t("$")
  }),
  s("mm", { -- $$...$$
    t("\\begin{equation*}"), i(0), t("\\end{equation*}")
  }),
  s("in", { -- \in
    t("\\in")
  }),
  s("ne", { -- \neq
    t("\\neq")
  }),
  s("ov", { -- \overline{...}
    t("\\overline{"), i(1), t("}")
  }),
  s("ra", { -- \rangle
    t("\\rangle")
  }),
  s("rb", { -- right brace
    t("\\rbrace")
  }),
  s("rm", { -- \mathrm{...}\,
    t("\\mathrm{"), i(1), t("}\\,"), i(0)
  }),
  s("scr", { -- \mathscr
    t("\\mathscr{"), i(1), t("}")
  }),
  s("sd", { -- \bigtriangleup (symmetric difference)
    t("\\bigtriangleup")
  }),
  s("sm", { -- \setminus
    t("\\setminus")
  }),
  s("sub", { -- subset
    t("\\subset")
  }),
  s("ul", { -- \underline{...}
    t("\\underline{"), i(1), t("}"), i(0)
  }),
})
