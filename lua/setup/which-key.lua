return {
    setup = function()
        local wk = require("which-key")
        wk.add({
            { "<leader>c", group = "[C]hange" },
            { "<leader>d", group = "[D]elete" },
            { "<leader>g", group = "[G]omment" },
            { "<leader>h", group = "[H]elp" },
            { "<leader>s", group = "[S]hange character" },
            { "<leader>w", group = "[W]orkspace" },
            { "<leader>f", group = "[F]ile operations" },
            { "<leader>o", group = "[O]ther commands" },
            { "<leader>e", group = "T[E]lescope and shit" },
        })
    end,
}