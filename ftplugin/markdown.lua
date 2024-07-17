local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("markdown", {
  s("languages", {
    t { "```", "" },
    i(1),
    t { "", "```" },
  }),
})

ls.add_snippets("markdown", {
  s("descrip", {
    t { "```", "" },
    i(1, "A short Description"),
    t { "```", "" },
  }),
})
