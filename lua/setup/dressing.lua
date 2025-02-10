local M = {}

function M.setup()
    require("dressing").setup({
        input = {
            title_pos = "center",
            relative = "win",
            prefer_width = 0.4,
        },
    })
end

return M
