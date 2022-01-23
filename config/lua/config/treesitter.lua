require("nvim-treesitter.configs").setup({
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true,
    },
    refactor = {
        highlight_definitions = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "gR",
            },
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
            "#cf637e",
            "#f4a261",
            "#dbc074",
            "#aace8d",
            "#73d2d4",
            "#90c7f4",
            "#d59ee6",
        },
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
    yati = {
        enable = true,
    },
})

vim.cmd("highlight TSDefinitionUsage gui=underline")
