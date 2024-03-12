return {
    setup = function()
        require("markdowny").setup({
            filetypes = {
                "markdown",
                "txt",
            },
        })
    end,
}
