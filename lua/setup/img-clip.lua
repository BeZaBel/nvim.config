return {
    setup = function()
        require("img-clip").setup({
            dir_path = "assets",
            file_name = "%Y-%m-%d-%H-%M",
            use_absolute_path = false,
        })
        local map = vim.keymap.set
        map("n", "<leader>p", "<cmd>PasteImage<cr>", { desc = "Paste clipboard image" })
    end,
}
