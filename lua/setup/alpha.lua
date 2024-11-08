return {
    setup = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            " ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
            " ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
            "▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
            "▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
            "▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
            "░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
            "░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
            "   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
            "         ░    ░  ░    ░ ░        ░   ░         ░   ",
            "                                ░                  ",
        }

        dashboard.section.buttons.val = {
            -- dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("n", "  -  New file", "<cmd>ene<cr>"),
            dashboard.button("l", "  -  Open file explorer", "<cmd>Oil<cr>"),
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
