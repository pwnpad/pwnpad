local dap_install = require("dap-install")
for _, debugger in ipairs(require("dap-install.api.debuggers").get_installed_debuggers()) do
    dap_install.config(debugger)
end

local dap = require("dap")
dap.adapters.lldb = {
    type = "executable",
    command = "lldb-vscode",
    name = "lldb",
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.java = {
    {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = 5005,
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

if dap.configurations.javascript ~= nil then
    dap.configurations.javascript[1].program = "${file}"
end

require("nvim-dap-virtual-text").setup()

require("dapui").setup()
