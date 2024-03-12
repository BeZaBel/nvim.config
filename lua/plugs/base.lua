return {
    {
        "sainnhe/edge",
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.edge_style = "aura"
            vim.g.edge_better_performance = 1
            vim.g.edge_cursor = "green"
            vim.g.edge_dim_inactive_windows = 1
            vim.g.edge_show_eob = 0
            vim.cmd("colorscheme edge")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        config = require("setup.treesitter").setup,
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
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
                "nvim-telescope/telescope-file-browser.nvim",
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
                    timeout = 250,
                    top_down = true,
                },
            },
        },
        config = function()
            require("setup.noice").setup()
        end,
    },
    {
        "nvim-lua/plenary.nvim",
    },
}
