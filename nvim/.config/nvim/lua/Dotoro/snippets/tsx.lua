local C = require("Dotoro.snippets.common")
local ls, s, t, i, rep = C.ls, C.s, C.t, C.i, C.rep

ls.add_snippets("typescriptreact", {
    -- React functional component
    s("rfc", {
        t("const "), i(1, "ComponentName"), t({ " = () => {", "  return (" }),
        t({ "", "    <div>", "      " }), i(2),
        t({ "", "    </div>", "  )", "}" }),
        t({ "", "", "export default " }), rep(1), t(";"),
    }),
})

ls.add_snippets("javascriptreact", {
    s("rfc", {
        t("const "), i(1, "ComponentName"), t({ " = () => {", "  return (" }),
        t({ "", "    <div>", "      " }), i(2),
        t({ "", "    </div>", "  )", "}" }),
        t({ "", "", "export default " }), rep(1), t(";"),
    }),
})
