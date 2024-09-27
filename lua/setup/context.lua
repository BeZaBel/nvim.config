return {
    setup = function ()
        require("treesitter-context").setup({
            enable = true,
            line_numbers = true,
            mode = "cursor",
            on_attach = nil,
        })
    end
}
