local logger = require 'springtime.logger'

local M = {}

M.logger = logger:new()
M.springtime_log_file = vim.fn.stdpath('log') .. "/springtime.log"
M.debug_header = string.format("[DEBUG][%s]:", os.date("%m/%d/%Y %H:%M:%S"))
M.lua_springtime_path = debug.getinfo(1).source:match("@?(.*/)")

function M.check_if_file_exists(file, path)
    local checked_path = path or M.lua_springtime_path
    local with_path = checked_path .. file
    local f = io.open(with_path, "r")
    if f then
        io.close(f)
        return true
    else
        return false
    end
end

return M
