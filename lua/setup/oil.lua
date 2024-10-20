return {
    setup = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                -- "permissions",
                -- "size",
                -- "mtime",
                "icon",
            },
            buf_options = {
                buflisted = false,
                bufhidden = "hide",
            },
            win_options = {
                wrap = false,
                signcolumn = "no",
                cursorcolumn = false,
                foldcolumn = "0",
                spell = false,
                list = false,
                -- concealcursor = "nvic",
            },
            delete_to_trash = false,
            watch_for_changes = true,
        })
        local oil = require("oil")
        vim.keymap.set({ "n" }, "<leader>l", function()
            oil.open()
        end, { desc = "Open Oil" })
    end,
}
