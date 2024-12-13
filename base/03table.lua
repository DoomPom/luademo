--table
--[[
1. 声明和for 遍历
2. 
]]
local myArray = {10, 20, 30, 40, 50}
local tab1 = {
    key1 = "val1",
    key2 = "val2",
    "val3" -- key 没有，默认会自带从1开始 添加
}
-- 遍历
for index, value in ipairs(myArray) do
    print(index, value)
end
for key, value in pairs(tab1) do
    print(key, value)
end

-- 无状态的迭代器
-- function iter(a, i)
--     i = i + 1
--     local v = a[i]
--     if v then
--         return i, v
--     end
-- end
-- function ipairs(a)
--     return iter, a, 0
-- end

-- 多状态
local array = {"Google", "Runoob"}

function elementIterator(collection)
    local index = 0
    local count = #collection
    -- 闭包函数
    return function()
        index = index + 1
        if index <= count then
            --  返回迭代器的当前元素
            return collection[index]
        end
    end
end

for element in elementIterator(array) do
    print(element)
end
