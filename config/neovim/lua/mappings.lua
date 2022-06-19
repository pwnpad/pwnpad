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
    "<Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bfirst<CR><CR>"
)
remap(
    "n",
    "<Leader>bj",
    "<Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR><CR>"
)
remap(
    "n",
    "<Leader>bk",
    "<Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR><CR>"
)
remap(
    "n",
    "<Leader>bl",
    "<Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:blast<CR><CR>"
)
remap("n", "<Leader>bq", "<Cmd>bdelete<CR>")

-- Stops cursor from flying everywhere
remap("n", "n", "nzzzv")
remap("n", "N", "Nzzzv")

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
    require("fzf-lua").files({ cmd = 'rg --files --hidden --no-ignore-vcs -g "!.git/*"' })
end)

remap("n", "<C-g>", function()
    require("fzf-lua").live_grep_native()
end)

-- LSPSaga
remap("n", "[g", function()
    require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()
end)
remap("n", "]g", function()
    require("lspsaga.diagnostic").lsp_jump_diagnostic_next()
end)
remap("n", "ga", function()
    require("lspsaga.codeaction").code_action()
end)
remap("n", "gd", function()
    require("lspsaga.provider").preview_definition()
end)
remap("n", "gf", function()
    require("lspsaga.provider").lsp_finder()
end)
remap("n", "gh", function()
    require("lspsaga.hover").render_hover_doc()
end)
remap("n", "gr", function()
    require("lspsaga.rename").rename()
end)

-- COQ Autopairs
remap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]])
remap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]])
remap("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]])
remap("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]])

-- UndoTree
remap("n", "<Tab>", "<Cmd>UndotreeToggle<CR>")

-- Format
remap("n", "g=", function()
    vim.lsp.buf.formatting_sync()
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
