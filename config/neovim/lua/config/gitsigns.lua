require("gitsigns").setup({
    signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '│' },
        topdelete    = { text = '║' },
        changedelete = { text = '║' },
        untracked    = { text = '┆' },
    },
    numhl = true,
})

vim.api.nvim_set_hl(0, "GitSignsAddLn", { fg = "#222424", bg = "#90c7f4" })
vim.api.nvim_set_hl(0, "GitSignsChangeLn", { fg = "#222424", bg = "#dbc074" })
vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { fg = "#222424", bg = "#cf637e" })
