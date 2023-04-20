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
