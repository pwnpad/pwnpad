-- Instant
function _G.InstantStartSession()
    local port = vim.fn.input("Server Port: ")
    vim.api.nvim_exec("InstantStartServer 0.0.0.0 " .. port, true)
    vim.api.nvim_exec("InstantStartSession 0.0.0.0 " .. port, true)
    vim.cmd("InstantStatus")
end

function _G.InstantJoinSession()
    local host = vim.fn.input("Server Host: ")
    local port = vim.fn.input("Server Port: ")
    vim.api.nvim_exec("InstantJoinSession " .. host .. " " .. port, true)
    vim.cmd("InstantStatus")
end

function _G.InstantStopSession()
    vim.api.nvim_exec("InstantStop")
    vim.cmd("InstantStatus")
end

function _G.InstantStopServer()
    vim.api.nvim_exec("InstantStopServer")
    vim.cmd("InstantStatus")
end

-- DAP
function _G.install_javadebug()
    local installation_path = vim.fn.stdpath("data") .. "/dapinstall/"

    if vim.fn.isdirectory(installation_path) == 0 then
        vim.fn.mkdir(installation_path)
    end

    installation_path = installation_path .. "/java-debug"
    vim.fn.mkdir(installation_path)

    local git_url = "https://github.com/microsoft/java-debug"

    vim.fn.system({ "git", "clone", git_url, installation_path })

    vim.cmd(
        string.format(
            "split | terminal cd %s && ./mvnw clean install",
            installation_path
        )
    )
end

function _G.uninstall_javadebug()
    local installation_path = vim.fn.stdpath("data") .. "/dapinstall/java-debug"
    vim.fn.delete(installation_path, "rf")

    print("Java-debug uninstalled")
end

vim.cmd("command! DIInstallJava call v:lua.install_javadebug()")
vim.cmd("command! DIUninstallJava call v:lua.uninstall_javadebug()")
