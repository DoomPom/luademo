--[[
一切皆对象，table+function 模型
封装 self.__index = self
继承: 
]]

-- 封装了一个类
local object = {}  -- 创建一个表作为类
function object:new(...)
    local obj = {}
    setmetatable(obj,self) -- -- slef内置设置元表，使对象继承类的方法
    self.__index=self  -- 设置索引元方法
    return obj
end

-- return object

-- 定义 Person 类
Person = {name = "", age = 0}
-- Person 的构造函数
function Person:new(name, age)
    local obj = {}  -- 创建一个新的表作为对象
    setmetatable(obj, self)  -- 设置元表，使其成为 Person 的实例
    self.__index = self  -- 设置索引元方法，指向 Person
    obj.name = name
    obj.age = age
    return obj
end

-- 添加方法：打印个人信息
function Person:introduce()
    print("My name is " .. self.name .. " and I am " .. self.age .. " years old.")
end

-- 创建一个 Person 对象
local person1 = Person:new("Alice", 30)
-- 调用对象的方法
person1:introduce()  -- 输出 "My name is Alice and I am 30 years old."

-- 继承
-- 定义矩形类
Rectangle = {area = 0, length = 0, breadth = 0}

-- 创建矩形对象的构造函数
function Rectangle:new(o, length, breadth)
  o = o or {}  -- 如果未传入对象，创建一个新的空表
  setmetatable(o, self)  -- 设置元表，使其继承 Rectangle 的方法
  self.__index = self  -- 确保在访问时能找到方法和属性
  o.length = length or 0  -- 设置长度，默认为 0
  o.breadth = breadth or 0  -- 设置宽度，默认为 0
  o.area = o.length * o.breadth  -- 计算面积
  return o
end

-- 打印矩形的面积
function Rectangle:printArea()
  print("矩形面积为 ", self.area)
end

-- 定义正方形类，继承自矩形类
Square = Rectangle:new()  -- Square 继承 Rectangle 类

-- 重写构造函数（正方形的边长相等）
function Square:new(o, side)
  o = o or {}  -- 如果未传入对象，创建一个新的空表
  setmetatable(o, self)  -- 设置元表，使其继承 Rectangle 的方法
  self.__index = self  -- 确保在访问时能找到方法和属性
  o.length = side or 0  -- 设置边长
  o.breadth = side or 0  -- 正方形的宽度和长度相等
  o.area = o.length * o.breadth  -- 计算面积
  return o
end

-- 运行实例：
local rect = Rectangle:new(nil, 5, 10)  -- 创建一个长为 5，宽为 10 的矩形
rect:printArea()  -- 输出 "矩形面积为 50" 继承了 Rectangle:

local square = Square:new(nil, 4)  -- 创建一个边长为 4 的正方形
square:printArea()  -- 输出 "矩形面积为 16"

-- 函数重写.
-- 重写狗类的叫声方法（重写 Animal 的 speak 方法）

function Square:printArea()
    print("正方形面积为 ", self.area)
  end

local square = Square:new(nil, 4)  -- 创建一个边长为 4 的正方形
square:printArea()  -- 输出 "矩形面积为 16"

-- 隐藏属性:  通过公开方法 访问， 私有的属性。
function Person:setName(name)
    self.name = name  -- 提供方法来修改 name
end
function Person:getName()
    return self.name  -- 提供方法来获取 name
end

-- 抽象类/接口，抽象函数/接口函数 lua 并没有这些概念。