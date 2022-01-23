-- vim.g.python3_host_prog = '/usr/bin/python3' -- For plugins using Python

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd("packadd packer.nvim")
end

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init({
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

local function getConfig(name)
    return string.format("require('config/%s')", name)
end

return packer.startup(function(use)
    use({ "wbthomason/packer.nvim" })

    use({
        "lewis6991/impatient.nvim",
        config = function()
            require("impatient")
        end,
    })

    use({
        "Pocco81/Catppuccino.nvim",
        branch = "old-catppuccino",
        config = getConfig("catppuccino"),
    })

    use({
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPre",
        config = function()
            require("colorizer").setup()
        end,
    })

    use({
        "nvim-lualine/lualine.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        event = "VimEnter",
        config = getConfig("lualine"),
    })

    use({
        "glepnir/dashboard-nvim",
        requires = {
            {
                "ibhagwan/fzf-lua",
                event = "VimEnter",
                config = function()
                    require("fzf-lua").setup({
                        winopts = {
                            preview = {
                                scrollbar = false,
                                wrap = "wrap",
                            },
                        },
                    })
                end,
            },
            "kyazdani42/nvim-web-devicons",
        },
        config = getConfig("dashboard"),
    })

    use({
        "ms-jpq/chadtree",
        branch = "chad",
        cmd = "CHADopen",
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            "nvim-treesitter/nvim-treesitter-refactor",
            "windwp/nvim-ts-autotag",
            "p00f/nvim-ts-rainbow",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "yioneko/nvim-yati",
            {
                "windwp/nvim-autopairs",
                event = "InsertEnter",
                config = getConfig("autopair"),
            },
        },
        config = getConfig("treesitter"),
    })

    use({
        "machakann/vim-highlightedyank",
        event = "BufReadPost",
        config = function()
            vim.cmd("highlight HighlightedyankRegion gui=reverse")
            vim.g.highlightedyank_highlight_duration = -1
        end,
    })

    use({
        "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim",
        event = "BufReadPre",
        config = getConfig("gitsigns"),
    })

    use({
        "neovim/nvim-lspconfig",
        requires = {
            "williamboman/nvim-lsp-installer",
            "tami5/lspsaga.nvim",
            {
                "ms-jpq/coq_nvim",
                branch = "coq",
            },
            "ms-jpq/coq.artifacts",
            "ms-jpq/coq.thirdparty",
            {
                "PlatyPew/copilot.vim",
                branch = "removevirt",
                cmd = "Copilot",
            },
        },
        config = getConfig("lsp"),
    })

    use({
        "jameshiew/nvim-magic",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
        },
        ft = { "python", "javascript", "typescript", "go", "sh" },
        event = "VimEnter",
        config = function()
            require("nvim-magic").setup()
        end,
    })

    use({
        "mfussenegger/nvim-dap",
        requires = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "mfussenegger/nvim-jdtls",
            "Pocco81/DAPInstall.nvim",
        },
        event = "BufReadPre",
        config = getConfig("dap"),
    })

    use({
        "anyakichi/vim-surround",
        requires = "tpope/vim-repeat",
    })

    use({
        "folke/which-key.nvim",
        event = "VimEnter",
        config = getConfig("whichkey"),
    })

    use({
        "mg979/vim-visual-multi",
        event = "BufReadPre",
    })

    use({
        "numToStr/Comment.nvim",
        event = "VimEnter",
        requires = "JoosepAlviste/nvim-ts-context-commentstring",
        config = getConfig("comment"),
    })

    use({
        "KeitaNakamura/tex-conceal.vim",
        ft = "tex",
        config = function()
            vim.g.tex_flavor = "latex"
            vim.g.tex_conceal = "abdgm"
            vim.g.tex_conceal_frac = 1
            vim.cmd("highlight clear Conceal")
        end,
    })

    use({
        "hkupty/iron.nvim",
        cmd = { "IronRepl", "IronReplHere" },
        config = getConfig("iron"),
    })

    use({
        "jbyuki/instant.nvim",
        cmd = { "InstantStartServer", "InstantJoinSession" },
        config = function()
            vim.g.instant_username = io.popen("whoami"):read("*a"):sub(0, -2)
        end,
    })

    use({
        "kkoomen/vim-doge",
        run = "./scripts/install.sh",
        cmd = "DogeGenerate",
        config = function()
            vim.g.doge_mapping = "<Leader>K"
            vim.g.doge_doc_standard_c = "kernel_doc"
        end,
    })

    use({
        "mattn/emmet-vim",
        ft = { "html", "css", "markdown", "javascriptreact" },
        event = "InsertCharPre",
    })

    use({
        "mbbill/undotree",
        cmd = "UndotreeToggle",
    })

    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = "PlatyPew/format-installer.nvim",
        after = "nvim-lspconfig",
        config = getConfig("nullls"),
    })

    use({ "vim-scripts/LargeFile" })

    use({
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        run = "cd app && npm install",
        cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    })

    local status_ok, _ = pcall(require, "packer_compiled")
    if not status_ok then
        return
    end

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
