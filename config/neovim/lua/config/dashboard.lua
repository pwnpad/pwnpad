vim.g.dashboard_custom_header = {
    "          ▀████▀▄▄              ▄█ ",
    "            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
    "    ▄        █          ▀▀▀▀▄  ▄▀  ",
    "   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
    "  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
    "  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
    "   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
    "    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
    "   █   █  █      ▄▄           ▄▀   ",
    "                                   ",
    "               PikaVim             ",
}

vim.g.dashboard_custom_section = {
    a = {
        description = { "  New File                  e" },
        command = ":enew",
    },
    b = {
        description = { "  Find files              ,ff" },
        command = ':FzfLua files cmd=rg\\ --files\\ --hidden\\ --no-ignore-vcs\\ -g\\ "!.git/*"',
    },
    c = {
        description = { "  Find Word               .fr" },
        command = ":FzfLua live_grep",
    },
    d = {
        description = { "  Find Marks              ,fm" },
        command = ":FzfLua marks",
    },
    e = {
        description = { "  File Explorer            ,o" },
        command = ":NvimTreeToggle",
    },
    f = {
        description = { "  Exit                      q" },
        command = ":exit",
    },
}

vim.g.dashboard_custom_footer = { "Stay hydrated folks" }
