--[[
协同
coroutine.create(fun)
coroutine.resume()	重启 coroutine，和 create 配合使用
coroutine.yield() 挂起,等待函数，执行一次就退出，从上次执行位置到yield 继续。
coroutine.status() coroutine 的状态有三种：dead，suspended，running
coroutine.wrap() 创建 coroutine，返回一个函数，一旦你调用这个函数，就进入 coroutine，和 create 功能重复
coroutine.running() 返回正在跑的 coroutine，一个 coroutine 就是一个线程，当使用running的时候， coroutine 的线程号
]]
function Sleep(n)
    -- os.execute("sleep  " .. n)
    os.execute("ping -n " .. tonumber(n+1) .. " localhost >NUL")
end

local function foo()
    print("协同程序 foo 开始执行")
    local value = coroutine.yield("暂停 foo 的执行")
    print("协同程序 foo 恢复执行，传入的值为: " .. tostring(value))
    print("协同程序 foo 结束执行")
end

-- 创建协同程序
local co = coroutine.create(foo)


-- 启动协同程序
local status, result = coroutine.resume(co)
print(result) -- 输出: 暂停 foo 的执行

Sleep(4)
-- 恢复协同程序的执行，并传入一个值
status, result = coroutine.resume(co, 42)
print(result) -- 输出: 协同程序 foo 恢复执行，传入的值为: 42

