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
    "          Better Than VSCode       ",
}

vim.g.dashboard_custom_section = {
    a = {
        description = { "  New File                  e" },
        command = ":enew",
    },
    b = {
        description = { "  Find files              ,ff" },
        command = ':Telescope find_files',
    },
    c = {
        description = { "  Find Word               ,fr" },
        command = ":Telescope live_grep",
    },
    d = {
        description = { "  Find Marks              ,fm" },
        command = ":Telescope marks",
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

vim.g.dashboard_custom_footer = { "Stay Hydrated Folks" }
