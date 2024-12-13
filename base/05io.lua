--[[
file = io.open (filename [, mode])
io.read()
io.write()
io.flush()
io.close()


file:read()
file:write()
file:seek()
file:lines()
file:setvbuf()
file:close()
]]
-- 简单模式
--读.
local f = io.open("test.lua", "r")
-- 设置默认输入文件为 test.lua
io.input(f)
-- 输出文件第一行
print(io.read())
f.close()


-- 写
-- 以附加的方式打开只写文件
file = io.open("test.lua", "a")
-- 设置默认输出文件为 test.lua
io.output(file)
-- 在文件最后一行添加 Lua 注释
io.write("--  test.lua 文件末尾注释")
-- 关闭打开的文件
io.close(file)


-- read()
-- "*m" 读取一个数字， "*a" 读取到结尾。 “*l” 读取下一行。 number ,读取n 字节.
-- io.tmpfile():返回一个临时文件句柄，该文件以更新模式打开，程序结束时自动删除
-- io.type(file): 检测obj是否一个可用的文件句柄
-- io.flush(): 向文件写入缓冲中的所有数据
-- io.lines(optional file name): 返回一个迭代函数，
-- 每次调用将获得文件中的一行内容，当到文件尾时，将返回 nil，但不关闭文件。