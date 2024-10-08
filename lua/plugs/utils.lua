return {
    {
        "stevearc/conform.nvim",
        config = function()
            require("setup.conform").setup()
        end,
    },
    {
        "antonk52/markdowny.nvim",
        ft = "markdown",
        config = require("setup.markdowny").setup,
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",
        config = require("setup.obsidian").setup,
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "lervag/vimtex",
        ft = "tex",
        config = require("setup.vimtex").setup,
    },
    {
        "R-nvim/R.nvim",
        dependencies = { "R-nvim/cmp-r" },
        ft = "r",
        config = require("setup.rnvim").setup,
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        config = require("setup.gitsigns").setup,
    },
}
