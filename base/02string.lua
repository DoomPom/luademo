-- 字符串
--[[
1. '' "" 成对 [[ 引号 多行字符串
2. .. 连接2个字符串
3. \ 转义字符串。 \v \n \f \0 NULL \ddd \xhh
4， #ss string.len(ss) utf8.len(ss) 获取字符串的长度.
5. 格式化
6. 模式匹配
]]
local a = 'aa'
local b = "aaa"
-- 10个字符， 占用14个字节
local myString = "Hello, 世界!"

-- 计算字符串的长度（字符个数）
local length1 = utf8.len(myString)
print(length1) -- 输出 10

-- string.len 函数会导致结果不准确
local length2 = string.len(myString)
print(length2) -- 输出 14

--[[
字符串函数:
string.gsub(mainString, findString, replaceString, num)
string.find (str, substr, [init, [plain] ])
string.char(arg) 和 string.byte(arg[,int])  获取字符的值,转换
string.format(,,)  格式化
string.sub(s,i,j)  截取

%c - 接受一个数字, 并将其转化为ASCII码表中对应的字符
%d, %i - 接受一个数字并将其转化为有符号的整数格式
%o - 接受一个数字并将其转化为八进制数格式
%u - 接受一个数字并将其转化为无符号整数格式
%x - 接受一个数字并将其转化为十六进制数格式, 使用小写字母
%X - 接受一个数字并将其转化为十六进制数格式, 使用大写字母
%e - 接受一个数字并将其转化为科学记数法格式, 使用小写字母e
%E - 接受一个数字并将其转化为科学记数法格式, 使用大写字母E
%f - 接受一个数字并将其转化为浮点数格式
%g(%G) - 接受一个数字并将其转化为%e(%E, 对应%G)及%f中较短的一种格式
%q - 接受一个字符串并将其转化为可安全被Lua编译器读入的格式
%s - 接受一个字符串并按照给定的参数格式化该字符串
为进一步细化格式, 可以在%号后添加参数. 参数将以如下的顺序读入:
(1) 符号: 一个+号表示其后的数字转义符将让正数显示正号. 默认情况下只有负数显示符号.
(2) 占位符: 一个0, 在后面指定了字串宽度时占位用. 不填时的默认占位符是空格.
(3) 对齐标识: 在指定了字串宽度时, 默认为右对齐, 增加-号可以改为左对齐.
(4) 宽度数值
(5) 小数位数/字串裁切: 在宽度数值后增加的小数部分n, 若后接f(浮点数转义符, 如%6.3f)则设定该浮点数的小数只保留n位, 
若后接s(字符串转义符, 如%5.3s)则设定该字符串只显示前n位.

模式匹配:
string.find, string.gmatch, string.gsub, string.match。
]]

-- abcd
print(string.char(97, 98, 99, 100))
print(string.byte("ABCD", 2)) -- B--66

print(string.format("%02.3f",12.1))
print(string.format("%8.6s","abcdefg!")) -- 占用8个位显示6个
print(string.format("%8.5s","He,你好!")) -- 按字节获取的 