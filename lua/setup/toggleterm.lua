return {
    setup = function()
        require("toggleterm").setup({
            size = 10,
            open_mapping = [[<F7>]],
            shading_factor = 2,
            direction = "float",
            float_opts = {
                border = "curved",
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        })
        local map = vim.keymap.set
        map({ "t" }, "<Esc>", [[<C-\><C-n>]])
        local toggleterm = require("toggleterm")
        map({ "n", "v" }, "<leader>etv", function()
            toggleterm.toggle(0, 60, "", "vertical")
        end, { desc = "Open vertical terminal" })
        map({ "n", "v" }, "<leader>ets", function()
            toggleterm.toggle(0, 10, "", "horizontal")
        end, { desc = "Open horizontal terminal" })
        map({ "n", "v" }, "<leader>etf", function()
            toggleterm.toggle()
        end, { desc = "Open floating terminal" })
    end,
}
