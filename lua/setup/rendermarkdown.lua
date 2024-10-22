return {
    setup = function()
        require("render-markdown").setup({
            -- enable = true,
            render_modes = { "n", "v", "i", "c", "t" },
        })
    end,
}
