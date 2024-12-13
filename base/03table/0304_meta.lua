--[[
meta：
setmetatable(table,metatable): 对指定 table 设置元表(metatable)，如果元表(metatable)中存在 __metatable 键值，setmetatable 会失败。
getmetatable(table): 返回对象的元表(metatable)。
__index 主键
__newindex  原表更新

操作符：
__add +
__sub - 
__mul *
__div /
__mod %
__unm - 负值
__concat .. 连接
__eq  ==
__lt  <
__le >

__call 元方法 返回一个值。 table 调用返回值一个值.
__tostring 修改表的输出行为.
]]

-- __index 的值可以是表，函数, 备用表
-- 查找赋值，首先找元表，找不到则找__index,再找不到则返回 nil 
local mytable = setmetatable({key1 = "value1"},  { __index = { key1 = "value3",key2 = "metatablevalue" } })
print(mytable.key1,mytable.key2)
-- __newindex __newindex 元方法用来对表更新，__index则用来对表访问 。

mymetatable = {}
mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable })

print(mytable.key1)

mytable.newkey = "新值2"
print(mytable.newkey,mymetatable.newkey)

mytable.key1 = "新值1"
print(mytable.key1,mymetatable.key1)

-- 如果存在 key1 ,则不调用 __newindex,
mytable = setmetatable({key1 = "value1"}, {
    __newindex = function(mytable, key, value)
        rawset(mytable, key, "\""..value.."\"")
    end
})
mytable.key1 = "new value"
mytable.key2 = 4

print(mytable.key1,mytable.key2)