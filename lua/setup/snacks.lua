return {
    opts = {
        bigfile = { enabled = true },
        bufdelete = { enabled = false },
        notifier = {
            enabled = true,
            timeout = 3000,
            style = "minimal",
        },
        quickfile = { enabled = true },
        statuscolumn = {
            enabled = true,
            left = { "mark", "sign" }, -- priority of signs on the left (high to low)
            right = { "fold", "git" }, -- priority of signs on the right (high to low)
            folds = {
                open = true, -- show open fold icons
                git_hl = true, -- use Git Signs hl for fold icons
            },
            git = {
                -- patterns to match Git signs
                patterns = { "GitSign", "MiniDiffSign" },
            },
            refresh = 50,
        },
        lazygit = { enabled = true },
        rename = { enabled = false },
        notify = { enabled = true },
        terminal = {
            enabled = true,
            keys = {
                gf = function(self)
                    local f = vim.fn.findfile(vim.fn.expand("<cfile>"))
                    if f == "" then
                        Snacks.notify.warn("No file under cursor")
                    else
                        self:close()
                        vim.cmd("e " .. f)
                    end
                end,
                term_normal = {
                    "<esc>",
                    function(self)
                        self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
                        if self.esc_timer:is_active() then
                            self.esc_timer:stop()
                            vim.cmd("stopinsert")
                        else
                            self.esc_timer:start(200, 0, function() end)
                            return "<esc>"
                        end
                    end,
                    mode = "t",
                    expr = true,
                    desc = "Double escape to normal mode",
                },
            },
        },
        dashboard = {
            enabled = true,
            preset = {
                header = {
                    [[
     ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ 
     ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ 
    ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ 
    ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  
    ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ 
    ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ 
    ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ 
       ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    
             ░    ░  ░    ░ ░        ░   ░         ░    
                                    ░                   
                    ]],
                },
                keys = {
                    { icon = " ", key = "n", desc = "New file", action = "<CMD>ene<CR>" },
                    {
                        icon = " ",
                        key = "m",
                        desc = "New named file",
                        action = function()
                            require("file_functions").new_named_file()
                        end,
                    },
                    {
                        icon = " ",
                        key = "g",
                        desc = "New general note",
                        action = function()
                            require("file_functions").create_general_note()
                        end,
                    },
                    {
                        icon = " ",
                        key = "e",
                        desc = "New writing",
                        action = function()
                            require("file_functions").new_escrito()
                        end,
                    },
                    { icon = " ", key = "l", desc = "Open file explorer", action = "<CMD>Oil<CR>" },
                    {
                        icon = " ",
                        key = "g",
                        desc = "Find Text",
                        action = ":lua Snacks.dashboard.pick('live_grep')",
                    },
                    {
                        icon = " ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    { icon = "󰩈 ", key = "q", desc = "Exit Neovim", action = "<CMD>qa<CR>" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
    },
    keys = {
        {
            "<leader>n",
            function()
                Snacks.notifier.show_history()
            end,
            desc = "Show notifier history",
        },
        {
            "<leader>g",
            function()
                Snacks.lazygit()
            end,
            desc = "Lazygit",
        },
        {
            "<leader>]",
            function()
                Snacks.terminal.open()
            end,
            desc = "Toggle Terminal",
        },
        {
            "<leader>[",
            function()
                Snacks.terminal.toggle()
            end,
            desc = "Toggle Terminal",
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                Snacks.toggle.line_number():map("<leader>ul")
                Snacks.toggle.diagnostics():map("<leader>ud")
                Snacks.toggle.treesitter():map("<leader>uT")
                Snacks.toggle
                    .option("background", { off = "light", on = "dark", name = "Dark Background" })
                    :map("<leader>ub")
            end,
        })
    end,
}
