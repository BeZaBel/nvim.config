return {
    setup = function()
        return {
            default_quick_keys = 0,
            vim.api.nvim_set_var("org#style#border", 5),
            vim.api.nvim_set_var("org#style#bordercolor", "FloatBorder"),
            vim.api.nvim_set_var("org#style#color", "String"),
            language_path = {
                python = "python",
                python3 = "python3",
                go = "go",
                c = "gcc",
                r = "radian",
            },
        }
    end,
    keys = {
        { "<leader>mr", "<cmd>call org#main#runCodeBlock()<cr>" },
        { "<leader>ml", "<cmd>call org#main#runLanguage()<cr>" },
    },
}
