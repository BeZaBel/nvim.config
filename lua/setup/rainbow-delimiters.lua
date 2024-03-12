return {
    setup = function()
        local rd = require("rainbow-delimiters")
        vim.g.rainbow_delimiters = {
            strategy = {
                [""] = rd.strategy["global"],
                vim = rd.strategy["local"],
            },
            query = {
                [""] = "rainbow_delimiters",
                lua = "rainbow-blocks",
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
        }
    end,
}
