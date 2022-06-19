local opt = vim.o
local glo = vim.g

-- Optimisation
opt.foldmethod = "expr"
opt.lazyredraw = true
opt.ruler = false

-- Colouring
opt.termguicolors = true

-- Configurations
opt.cursorline = true
opt.encoding = "utf-8"
opt.expandtab = true
opt.list = true
opt.listchars = "tab:»·,trail:·,nbsp:·"
opt.mouse = "nvi"
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 4
opt.showmode = false
opt.softtabstop = 4
opt.spelllang = "en_gb"
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.updatetime = 50
opt.whichwrap = "b,s,<,>,h,l"
opt.wrap = true

-- Copy Paste
glo.clipboard = {
    name = "pbcopy",
    copy = {
        ["*"] = "pbcopy",
        ["+"] = "pbcopy",
    },
    paste = {
        ["*"] = "pbpaste",
        ["+"] = "pbpaste",
    },
    cache_enabled = 0,
}

-- TreeSitter
opt.foldenable = false
opt.foldlevel = 20
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- WhichKey
opt.timeoutlen = 500

-- Vim DoGe
glo.doge_comment_interactive = 0

-- UndoTree
opt.undodir = vim.fn.getenv("HOME") .. "/.cache/nvim/undotree"
opt.undofile = true
