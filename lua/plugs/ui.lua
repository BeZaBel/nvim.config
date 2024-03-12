return {
    {
        -- Open terminals inside nvim
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("setup.toggleterm").setup()
        end,
    },
    {
        -- Fancy scrolling
        "karb94/neoscroll.nvim",
        config = function()
            require("setup.neoscroll").setup()
        end,
    },
    {
        -- Gotta go fast when searching for things in a buffer
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = require("setup.flash").keys,
        config = function()
            require("setup.flash").setup()
        end,
    },
    {
        -- Highlight colors
        "NvChad/nvim-colorizer.lua",
        event = { "BufReadPre", "BufNewFile" },
        config = true,
    },
    {
        -- Show keymaps
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("setup.which-key").setup()
        end,
    },
    {
        -- Fancy colors for delimiters
        "HiPhish/rainbow-delimiters.nvim",
        event = "BufEnter",
        config = function()
            require("setup.rainbow-delimiters").setup()
        end,
    },
    {
        -- Fancy colors for indentations
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("setup.ibl").setup()
        end,
    },
}
