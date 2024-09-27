return {
    setup = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
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
                conceallevel = 3,
                concealcursor = "nvic",
            },
            delete_to_trash = false,
            watch_for_changes = true,
        })
        local map = vim.keymap.set
        local oil = require("oil")
        map({ "n" }, "<leader>l", function()
            oil.open()
        end, { desc = "Open Oil" })
    end,
}
