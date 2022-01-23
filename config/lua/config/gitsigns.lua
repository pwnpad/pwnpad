require("gitsigns").setup({
    signs = {
        delete = { text = "│" },
        topdelete = { text = "│" },
        changedelete = { text = "│" },
    },
    numhl = true,
})

vim.cmd([[
    highlight GitSignsAddLn guifg=#222424 guibg=#90c7f4
    highlight GitSignsChangeLn guifg=#222424 guibg=#dbc074
    highlight GitSignsDeleteLn guifg=#222424 guibg=#cf637e
]])
