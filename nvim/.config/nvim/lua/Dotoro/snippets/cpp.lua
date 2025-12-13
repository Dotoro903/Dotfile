local C = require("Dotoro.snippets.common")
local ls, s, t, i, rep = C.ls, C.s, C.t, C.i, C.rep

local function solve_snip(trigger, ret_type, default_ret, main_body)
    return s(trigger, {
        t({
            "#include <bits/stdc++.h>",
            "#include <algorithm>",
            "",
        }),
        t({ "using namespace std;", "", "" }),

        t(ret_type .. " solve() {"),
        t({ "", "    " }), i(1, ""),
        default_ret and t({ "", "", "    return " .. default_ret .. ";", "}" })
        or t({ "", "", "}" }),

        -- main()
        t({ "", "", "int main(void) {",
            "    ios::sync_with_stdio(false);",
            "    cin.tie(nullptr);",
            "",
            "    " .. main_body,
            "",
            "    return 0;",
            "}" }),
    })
end

ls.add_snippets("cpp", {
    -- plain main
    s("ps", {
        t({
            "#include <bits/stdc++.h>",
            "#include <algorithm>",
            "",
        }),
        t({ "", "using namespace std;", "" }),

        t({ "", "int main(void) {",
            "    ios::sync_with_stdio(false);",
            "    cin.tie(nullptr);",
            "",
            "    " }), i(1, ""),
        t({ "", "", "    return 0;", "}" }),
    }),

    solve_snip("psint", "int", "0", "cout << solve() << \"\\n\";"),
    solve_snip("psfloat", "float", "0.0f", "cout << solve() << \"\\n\";"),
    solve_snip("psdouble", "double", "0.0", "cout << solve() << \"\\n\";"),
    solve_snip("psbool", "bool", "false", "solve();"),
    solve_snip("psvoid", "void", nil, "solve();"),

    -- input snippet
    s("cin1", {
        i(1, "int"), t(" "),
        i(2, "n"), t({ ";", "" }),
        t("cin >> "), rep(2), t(";"),
    }),
    s("fori", {
        t("for (int "),
        i(1, "i"),
        t(" = 0; "),
        rep(1),
        t(" < "),
        i(2, "n"),
        t("; "),
        rep(1),
        t("++) {"),
        t({ "", "    " }),
        i(0),
        t({ "", "}" }),
    }),

    -- testcase snippet
    s("tc", {
        t("int "),
        i(1, "t"), t({ ";", "" }),

        t("cin >> "), rep(1), t({ ";", "" }),

        t("while ("), rep(1), t("--) {"),
        t({ "", "    " }),
        i(2),
        t({ "", "}" }),
    }),

    -- vector input snippet
    s("vin", {
        -- int n;
        t("int "),
        i(1, "n"),
        t({ ";", "" }),

        -- cin >> n;
        t("cin >> "),
        rep(1),
        t({ ";", "" }),

        -- vector<int> a(n);
        t("vector<"),
        i(2, "int"),
        t("> "),
        i(3, "a"),
        t("("),
        rep(1),
        t({ ");", "" }),

        -- for (int i = 0; i < n; i++) cin >> a[i];
        t("for (int "),
        i(4, "i"),
        t(" = 0; "),
        rep(4),
        t(" < "),
        rep(1),
        t("; "),
        rep(4),
        t("++) {"),
        t({ "", "    cin >> " }),
        rep(3),
        t("["),
        rep(4),
        t("];"),
        t({ "", "}" }),
    }),

    -- long long snippet
    s("ll", {
        t("long long")
    })
})
