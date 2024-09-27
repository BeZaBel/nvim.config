return {
    setup = function()
        require("gitsigns").setup({
            signs = {
                changedelete = { text = "➤" },
            },
        })
    end,
}
