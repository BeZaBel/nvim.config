return {
    {
        "stevearc/oil.nvim",
        opts = {},
        dependencies = { "echasnovski/mini.icons" },
        config = require("setup.oil").setup,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = require("setup.flash").keys,
        config = require("setup.flash").setup,
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = require("setup.which-key").setup,
    },
    {
        "maxmx03/dracula.nvim",
        lazy = false,
        priority = 1000,
        config = require("setup.dracula").setup,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        priority = 1000,
        config = function()
            require("setup.catppuccin").setup("mocha")
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        lazy = false,
        priority = 1000,
        event = "BufEnter",
        config = require("setup.rainbow-delimiters").setup,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = require("setup.ibl").setup,
    },
}
