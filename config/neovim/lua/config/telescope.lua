require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
                ["<ESC>"] = require('telescope.actions').close,
            },
        },
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top",
        },
    },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
