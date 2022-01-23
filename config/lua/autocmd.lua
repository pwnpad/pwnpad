local cmd = vim.cmd

-- Remove comment on newline
cmd([[
    autocmd BufNewFile,Bufread * setlocal formatoptions-=cro
]])

-- Syntax highlight
cmd([[
    augroup highlights
        autocmd!
        autocmd Filetype * if &ft!="dashboard" && &ft!="WhichKey" && &ft!="packer" && &ft!="lsp-installer" | call matchadd('ColorColumn', '\%101v[^\n]')
        autocmd FileType text,markdown,tex setlocal spell
        autocmd FileType text,markdown,tex highlight clear ColorColumn
    augroup END
]])

-- CHADTree
cmd([[
    augroup Chad
        autocmd!
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'CHADopen' | wincmd p | ene | exe 'cd '.argv()[0] | endif
    augroup END
]])

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
