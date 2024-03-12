return {
    setup = function()
        require("boole").setup({
            mappings = {
                increment = "<C-a>",
                decrement = "<C-x>",
            },
            additions = {
                { "top", "bottom" },
            },
        })
    end,
}
