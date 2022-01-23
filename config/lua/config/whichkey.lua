local wk = require("which-key")

wk.setup({
    ignore_missing = true,
})

wk.register({
    D = { "<Cmd>DogeGenerate<CR>", "Generate docs" },
    F = { "<Cmd>lua vim.lsp.buf.formatting_sync()<CR>", "Format code" },
    T = { "<Cmd>Transparency<CR>", "Toggle Transparency" },
    o = { "<Cmd>CHADopen<CR>", "File Explorer" },
    u = { "<Cmd>UndotreeToggle<CR>", "Toggle UndoTree" },
    m = { "<Cmd>MarkdownPreviewToggle<CR>", "Toggle Markdown Preview" },

    c = {
        name = "Copilot",
        S = { "<Cmd>Copilot split<CR>", "Split Screen" },
        d = { "<Cmd>Copilot disable<CR>", "Disable Copilot" },
        e = { "<Cmd>Copilot enable<CR>", "Enable Copilot" },
        r = { "<Cmd>Copilot restart<CR>", "Restart Copilot" },
        s = { "<Cmd>Copilot status<CR>", "Copilot Status" },
    },

    d = {
        name = "Debugger",
        C = { "<Cmd>lua require'dap'.close()<CR>", "Close" },
        D = { "<Cmd>lua require'dapui'.disconnect()<CR>", "Disconnect" },
        R = { "<Cmd>lua require'dap'.repl.open()<CR>", "REPL" },
        S = { "<Cmd>lua require'dap'.step_into()<CR>", "Step Into" },
        b = { "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
        c = { "<Cmd>lua require'dap'.continue()<CR>", "Continue" },
        e = { "<Cmd>lua require'dapui'.eval()<CR>", "Evaluate" },
        o = { "<Cmd>lua require'dap'.step_out()<CR>", "Step Out" },
        s = { "<Cmd>lua require'dap'.step_over()<CR>", "Step Over" },
        u = { "<Cmd>lua require'dapui'.toggle()<CR>", "Open UI" },
    },

    f = {
        name = "FZF",
        ["/"] = { "<Cmd>lua require'fzf-lua'.blines()<CR>", "Lines in Buffer" },
        C = { "<Cmd>lua require'fzf-lua'.git_commits()<CR>", "Commits" },
        D = { "<Cmd>lua require'fzf-lua'.lsp_workspace_diagnostics()<CR>", "Workspace Diagnostics" },
        G = { "<Cmd>lua require'fzf-lua'.git_status()<CR>", "Git Status Files" },
        M = { "<Cmd>lua require'fzf-lua'.keymaps()<CR>", "Mappings" },
        b = { "<Cmd>lua require'fzf-lua'.buffers()<CR>", "Buffers" },
        c = { "<Cmd>lua require'fzf-lua'.git_bcommits()<CR>", "Commits for Buffer" },
        d = { "<Cmd>lua require'fzf-lua'.lsp_document_diagnostics()<CR>", "Document Diagnostics" },
        f = {
            "<Cmd>lua require'fzf-lua'.files({cmd='rg --files --hidden --no-ignore-vcs -g \"!.git/*\"'})<CR>",
            "Files",
        },
        g = { "<Cmd>lua require'fzf-lua'.git_files()<CR>", "Git Files" },
        h = { "<Cmd>lua require'fzf-lua'.command_history()<CR>", "Command History" },
        m = { "<Cmd>lua require'fzf-lua'.marks()<CR>", "Marks" },
        r = { "<Cmd>lua require'fzf-lua'.live_grep()<CR>", "Ripgrep" },
        s = { "<Cmd>lua require'fzf-lua'.spell_suggest()<CR>", "Spell Suggest" },
    },

    g = {
        name = "Git",
        R = { "<Cmd>Gitsigns reset_buffer<CR>", "Reset Buffer" },
        S = { "<Cmd>Gitsigns stage_buffer<CR>", "Stage Buffer" },
        U = { "<Cmd>Gitsigns reset_buffer_index<CR>", "Reset Buffer Index" },
        ["["] = { "<Cmd>Gitsigns prev_hunk<CR>", "Previous Hunk" },
        ["]"] = { "<Cmd>Gitsigns next_hunk<CR>", "Next Hunk" },
        b = { "<Cmd>Gitsigns blame_line<CR>", "Blame Line" },
        d = { "<Cmd>Gitsigns diffthis<CR>", "Reset Buffer Index" },
        p = { "<Cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
        r = { "<Cmd>Gitsigns reset_hunk<CR>", "Reset Hunk" },
        s = { "<Cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
        t = { "<Cmd>Gitsigns toggle_word_diff<CR>", "Toggle Word Diff" },
        u = { "<Cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
    },

    i = {
        name = "Instant",
        Q = { "<Cmd>call v:lua.InstantStopServer()<CR>", "Stop Instant Server" },
        j = { "<Cmd>call v:lua.InstantJoinSession()<CR>", "Join Instant Session" },
        q = { "<Cmd>call v:lua.InstantStopSession()<CR>", "Stop Instant Session" },
        s = { "<Cmd>call v:lua.InstantStartSession()<CR>", "Start Instant Session" },
    },

    l = {
        name = "LSP",
        D = { "<Cmd>Lspsaga show_line_diagnostics<CR>", "Show Line Diagnostics" },
        I = { "<Cmd>LspInstallInfo<CR>", "LSP Installer" },
        ["["] = { "<Cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic" },
        ["]"] = { "<Cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
        c = { "<Cmd>Lspsaga code_action<CR>", "Code Action" },
        d = { "<Cmd>Lspsaga show_cursor_diagnostics<CR>", "Show Cursor Diagnostics" },
        f = { "<Cmd>Lspsaga lsp_finder<CR>", "Find Reference" },
        h = { "<Cmd>Lspsaga hover_doc<CR>", "Docs" },
        i = { "<Cmd>LspInfo<CR>", "LSP Info" },
        p = { "<Cmd>Lspsaga preview_definition<CR>", "Preview Definition" },
        r = { "<Cmd>Lspsaga rename<CR>", "Rename Variable" },
        s = { "<Cmd>Lspsaga signature_help<CR>", "Show Signature" },
    },

    r = {
        name = "REPL",
        C = { "<Cmd>IronReplHere<CR>", "Create REPL Here" },
        R = { "<Cmd>IronRestart<CR>", "Restart REPL" },
        c = { "<Cmd>IronRepl<CR>", "Create REPL" },
        f = { "<Cmd>IronFocus<CR>", "Focus" },
        i = { "<Plug>(iron-interrupt)", "Interrupt REPL" },
        l = { "<Plug>(iron-clear)", "Clear REPL" },
        q = { "<Plug>(iron-exit)", "Quit REPL" },
        r = { "<Plug>(iron-repeat-cmd)", "Repeat Command" },
    },
}, { mode = "n", prefix = "," })

wk.register({
    c = { "<Cmd>lua require('Comment.api').call('toggle_linewise_op')<CR>g@", "Comment" },
    g = {
        name = "Git",
        s = { "<Cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
        u = { "<Cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
    },
    r = {
        name = "REPL",
        s = { "<Plug>(iron-visual-send)", "Send to REPL" },
    },
    m = {
        name = "Magic",
        a = { "<Plug>nvim-magic-suggest-alteration", "Alter Completion" },
        c = { "<Plug>nvim-magic-append-completion", "Append Completion" },
        d = { "<Plug>nvim-magic-suggest-docstring", "Suggest docstring" },
    },
}, { mode = "v", prefix = "," })
