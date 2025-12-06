local C = require("Dotoro.snippets.common")
local ls, s, t, i = C.ls, C.s, C.t, C.i

local function solve_snip(trigger, ret_type, default_ret, print_expr)
    return s(trigger, {
        t({ "#include <bits/stdc++.h>", "" }),
        t({ "using namespace std;", "", "" }),

        t(ret_type .. " solve() {"),
        t({ "", "    " }), i(1, ""),
        t({ "", "", "    return " .. default_ret .. ";", "}" }),

        -- main()
        t({ "", "", "int main(void) {",
            "    ios::sync_with_stdio(false);",
            "    cin.tie(nullptr);",
            "",
            "    cout << " .. print_expr .. " << \"\\n\";",
            "",
            "    return 0;",
            "}" }),
    })
end

ls.add_snippets("cpp", {
    s("ps", {
        t("#include <bits/stdc++.h>"),
        t({ "", "using namespace std;", "" }),

        t({ "", "int main(void) {",
            "    ios::sync_with_stdio(false);",
            "    cin.tie(nullptr);",
            "",
            "    " }), i(1, ""),
        t({ "", "", "    return 0;", "}" }),
    }),

    solve_snip("psint", "int", "0", "solve()"),
    solve_snip("psfloat", "float", "0.0f", "solve()"),
    solve_snip("psdouble", "double", "0.0", "solve()"),
    solve_snip("psbool", "bool", "false", "(solve() ? \"true\" : \"false\")"),
})
