local dap_install = require("dap-install")

dap_install.setup()
for debugger, _ in pairs(require("dap-install.core.debuggers_list").debuggers) do
    dap_install.config(debugger, {})
end

local dap = require("dap")

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Conditional" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "String" })

dap.configurations.cpp = {
    {
        name = "Launch LLDB",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " ")
        end,
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.configurations.java = {
    {
        type = "java",
        request = "attach",
        name = "Attach To Process",
        hostName = "127.0.0.1",
        port = 5005,
    },
}

if dap.configurations.javascript ~= nil then
    dap.configurations.javascript[1].name = "Launch Node2"
    dap.configurations.javascript[1].program = "${file}"
    dap.configurations.javascript[2] = {
        name = "Attach To Process",
        type = "node2",
        request = "attach",
        processId = require("dap.utils").pick_process,
    }
end

require("nvim-dap-virtual-text").setup()

require("dapui").setup()
