local npairs = require("nvim-autopairs")
local rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.setup({ map_bs = true })

npairs.add_rules({
    rule(" ", " ")
        :with_pair(function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ "()", "{}", "[]" }, pair)
        end)
        :with_move(cond.none())
        :with_cr(cond.none())
        :with_del(function(opts)
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local context = opts.line:sub(col - 1, col + 2)
            return vim.tbl_contains({ "(  )", "{  }", "[  ]" }, context)
        end),
    rule("", " )")
        :with_pair(cond.none())
        :with_move(function(opts)
            return opts.char == ")"
        end)
        :with_cr(cond.none())
        :with_del(cond.none())
        :use_key(")"),
    rule("", " }")
        :with_pair(cond.none())
        :with_move(function(opts)
            return opts.char == "}"
        end)
        :with_cr(cond.none())
        :with_del(cond.none())
        :use_key("}"),
    rule("", " ]")
        :with_pair(cond.none())
        :with_move(function(opts)
            return opts.char == "]"
        end)
        :with_cr(cond.none())
        :with_del(cond.none())
        :use_key("]"),
})

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
vim.api.nvim_set_keymap(
    "i",
    "<esc>",
    [[pumvisible() ? "<c-e><esc>" : "<esc>"]],
    { expr = true, noremap = true }
)
vim.api.nvim_set_keymap(
    "i",
    "<c-c>",
    [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]],
    { expr = true, noremap = true }
)
vim.api.nvim_set_keymap(
    "i",
    "<tab>",
    [[pumvisible() ? "<c-n>" : "<tab>"]],
    { expr = true, noremap = true }
)
vim.api.nvim_set_keymap(
    "i",
    "<s-tab>",
    [[pumvisible() ? "<c-p>" : "<bs>"]],
    { expr = true, noremap = true }
)

-- skip it, if you use another global object
_G.MUtils = {}

MUtils.CR = function()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info({ "selected" }).selected ~= -1 then
            return npairs.esc("<c-y>")
        else
            return npairs.esc("<c-e>") .. npairs.autopairs_cr()
        end
    else
        return npairs.autopairs_cr()
    end
end
vim.api.nvim_set_keymap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

MUtils.BS = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
        return npairs.esc("<c-e>") .. npairs.autopairs_bs()
    else
        return npairs.autopairs_bs()
    end
end
vim.api.nvim_set_keymap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })
