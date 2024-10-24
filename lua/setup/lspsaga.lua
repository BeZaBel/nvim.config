return {
    setup = function()
        local lspsaga = require("lspsaga")
        lspsaga.setup({
            symbol_in_winbar = {
                enable = false,
            },
            outline = {
                close_after_jump = true,
            },
            ui = {
                theme = "round",
                border = "single",
                -- kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
            },
            lightbulb = {
                enable = false,
            },
        })
        local map = vim.keymap.set
        map("n", "<leader>sm", "<CMD>Lspsaga outline<CR>", { desc = "Open file outline" })
    end,
}
