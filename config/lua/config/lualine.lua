require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "catppuccino",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename", "filesize" },
        lualine_x = {
            "location",
            {
                "filetype",
                colored = true,
            },
        },
        lualine_y = {
            {
                "encoding",
                padding = { left = 1, right = 0 },
            },
            "fileformat",
        },
        lualine_z = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = { error = " ", warn = " ", info = " " },
                diagnostics_color = {
                    error = { bg = "#222424", fg = "#cf637e" },
                    warn = { bg = "#222424", fg = "#f4a261" },
                    info = { bg = "#222424", fg = "#dbc074" },
                    hint = { bg = "#222424", fg = "#dbc074" },
                },
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {
            "branch",
            {
                "diff",
                colored = false,
            },
        },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
    },
    tabline = {
        lualine_a = {
            {
                "buffers",
                buffers_color = {
                    inactive = { bg = "#44475a", fg = "#ffffff" },
                },
                padding = 1,
                filetype_names = {
                    dashboard = "舘Dashboard",
                    CHADTree = " CHADTree",
                    ["lsp-installer"] = " LSP Install",
                    undotree = " UndoTree",
                    lspinfo = " LSP Info",
                },
            },
        },
        lualine_y = {
            function()
                return [[buffers]]
            end,
        },
    },
    extensions = { "chadtree" },
})
