local remap = vim.keymap.set

-- Vanilla
-- Rebinds arrow keys to increase/decrease size of pane while in normal/visual mode
-- Increase horizontal split
remap("n", "<Up>", "<Cmd>resize +2<CR>")
remap("v", "<Up>", "<Cmd>resize +2<CR>")

-- Decrease horizontal split
remap("n", "<Down>", "<Cmd>resize -2<CR>")
remap("v", "<Down>", "<Cmd>resize -2<CR>")

-- Decrease vertical split
remap("n", "<Left>", "<Cmd>vertical resize -2<CR>")
remap("v", "<Left>", "<Cmd>vertical resize -2<CR>")

-- Increase vertical split
remap("n", "<Right>", "<Cmd>vertical resize +2<CR>")
remap("v", "<Right>", "<Cmd>vertical resize +2<CR>")

-- Better window switching
-- Move to pane on the left      Ctrl-h
remap("n", "<C-h>", "<C-w>h")
-- Move to lower pane            Ctrl-j
remap("n", "<C-j>", "<C-w>j")
-- Move to upper pane            Ctrl-j
remap("n", "<C-k>", "<C-w>k")
-- Move to pane on the right     Ctrl-h
remap("n", "<C-l>", "<C-w>l")

-- Remap semicolon to colon
remap("n", ";", ":")

-- Lazy colon, {noremap = true
remap("n", ";", ":")

-- Cycling buffers
remap(
    "n",
    "<Leader>bh",
    "<Cmd>:bfirst<CR>"
)
remap(
    "n",
    "<Leader>bj",
    "<Cmd>:bnext<CR>"
)
remap(
    "n",
    "<Leader>bk",
    "<Cmd>:bprevious<CR>"
)
remap(
    "n",
    "<Leader>bl",
    "<Cmd>:blast<CR>"
)
remap("n", "<Leader>bq", "<Cmd>bdelete<CR>")

-- Stops cursor from flying everywhere
remap("n", "n", "nzzzv")
remap("n", "N", "Nzzzv")

-- Prevents pasted over text from replacing register
remap("x", "p", "pgvy")

-- Better undo breakpoints
remap("i", ",", ",<C-g>u")
remap("i", ".", ".<C-g>u")

-- Move stuff in visual mode
remap("v", "J", [[:m '>+1'<CR>gv=gv]])
remap("v", "K", [[:m '<-2'<CR>gv=gv]])

-- Colorizer
remap("n", "<Leader>T", [[<Cmd>Transparency<CR>]])

-- FZF-Lua
remap("n", "<C-p>", function()
    require('telescope.builtin').find_files()
end)

remap("n", "<C-g>", function()
    require('telescope.builtin').live_grep()
end)

-- LSPSaga
remap("n", "[g", function()
    require("lspsaga.diagnostic"):goto_prev()
end)
remap("n", "]g", function()
    require("lspsaga.diagnostic"):goto_next()
end)
remap("n", "gc", "<Cmd>Lspsaga code_action<CR>")
remap("n", "gp", "<Cmd>Lspsaga peek_definition<CR>")
remap("n", "gf", "<Cmd>Lspsaga lsp_finder<CR>")
remap("n", "gh", "<Cmd>Lspsaga hover_doc<CR>")
remap("n", "gr", "<Cmd>Lspsaga rename<CR>")

-- UndoTree
remap("n", "<Tab>", "<Cmd>UndotreeToggle<CR>")

-- Format
remap("n", "g=", function()
    vim.lsp.buf.format()
end)

-- Instant
remap("n", "<Leader>Is", function()
    _G.InstantStartSession()
end)
remap("n", "<Leader>Ij", function()
    _G.InstantJoinSession()
end)
remap("n", "<Leader>Iq", function()
    _G.InstantStopSession()
end)
remap("n", "<Leader>IQ", function()
    _G.InstantStopServer()
end)

-- Gitsigns
remap("n", "<Leader>hd", function()
    require("gitsigns").diffthis()
end)
remap("n", "]c", function()
    require("gitsigns").next_hunk()
end)
remap("n", "[c", function()
    require("gitsigns").prev_hunk()
end)

-- DAP
remap("n", "<F5>", function()
    require("dap").continue()
end)
remap("n", "<F6>", function()
    require("dap").toggle_breakpoint()
end)
remap("n", "<F10>", function()
    require("dap").step_over()
end)
remap("n", "<F11>", function()
    require("dap").step_into()
end)
remap("n", "<F12>", function()
    require("dap").step_out()
end)
remap("n", "<Leader>dc", function()
    require("dap").close()
end)
remap("n", "<Leader>dr", function()
    require("dap").repl.open()
end)
remap("n", "<Leader>du", function()
    require("dapui").toggle()
end)
remap("n", "<Leader>de", function()
    require("dapui").eval()
end)

-- SnipRun
remap("n", "<Leader>f", "<Plug>SnipRun")
remap("v", "f", "<Plug>SnipRun")
