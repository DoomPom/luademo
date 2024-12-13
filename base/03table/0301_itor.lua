--table
--[[
1. 声明和for 遍历
2. 迭代器
3.table 变量生命周期: 初始化，赋值，指向的为同一块内存，变量设置为nil就退出
4. table 操作： concat insert remove sort
5. module
6. require
7. meta 元信息。
8. object 面对对象
]]
--[[
1. 声明和for 遍历
2. 迭代器
]]
-- 声明
--[[
a = { [f(1)] = g; "x", "y"; x = 1, f(x), [30] = 23; 45 }
do
    local t = {}
    t[f(1)] = g
    t[1] = "x"         -- 第一个exp
    t[2] = "y"         -- 第二个exp
    t.x = 1            -- t["x"] = 1
    t[3] = f(x)        -- 第三个exp
    t[30] = 23
    t[4] = 45          -- 第四个exp
    a = t
  end
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

local array = {"Google", "Runoob"}

-- 无状态的迭代器
function iter(a, i)
    i = i + 1
    local v = a[i]
    if v then
        return i, v
    end
end
function myyipairs(a)
    return iter, a, 0
end
for i,v in myyipairs(array) do
    print(i,v)
end
-- 多状态
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
