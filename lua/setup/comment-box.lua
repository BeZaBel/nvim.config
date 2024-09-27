return {
    setup = function()
        require("comment-box").setup()
        local map = vim.keymap.set
        map("n", "<A-n>", function()
            require("comment-box").line(1)
        end, { desc = "Make a comment line" })
        map({ "n", "v" }, "<A-b>", function()
            require("comment-box").llbox(1)
        end, { desc = "Make a comment box" })
    end,
}
