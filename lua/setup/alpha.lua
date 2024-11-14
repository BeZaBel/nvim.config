local header = {
    "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓",
    "┃  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ┃",
    "┃  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ┃",
    "┃ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ┃",
    "┃ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ┃",
    "┃ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ┃",
    "┃ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ┃",
    "┃ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ┃",
    "┃    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ┃",
    "┃          ░    ░  ░    ░ ░        ░   ░         ░    ┃",
    "┃                                 ░                   ┃",
    "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛",
}

return {
    setup = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = header
        dashboard.section.header.opts = {
            position = "center",
        }

        dashboard.section.buttons.val = {
            -- dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("n", "  -  New file", "<cmd>ene<cr>"),
            dashboard.button("g", "  -  New general note", require("file_functions").create_general_note),
            dashboard.button("e", "  -  New writing", require("file_functions").new_escrito),
            dashboard.button("l", "  -  Open file explorer", "<cmd>Oil<cr>"),
            dashboard.button("q", "󰩈  -  Exit Neovim", "<cmd>q!<cr>"),
        }

        dashboard.section.footer.val = {
            "",
            "",
            "",
            "",
            "El progreso de un pueblo no se mide por la opulencia de los pocos",
            "            sino por el bienestar de los muchos.",
            "",
            "Jesús Silva Herzog",
        }

        alpha.setup(dashboard.opts)
    end,
}
