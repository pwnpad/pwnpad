local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Remove comment on newline
autocmd({ "BufNewFile", "Bufread" }, {
    pattern = "*",
    command = "setlocal formatoptions-=cro",
})

-- Syntax highlight
local highlights = augroup("highlights", { clear = true })
autocmd("FileType", {
    pattern = "*",
    group = highlights,
    command = "if &ft!='dashboard' && &ft!='WhichKey' && &ft!='lazy' && &ft!='mason' | call matchadd('ColorColumn', '\\%101v[^\n]')",
})
autocmd("FileType", {
    pattern = { "text", "markdown", "text" },
    group = highlights,
    command = "setlocal spell",
})
autocmd("FileType", {
    pattern = { "text", "markdown", "text" },
    group = highlights,
    callback = function()
        vim.api.nvim_set_hl(0, "ColorColumn", {})
    end,
})

autocmd("FileType", {
    pattern = { "yaml" },
    callback = function()
        vim.o.shiftwidth = 4
    end,
})

-- Dashboard
cmd([[
    augroup dashboard_au
        autocmd! * <buffer>
        autocmd User DashboardReady nnoremap <buffer> i <Cmd>enew<CR>i
        autocmd User DashboardReady nnoremap <buffer> e <Cmd>enew<CR>
        autocmd User DashboardReady nnoremap <buffer> q <Cmd>exit<CR>
    augroup END
]])

-- Terminal
cmd([[
    augroup term_nonumber
        autocmd!
        autocmd TermOpen * setlocal nonumber norelativenumber
    augroup END

    augroup vimrc_term
        autocmd!
        autocmd WinEnter term://* nohlsearch
        autocmd WinEnter term://* startinsert
        autocmd TermOpen * setlocal listchars= | set nocursorline | set nocursorcolumn
        autocmd TermOpen * tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
        autocmd TermOpen * tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
        autocmd TermOpen * tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
        autocmd TermOpen * tnoremap <buffer> <C-l> <C-\><C-n><C-w>l
    augroup END
]])

-- COQ
cmd([[
    augroup coq
        autocmd!
        autocmd VimEnter * highlight Pmenu ctermfg=247 ctermbg=235
        autocmd VimEnter * highlight PmenuSel ctermfg=0 ctermbg=13
        autocmd VimEnter * highlight LspDiagnosticsDefaultError ctermfg=9
        autocmd VimEnter * highlight LspDiagnosticsDefaultWarning ctermfg=3
        autocmd VimEnter * highlight COQMarks guifg=#FFE37E guibg=#353B45
    augroup END
]])
