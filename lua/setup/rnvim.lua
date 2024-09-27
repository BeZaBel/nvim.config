return {
    setup = function()
        vim.api.nvim_buf_set_keymap(0, "n", "<leader><Enter>", "<Plug>RDSendLine", {})
        vim.api.nvim_buf_set_keymap(0, "v", "<leader><Enter>", "<Plug>RSendSelection", {})
        -- vim.g.R_app = "radian"
        -- vim.g.R_cmd = "R"
        -- vim.g.R_hl_term = 0
        -- vim.g.R_bracketed_paste = 1
        local opts = {
            R_args = { "--quiet", "--no-save" },
            rconsole_width = 78,
            R_app = "radian",
            disable_cmds = {
                "RClearConsole",
                "RCustomStart",
                "RSPlot",
                "RSaveClose",
                "RSendLine",
            },
        }
        --
        if vim.env.R_AUTO_START == "true" then
            opts.auto_start = 1
            opts.objbr_auto_start = true
        end

        require("r").setup(opts)
        require("cmp_r").setup({})
    end,
}
