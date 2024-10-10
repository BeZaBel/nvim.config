return {
    setup = function()
        local rainbow_delimiters = require("rainbow-delimiters")
        vim.g.rainbow_delimiters = {
            strategy = {
                [""] = rainbow_delimiters.strategy["global"],
                vim = rainbow_delimiters.strategy["local"],
                c = rainbow_delimiters.strategy["global"],
            },
            query = {
                [""] = "rainbow_delimiters",
                lua = "rainbow-blocks",
                c = "rainbow-delimiters",
            },
            priority = {
                [""] = 110,
                lua = 210,
                c = 210,
            },
            highlight = {
                "RainbowDelimiterRed",
                "RainbowDelimiterOrange",
                "RainbowDelimiterYellow",
                "RainbowDelimiterGreen",
                "RainbowDelimiterCyan",
                "RainbowDelimiterBlue",
                "RainbowDelimiterViolet",
            },
            blacklist = {},
        }
    end,
}
