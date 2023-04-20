local dap = require("dap")

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Conditional" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "String" })

require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

dap.configurations.java = {
    {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = 5005,
    },
}

require("mason-nvim-dap").setup({
    ensure_installed = {
        "python",
        "node2",
        "codelldb",
    },
    -- Makes a best effort to setup the various debuggers with
    -- reasonable debug configurations
    automatic_setup = true,
    -- You can provide additional configuration to the handlers,
    -- see mason-nvim-dap README for more information
    handlers = {},
})

require("nvim-dap-virtual-text").setup()

require("dapui").setup()

function _G.dap_args()
    local num = tonumber(vim.fn.input("Number of arguments: "))
    local t = {}
    for i = 1, num do
        t[i] = vim.fn.input("Argument " .. i .. ": ")
    end

    dap.configurations[vim.bo.filetype][1].args = t
end
