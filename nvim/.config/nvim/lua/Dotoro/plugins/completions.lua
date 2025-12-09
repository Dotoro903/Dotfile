return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "saadparwaiz1/cmp_luasnip"
    },
    {
        "L3MON4D3/LuaSnip",
        -- version = "v2.*",
        -- build = "make install_jsregexp",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            -- "rafamadriz/friendly-snippets",

            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/Dotoro/snippets" })
            end
        },
    },
    {
        "hrsh7th/nvim-cmp",

        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                opts = {
                    completion = { completeopt = 'menu,menuone,noselect' },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    -- ["<Tab>"] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then
                    --         cmp.select_next_item()
                    --     elseif luasnip.expand_or_jumpable() then
                    --         luasnip.expand_or_jump()
                    --     else
                    --         fallback()
                    --     end
                    -- end, { "i", "s" }),
                    --
                    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
                    --     if cmp.visible() then
                    --         cmp.select_prev_item()
                    --     elseif luasnip.jumpable(-1) then
                    --         luasnip.jump(-1)
                    --     else
                    --         fallback()
                    --     end
                    -- end, { "i", "s" }),
                }),

                sorting = {
                    priority_weight = 2,
                    comparators = {
                        cmp.config.compare.exact,
                        cmp.config.compare.length,
                        cmp.config.compare.offset,
                        cmp.config.compare.score,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.order,
                    },
                },
                sources = cmp.config.sources({
                    {
                        name = "nvim_lsp",
                        priority = 1000,
                        entry_filter = function(entry, ctx)
                            return require("cmp").lsp.CompletionItemKind.Text ~= entry:get_kind()
                        end
                    },
                    { name = "luasnip", priority = 750 },
                    { name = "buffer",  priority = 500 },
                    { name = "path",    priority = 250 },

                }),
            })
        end,


    },
}
