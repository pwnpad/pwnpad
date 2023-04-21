-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    formatting = {
        format = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            menu = {
                nvim_lsp = "[LSP]",
                async_path = "[PATH]",
                treesitter = "[TS]",
                buffer = "[BUF]",
                luasnip = "[SNIP]",
            },
        }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "async_path" },
        { name = "treesitter" },
        { name = "buffer" },
        { name = "luasnip" },
    },
})

vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { link = "@boolean" })

vim.api.nvim_set_hl(0, "CmpItemKindClass", { link = "@lsp.types.class" })
vim.api.nvim_set_hl(0, "CmpItemKindConstant", { link = "@constant" })
vim.api.nvim_set_hl(0, "CmpItemKindField", { link = "@field" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { link = "@function" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { link = "@keyword" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "@method" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { link = "@include" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { link = "@character" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { link = "@variable" })

vim.api.nvim_set_hl(0, "ColorColumn", {})
