return {
    setup = function()
        local gpt = vim.g
        gpt["pencil#autoformat"] = 1
        gpt["pencil#conceallevel"] = 2
        local vimpencil = vim.api.nvim_create_augroup("VimPencil", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            group = vimpencil,
            pattern = "markdown",
            callback = function()
                vim.cmd("PencilHard")
            end,
        })
        vim.keymap.set("n", "<leader>tp", "<CMD>PencilToggle<CR>", { desc = "Toggle Pencil" })
    end,
}
