local M = {}

function M.new_named_file()
    vim.ui.input({ prompt = "File (Give file extension): " }, function(name)
        if name then
            vim.cmd({ cmd = "enew" })
            vim.cmd.w(name)
        else
            print("No name given. Enter a name.")
        end
    end)
end

function M.create_general_note()
    local general = vim.fn.isdirectory("./general")
    if general == 0 then
        print("Not in notes directory")
    else
        vim.ui.input({ prompt = "New markdown note: " }, function(name)
            if name then
                vim.cmd.enew()
                vim.cmd.w("./general/" .. name .. ".md")
            else
                print("No name given. Enter a name.")
            end
        end)
    end
end

function M.new_escrito()
    local general = vim.fn.isdirectory("./escritos")
    if general == 0 then
        print("Not in notes directory")
    else
        vim.ui.input({ prompt = "New markdown escrito: " }, function(name)
            if name then
                vim.cmd.enew()
                vim.cmd.w("./escritos/" .. name .. ".md")
            else
                print("No name given. Enter a name.")
            end
        end)
    end
end

function M.save_as()
    vim.ui.input({ prompt = "Save as: " }, function(name)
        if name then
            vim.cmd.w(name)
        else
            print("No name given. Enter a name")
        end
    end)
end

return M
