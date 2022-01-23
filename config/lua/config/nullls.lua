vim.cmd([[
    command Format lua vim.lsp.buf.formatting_sync()
]])

local null_ls = require("null-ls")
local formatter_install = require("format-installer")

local custom_configs = {
    clang_format = {
        extra_args = {
            "--style",
            "{IndentWidth: 4, PointerAlignment: Left, ColumnLimit: 100, AllowShortFunctionsOnASingleLine: Empty}",
        },
    },
    prettier = {
        extra_args = {
            "--tab-width=4",
            "--print-width=100",
        },
    },
    stylua = {
        extra_args = {
            "--column-width=100",
            "--indent-type=Spaces",
        },
    },
    yapf = {
        extra_args = {
            "--style",
            "{column_limit:100}",
        },
    },
}

local sources = {}
for _, formatter in ipairs(formatter_install.get_installed_formatters()) do
    local config = { command = formatter.cmd }
    if custom_configs[formatter.name] ~= nil then
        config.extra_args = custom_configs[formatter.name].extra_args
    end
    table.insert(sources, null_ls.builtins.formatting[formatter.name].with(config))
end

null_ls.setup({
    sources = sources,
})
