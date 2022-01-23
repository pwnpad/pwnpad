local remap = vim.api.nvim_set_keymap

-- Vanilla
-- Rebinds arrow keys to increase/decrease size of pane while in normal/visual mode
-- Increase horizontal split
remap("n", "<Up>", [[<Cmd>resize +2<CR>]], { noremap = true, silent = true })
remap("v", "<Up>", [[<Cmd>resize +2<CR>]], { noremap = true, silent = true })

-- Decrease horizontal split
remap("n", "<Down>", [[<Cmd>resize -2<CR>]], { noremap = true, silent = true })
remap("v", "<Down>", [[<Cmd>resize -2<CR>]], { noremap = true, silent = true })

-- Decrease vertical split
remap("n", "<Left>", [[<Cmd>vertical resize -2<CR>]], { noremap = true, silent = true })
remap("v", "<Left>", [[<Cmd>vertical resize -2<CR>]], { noremap = true, silent = true })

-- Increase vertical split
remap("n", "<Right>", [[<Cmd>vertical resize +2<CR>]], { noremap = true, silent = true })
remap("v", "<Right>", [[<Cmd>vertical resize +2<CR>]], { noremap = true, silent = true })

-- Better window switching
-- Move to pane on the left      Ctrl-h
remap("n", "<C-h>", "<C-w>h", {})
-- Move to lower pane            Ctrl-j
remap("n", "<C-j>", "<C-w>j", {})
-- Move to upper pane            Ctrl-j
remap("n", "<C-k>", "<C-w>k", {})
-- Move to pane on the right     Ctrl-h
remap("n", "<C-l>", "<C-w>l", {})

-- Remap semicolon to colon
remap("n", ";", ":", { noremap = true })

-- Lazy colon, {noremap = true
remap("n", ";", ":", { noremap = true })

-- Cycling buffers
remap(
    "n",
    "<Leader>bh",
    [[<Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bfirst<CR><CR>]],
    { noremap = true }
)
remap(
    "n",
    "<Leader>bj",
    [[<Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR><CR>]],
    { noremap = true }
)
remap(
    "n",
    "<Leader>bk",
    [[<Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR><CR>]],
    { noremap = true }
)
remap(
    "n",
    "<Leader>bl",
    [[<Cmd>if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:blast<CR><CR>]],
    { noremap = true }
)
remap("n", "<Leader>bq", [[<Cmd>bdelete<CR>]], { noremap = true })

-- Stops cursor from flying everywhere
remap("n", "n", "nzzzv", { noremap = true })
remap("n", "N", "Nzzzv", { noremap = true })

-- Better undo breakpoints
remap("i", ",", ",<C-g>u", { noremap = true })
remap("i", ".", ".<C-g>u", { noremap = true })

-- Move stuff in visual mode
remap("v", "J", [[:m '>+1'<CR>gv=gv]], { noremap = true })
remap("v", "K", [[:m '<-2'<CR>gv=gv]], { noremap = true })

-- Colorizer
remap("n", "<Leader>T", [[<Cmd>Transparency<CR>]], { noremap = true, silent = true })

-- FZF-Lua
remap(
    "n",
    "<C-p>",
    "<cmd>lua require'fzf-lua'.files({cmd='rg --files --hidden --no-ignore-vcs -g \"!.git/*\"'})<CR>",
    { noremap = true, silent = true }
)

remap(
    "n",
    "<C-g>",
    "<cmd>lua require'fzf-lua'.live_grep_native()<CR>",
    { noremap = true, silent = true }
)

-- LSPSaga
remap("n", "[g", [[<Cmd>Lspsaga diagnostic_jump_prev<CR>]], { noremap = true, silent = true })
remap("n", "]g", [[<Cmd>Lspsaga diagnostic_jump_next<CR>]], { noremap = true, silent = true })
remap("n", "ga", [[<Cmd>Lspsaga code_action<CR>]], { noremap = true, silent = true })
remap("n", "gd", [[<Cmd>Lspsaga preview_definition<CR>]], { noremap = true, silent = true })
remap("n", "gf", [[<Cmd>Lspsaga lsp_finder<CR>]], { noremap = true, silent = true })
remap("n", "gh", [[<Cmd>Lspsaga hover_doc<CR>]], { noremap = true, silent = true })
remap("n", "gr", [[<Cmd>Lspsaga rename<CR>]], { noremap = true, silent = true })

-- COQ Autopairs
remap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- UndoTree
remap("n", "<Tab>", [[<Cmd>UndotreeToggle<CR>]], {})

-- Format
remap("n", "g=", [[<Cmd>lua vim.lsp.buf.formatting_sync()<CR>]], { noremap = true, silent = true })

-- Instant
remap("n", "<Leader>Is", [[<Cmd>call v:lua.InstantStartSession()<CR>]], {})
remap("n", "<Leader>Ij", [[<Cmd>call v:lua.InstantJoinSession()<CR>]], {})
remap("n", "<Leader>Iq", [[<Cmd>call v:lua.InstantStopSession()<CR>]], {})
remap("n", "<Leader>IQ", [[<Cmd>call v:lua.InstantStopServer()<CR>]], {})

-- Gitsigns
remap(
    "n",
    "<Leader>hd",
    '[[<cmd>lua require"gitsigns".diffthis()<CR>]]',
    { noremap = true, silent = true }
)

-- DAP
remap("n", "<F5>", [[<Cmd>lua require'dap'.continue()<CR>]], { noremap = true, silent = true })
remap(
    "n",
    "<F6>",
    [[<Cmd>lua require'dap'.toggle_breakpoint()<CR>]],
    { noremap = true, silent = true }
)
remap("n", "<F10>", [[<Cmd>lua require'dap'.step_over()<CR>]], { noremap = true, silent = true })
remap("n", "<F11>", [[<Cmd>lua require'dap'.step_into()<CR>]], { noremap = true, silent = true })
remap("n", "<F12>", [[<Cmd>lua require'dap'.step_out()<CR>]], { noremap = true, silent = true })
remap("n", "<Leader>dc", [[<Cmd>lua require'dap'.close()<CR>]], { noremap = true, silent = true })
remap(
    "n",
    "<Leader>dr",
    [[<Cmd>lua require'dap'.repl.open()<CR>]],
    { noremap = true, silent = true }
)
remap(
    "n",
    "<Leader>du",
    [[<Cmd>lua require'dapui'.toggle()<CR>]],
    { noremap = true, silent = true }
)
remap("n", "<Leader>de", [[<Cmd>lua require'dapui'.eval()<CR>]], { noremap = true, silent = true })

-- Iron
remap("v", "is", "<Plug>(iron-visual-send)", { noremap = true })
