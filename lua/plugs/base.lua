return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = require("setup.treesitter").setup,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = { "BufReadPre", "BufNewFile" },
        config = require("setup.context").setup,
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            {
                "xiyaowong/telescope-emoji.nvim",
                lazy = true,
            },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = require("setup.telescope").setup,
    },
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                opts = {
                    timeout = 100,
                    fps = 60,
                    max_width = 40,
                    render = "default",
                    top_down = true,
                    stages = "fade",
                },
            },
        },
        config = require("setup.noice").setup
    },
    {
        "nvim-lua/plenary.nvim",
    },
}
