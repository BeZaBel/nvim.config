return {
    setup = function()
        require("dracula").setup({
            plugins = {
                ["nvim-treesitter"] = true,
                ["rainbow-delimiters"] = true,
                ["nvim-lspconfig"] = true,
                ["nvim-cmp"] = true,
                ["indent-blankline.nvim"] = true,
                ["which-key.nvim"] = true,
                ["gitsigns.nvim"] = true,
                ["lazy.nvim"] = true,
                ["telescope.nvim"] = true,
                ["bufferline.nvim"] = true,
            },
        })
        vim.cmd.colorscheme("dracula")
        -- vim.cmd([[hi Normal ctermbg=NONE guibg=NONE]])
    end,
}
