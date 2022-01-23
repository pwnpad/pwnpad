local pythonrepl = "python"
if vim.api.nvim_call_function("executable", { "ipython" }) == 1 then
    pythonrepl = "ipython"
end

require("iron").core.set_config({
    repl_open_cmd = "botright 15 split",
    preferred = {
        python = pythonrepl,
    },
})

vim.g.iron_map_defaults = 0
vim.g.iron_map_extended = 0
