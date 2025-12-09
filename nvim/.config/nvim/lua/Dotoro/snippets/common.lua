local ls = require("luasnip")
local extras = require("luasnip.extras")

return {
    ls = ls,
    s = ls.snippet,
    t = ls.text_node,
    i = ls.insert_node,
    rep = extras.rep,
}
