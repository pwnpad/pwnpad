""" Vim-Plug -----------------------------------------------------------------
call plug#begin()

Plug 'dracula/vim'

Plug 'shadmansaleh/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSInstallSync all'}
Plug 'machakann/vim-highlightedyank'

Plug 'lewis6991/gitsigns.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } , 'on': 'FZF'}
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq', 'do': 'python3 -m coq deps'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'alphatroya/lspsaga.nvim'
Plug 'kabouzeid/nvim-lspinstall'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'windwp/nvim-autopairs'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'anyakichi/vim-surround'

Plug 'vim-scripts/LargeFile'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'lewis6991/impatient.nvim'
Plug 'abecodes/tabout.nvim'
Plug 'nvim-lua/plenary.nvim'

call plug#end()
""" End Of Vim-Plug -----------------------------------------------------------


""" Optimisation ---------------------------------------------------------------
lua require('impatient')
set lazyredraw
set ttyfast
set foldmethod=syntax
set foldmethod=expr
set showcmd
set noruler
""" End Of Optimisation ---------------------------------------------------------


""" Vanilla Colouring ---------------------------------------------------------
syntax on
set termguicolors
colorscheme dracula
highlight clear Comment
highlight Comment cterm=italic guifg=#7c7c7c
highlight ColorColumn guifg=#ff5555 guibg=#231833
highlight Normal guibg=NONE

"""" End Of Vanilla Colouring --------------------------------------------------


""" Vanilla Configurations ----------------------------------------------------
set number relativenumber
set encoding=UTF-8
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set autoindent
set smartindent
set wrap
set tabstop=4 shiftwidth=4 
set tabstop=4
set softtabstop=4
set expandtab
set list listchars=tab:»·,trail:·,nbsp:·
set cursorline
set splitright
set splitbelow
call matchadd('ColorColumn', '\%101v[^\n]')
set updatetime=50
set noshowmode
set spelllang=en_gb
augroup textfiles
    autocmd!
    autocmd FileType text,markdown,tex setlocal spell
    autocmd FileType text,markdown,tex highlight clear ColorColumn
augroup END
""" End Of Vanilla Configurations ----------------------------------------------


""" Vanilla Rebindings -------------------------------------------------------
"" Rebinds arrow keys to increase/decrease size of pane while in normal/visual mode
" Increase horizontal split
nnoremap <silent> <Up> :resize +2 <CR>
vnoremap <silent> <Up> :resize +2 <CR>
" Decrease horizontal split
nnoremap <silent> <Down> :resize -2 <CR>
vnoremap <silent> <Down> :resize -2 <CR>
" Increase vertical split
nnoremap <silent> <Left> :vertical resize -2 <CR>
vnoremap <silent> <Left> :vertical resize -2 <CR>
" Decrease horizontal split
nnoremap <silent> <Right> :vertical resize +2 <CR>
vnoremap <silent> <Right> :vertical resize +2 <CR>

"" Better window switching
" Move to pane on the left      Ctrl-h
nmap <C-h> <C-W>h
" Move to lower pane            Ctrl-j
nmap <C-j> <C-W>j
" Move to upper pane            Ctrl-j
nmap <C-k> <C-W>k
" Move to pane on the right     Ctrl-h
nmap <C-l> <C-W>l

"" Better tab
" Create new tabs    \t
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tj :tabNext<CR>
nnoremap <leader>tk :tabprevious<CR>
nnoremap <leader>tl :tablast<CR>
nnoremap <leader>tq :tabclose<CR>

"" Easy Save
" Save files    Ctrl-s
imap <C-s> <Esc>:w<CR>a

"" Remap semicolon to colon
nnoremap ; :

"" Cycling buffers
nnoremap <leader>bh :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bfirst<CR><CR>
nnoremap <leader>bj :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR><CR>
nnoremap <leader>bk :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR><CR>
nnoremap <leader>bl :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:blast<CR><CR>
nnoremap <leader>bq :bdelete<CR>

"" Capital Y now actually makes sense
nnoremap Y yg_

"" Stops cursor from flying everywhere
nnoremap n nzzzv
nnoremap N Nzzzv

"" Better undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u

"" Move stuff in visual mode
vnoremap J :m '>+1'<CR>gv=gv
vnoremap K :m '<-2'<CR>gv=gv
""" End Of Vanilla Rebindings -------------------------------------------------


""" Highlighted Yank Configurations -------------------------------------------
"" Colours
highlight HighlightedyankRegion gui=reverse

"" Settings
let g:highlightedyank_highlight_duration = -1
""" End Of Highlighted Yank Configurations ------------------------------------


""" Lua-Airline Configurations ------------------------------------------------
lua <<EOF
require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'dracula',
        section_separators = {left = '', right = ''},
        component_separators = {left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', {
                'diff',
                colored = false,
            }
        },
        lualine_c = {'filename', 'filesize'},
        lualine_x = {
            'location',
            {
                'filetype',
                colored = true,
            },
        },
        lualine_y = {
            {
                'encoding',
                padding = { left = 1, right = 0 },
            },
            'fileformat',
        },
        lualine_z = {
            {
                'diagnostics',
                sources = { 'nvim_lsp' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
                diagnostics_color = {
                    error = {bg = "#282a36", fg = "#ff5555"},
                    warn = {bg = "#282a36", fg = "#ffb86c"},
                    info = {bg = "#282a36", fg = "#f1fa8c"},
                }
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {'branch', {
                'diff',
                colored = false,
            }
        },
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                buffers_color = {
                    inactive = {bg = '#44475a', fg = '#ffffff'},
                },
                padding = 0,
            }
        },
        lualine_y = {
            function () return [[buffers]] end,
            {
                'filetype',
                icon_only = true,
            },
        }
    },
    extensions = {'fzf', 'chadtree'},
}
EOF
""" End Of Lua-Airline Configurations -----------------------------------------


""" FZF Configurations --------------------------------------------------------
"" Settings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Constant', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs -g '!.git/*'"

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let $BAT_THEME = 'Dracula'
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

"" Mappings
nnoremap <silent><C-p> :Files<CR>
nnoremap <silent><C-g> :RG<CR>
""" End Of FZF Configurations -------------------------------------------------

""" LSP Configurations --------------------------------------------------------
"" Colours
highlight Pmenu guifg=#ffffff guibg=#282a36
highlight PmenuSel guifg=#000000 guibg=#bd93f9
highlight LspDiagnosticsDefaultError ctermfg=9
highlight LspDiagnosticsDefaultWarning ctermfg=3

" LSP settings
lua <<EOF
vim.g.coq_settings = {
    auto_start = 'shut-up',
    keymap = {
        recommended = false,
        jump_to_mark = '<c-x>',
    },
}

local lspconfig = require'lspconfig'
local coq = require'coq'
local lspinstall = require'lspinstall'

local jedi_config = require"lspinstall/util".extract_config("jedi_language_server")
jedi_config.default_config.cmd[1] = "./venv/bin/jedi-language-server"

require'lspinstall/servers'.jedi = vim.tbl_extend('error', jedi_config, {
     install_script = [[
     python3 -m venv ./venv
     ./venv/bin/pip3 install --upgrade pip
     ./venv/bin/pip3 install --upgrade jedi-language-server
     ]]
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspinstall.setup()
local servers = lspinstall.installed_servers()
table.insert(servers, 'clangd')

for _, server in pairs(servers) do
    local config = {
        capabilities = capabilities,
        flags = { debounce_text_changes = 500 },
        root_dir = lspconfig.util.path.dirname,
    }

    if server == 'latex' then
        config.settings = { texlab = { build = {
            args = { "-halt-on-error", "%f" },
            executable = "pdflatex",
            onSave = true,
        }, }, }
    end

    lspconfig[server].setup(coq.lsp_ensure_capabilities(config))
end

require'lspsaga'.init_lsp_saga{
    finder_action_keys = {
        open = {'<CR>', 'o'}, quit = {'q', '<esc>', '<C-c>'},
    },
    code_action_keys = {
        quit = {'q', '<esc>', '<C-c>'}
    },
    rename_action_keys = {
        quit = {'<esc>', '<C-c>'}
    },
}
EOF

nnoremap <silent>gd :Lspsaga preview_definition<CR>
nnoremap <silent>gh :Lspsaga hover_doc<CR>
nnoremap <silent>gf :Lspsaga lsp_finder<CR>
nnoremap <silent>gr :Lspsaga rename<CR>
nnoremap <silent>gc :Lspsaga code_action<CR>
""" End Of LSP Configurations -------------------------------------------------


""" Undo Tree Configurations --------------------------------------------------
"" Mappings
" Activate Undo Tree    Tab
nmap <Tab> :UndotreeToggle<CR>

"" Settings
" Loads persistent undo tree to ~/.cache
if has('persistent_undo')
    set undodir=~/.cache/undotree
    set undofile
endif
""" End Of UndoTree Configurations --------------------------------------------

""" Autopairs Configurations --------------------------------------------------
"" Settings
lua <<EOF
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

npairs.setup({ map_bs = false })

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.CR = function()
if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
        return npairs.esc('<c-y>')
    else
        return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
    else
        return npairs.autopairs_cr()
    end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
        return npairs.esc('<c-e>') .. npairs.autopairs_bs()
    else
        return npairs.autopairs_bs()
    end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
EOF
""" End Of Autopairs Configurations ------------------------------------------


""" Nerd Commenter Configurations ---------------------------------------------
"" Settings
let g:NERDSpaceDelims = 1                      " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1                  " Use compact syntax for prettified multi-line comments
let g:NERDAltDelims_java = 1                   " Set a language to use its alternate delimiters by default
let g:NERDTrimTrailingWhitespace = 1           " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1              " Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDCustomDelimiters = {
    \ 'python': { 'left': '#', 'right': '' }
    \ }                                        " Fix for double spacing while commenting Python
""" End Of Nerd Commenter Configurations --------------------------------------


""" TreeSitter Configurations -------------------------------------------------
"" Enable tree sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = true,
    },
    refactor = {
        highlight_definitions = { enable = true },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
            '#ff5555',
            '#ffb86c',
            '#f1fa8c',
            '#50fa7b',
            '#8be9fd',
            '#bd93f9',
        },
    }
}
EOF

"" Underline definitions
highlight TSDefinitionUsage gui=underline
""" End of TreeSitter ---------------------------------------------------------

lua <<EOF
-- Tabout
require'tabout'.setup()

require('gitsigns').setup{
    signs = {
        delete = { text = '│' },
        topdelete = { text = '│' },
        changedelete = { text = '│' },
    },
    numhl = true,
}
vim.api.nvim_set_keymap('n', '<Leader>hd', '[[<cmd>lua require("gitsigns").diffthis()<CR>]]', { noremap = true, silent = true })
EOF
