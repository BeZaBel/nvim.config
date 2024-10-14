return {
    setup = function()
        require("r").setup({
            R_args = { "--quiet", "--no-save" },
            R_app = "radian",
            rconsole_width = 78,
            disable_cmds = {
                "RClearConsole",
                "RCustomStart",
                "RSPlot",
                "RSaveClose",
                "RSendLine",
            },
            auto_start = "no",
            objbr_auto_start = true,
        })

        vim.api.nvim_buf_set_keymap(0, "n", "<leader><Enter>", "<Plug>RDSendLine", {})
        vim.api.nvim_buf_set_keymap(0, "v", "<leader><Enter>", "<Plug>RSendSelection", {})
    end,
}
