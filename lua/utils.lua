local M = {}

function M.load_module(module_name)
    local status, result = pcall(require, module_name)

    if status then
        return result
    end
    return nil
end

return M
