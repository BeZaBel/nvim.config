return {
    setup = function()
        local gpt = vim.g
        gpt["vim_markdown_no_default_key_mappings"] = 1
        gpt["vim_markdown_math"] = 1
        gpt["vim_markdown_strikethrough"] = 1
        gpt["vim_markdown_auto_insert_bullets"] = 0
        gpt["vim_markdown_new_list_item_indent"] = 0
        gpt["vim_markdown_folding_disabled"] = 1
    end,
}
