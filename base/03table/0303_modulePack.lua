--[[
5. module
6. require
]]



--[[
require

require("<模块名>")
require "<模块名>"
-- 别名变量 m
local m = require("module")
]]
-- ./module.lua
local m = require("module")
print(m.constant)
m.func3()

-- load
-- local path = "/usr/local/lua/lib/libluasocket.so"
-- local f = loadlib(path, "luaopen_socket")