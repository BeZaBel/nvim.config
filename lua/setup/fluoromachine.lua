return {
    setup = function(theme)
        require("fluoromachine").setup({
            glow = true,
            theme = theme,
            transparent = true,
            plugins = {
                bufferline = true,
                cmp = true,
                editor = true,
                gitsign = true,
                ibl = true,
                lazy = true,
                noice = true,
                notify = true,
                lspconfig = true,
                syntax = true,
                telescope = true,
                treesitter = true,
                wk = true,
            },
        })

        vim.cmd.colorscheme("fluoromachine")
    end,
}
