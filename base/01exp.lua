-- 单行注释
--[[
多行注释.
]]


--[[
-- 标识符:
1. A 到 Z 或 a 到 z 或下划线 _ 开头 + 数字字母下划线的组合字符串。
Lua 不允许使用特殊字符如 @, $, 和 % 来定义标识符。 Lua 是一个区分大小写的编程语言
mod _tmp a2k
]]


--[[
-- 关键词
数据类型: string 
运行结构:if/elseif/else/end/then do/while for/until repeat/until goto
运算符: and or not
特殊值: true/false nil
local
]]


--[[
-- 变量
v=10
local a=20
Lua 变量有三种类型：全局变量、局部变量、表中的域。
v = nil
局部变量的作用域为从声明位置开始到所在语句块结束。
变量的默认值均为 nil。
]]
local a = "hello" .. "world"
-- t.n = t.n + 1 从左到右依次赋值
local a, b, c = 0, 1
print(a, b, c) -- > 0  

--[[
-- 基本数据类型: nil boolean number string function userdata thread table
]]

print(type("Hello world")) -- > string
print(type(10.4 * 3)) -- > number
print(type(print)) -- > function
print(type(type)) -- > function
print(type(true)) -- > boolean
print(type(nil)) -- > nil
print(type(type(X))) -- > string


local tb1 = {}
tb1["key1"]="apple"
tb1["key2"]="orange"
local tb2 = { "apple", "pear", "orange" }
print(type(tb2))
for index, value in ipairs(tb2) do
    print(index, value)
end
for key, value in pairs(tb1) do
    print(key, value )
end
--[[
条件转移:
if(布尔表达式) then
   -- [ 在布尔表达式为 true 时执行的语句 --]
elseif (condition) then

else
    -- [ 在布尔表达式为 false 时执行的语句 --]
end
lua 认为false和nil为假。 true 和非 nil 为真 。。 数字0 为真。
]]
local b = false
print("boolean(0)", 0 and true or false)
print("boolean('')", "" and true or false)
print("boolean(nil)", nil and true or false)

--[[
-- 循环
可嵌套
while(condition)
do
   statements
end

for var=exp1,exp2,exp3 do
    <执行体>
end
for i, v in ipairs(a) do
    print(i, v)
end
for k, v in pairs(a) do
    print(i, v)
end

repeat
   statements
until( condition )

break 终止循环，若是循环嵌套则种植最内层的循环。
goto Label;  Label 的格式为： ::Label::
默认的没有continue.
]]
local a = 1
::label::
    print("--- goto label ---")
a = a + 1
if a < 3 then
    goto label -- a 小于 3 的时候跳转到标签 label
end

--[[
-- 运算符表达式
算数: + - * /(除法) ^(乘幂)  //(整除) 
关系: > < = >= <= ~=(不等于)
逻辑: and or not 
其他: 
    .. 字符串连接
    #tb  取字符串或者表的长度
    type() 取类型或者变量的类型基础类型名称
三元表达:  a and b or c
]]

--[[
-- 函数
function ()

end

-- 闭包。
保存函数的执行环境。
函数的返回值是函数，此时执行函数的的时候会保存函数的初始化的值。。类似与静态变量。
]]
function fun1()
    local count = 0
    return function ()
        count =count +1
        return count
    end
end

local aaa = fun1()
print(aaa())
print(aaa())
print(aaa())