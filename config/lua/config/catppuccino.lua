vim.g.transparent = true
local catppuccino = require("catppuccino")

catppuccino.setup({
    colorscheme = "soft_manilo",
    transparency = vim.g.transparent,
    integrations = {
        lsp_saga = true,
    },
})

function transparency()
    vim.g.transparent = not vim.g.transparent
    catppuccino.setup({ transparency = vim.g.transparent })
    vim.cmd("colorscheme catppuccino")
end

vim.cmd([[
    command Transparency lua transparency()
    syntax on
    colorscheme catppuccino
    highlight ColorColumn guifg=#d84652 guibg=#000000
]])
