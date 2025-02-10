local M = {}

function M.new_named_file()
    vim.ui.input({ prompt = "File (Give file extension): " }, function(name)
        if name then
            vim.cmd({ cmd = "enew" })
            vim.cmd.w(name)
        else
            vim.api.nvim_err_writeln("No name given. No file created.")
        end
    end)
end

function M.create_general_note()
    local general = vim.fn.isdirectory("./general")
    if general == 0 then
        print("Not in notes directory")
    else
        vim.ui.input({ prompt = "New markdown note name: " }, function(name)
            vim.ui.input({ prompt = "Note title: " }, function(title)
                if name then
                    vim.cmd.enew()
                    vim.cmd.normal("i---")
                    vim.cmd.normal("otags:")
                    vim.cmd.normal("o\t-")
                    vim.cmd.normal("o\bprev:")
                    vim.cmd.normal("o\t- [[]]")
                    vim.cmd.normal("o\bnext:")
                    vim.cmd.normal("o\t- [[]]")
                    vim.cmd.normal("o\btitle:")
                    vim.cmd.normal('o\t- "' .. title .. '"')
                    vim.cmd.normal("o\b---")
                    vim.cmd.normal("o")
                    vim.cmd.normal("o# " .. title)
                    vim.cmd.write("./general/" .. name .. ".md")
                    vim.cmd.normal("2o")
                else
                    vim.api.nvim_err_writeln("No name given. No file created.")
                end
            end)
        end)
    end
end

function M.new_personal()
    local general = vim.fn.isdirectory("./personal")
    if general == 0 then
        print("Not in notes directory")
    else
        vim.ui.input({ prompt = "New personal note: " }, function(name)
            if name then
                vim.cmd.enew()
                vim.cmd.normal("O# " .. name)
                vim.cmd.write("./personal/" .. name .. ".md")
                vim.cmd.normal("2o")
            else
                vim.api.nvim_err_writeln("No name given. No file created.")
            end
        end)
    end
end

function M.new_writing()
    local general = vim.fn.isdirectory("./escritos")
    if general == 0 then
        print("Not in notes directory")
    else
        vim.ui.input({ prompt = "New markdown escrito: " }, function(name)
            if name then
                vim.cmd.enew()
                vim.cmd.normal("O# " .. name)
                vim.cmd.write("./escritos/" .. name .. ".md")
                vim.cmd.normal("2o")
            else
                vim.api.nvim_err_writeln("No name given. No file created.")
            end
        end)
    end
end

function M.save_as()
    vim.ui.input({ prompt = "Save as: " }, function(name)
        if name then
            vim.cmd.w(name)
        else
            vim.api.nvim_err_writeln("No name given. No file created.")
        end
    end)
end

return M
