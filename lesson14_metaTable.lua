print("******元表******")

-- 任何表变量都可以作为其他表的元表
-- 任何表变量都可以有自己的元表
-- 当我们对子表进行一些特定操作时，会执行元表中的内容

table = {}
metaTable = {}

-- 设置元表函数 (子表, 元表)
setmetatable(table, metaTable)

print("******特定操作******")

print("******特定操作 __tostring******")

table2 = {
    name = "lixiancai"
}

-- 将table2作为字符串输出
print(table2) -- table: 00000000006b9bb0

metaTable2 = {
    -- 当子表被作为字符串使用时，会默认调用元表的__tostring，并会将子表作为第一个参数传入（可以不写参数）
    __tostring = function (t)
        -- t 为子表
        return t.name
    end
}

setmetatable(table2, metaTable2)
print(table2) -- lixiancai

print("******特定操作 __call******")

table3 = {
    name = "lixiancai"
}

metaTable3 = {
    -- 当子表被作为字符串使用时，会默认调用元表的__tostring，并会将子表作为第一个参数传入（可以不写参数）
    __tostring = function (t)
        -- t 为子表
        return t.name
    end,
    -- 当子表作为一个函数使用时，会默认调用元表的__call, 也会将子表作为第一个参数传入（可以不写参数）
    -- 当希望传其他参数，声明__call函数时，参数列表需要 > 1 (因为第一个参数默认是子表)
    __call = function (t, arg)
        print("fighting！！！, " .. t.name .. arg)
    end
}

setmetatable(table3, metaTable3)

-- 把子表作为函数使用，就会调用元表的__call 方法
table3("！！！") -- fighting！！！, lixiancai！！！

print("******特定操作 —— 运算符重载******")

table4 = { age = 1 }
table5 = { age = 2 }

-- 默认两个表之间是不允许使用运算符的

metaTable4 = {
    -- 当子表使用 + 运算符时，会调用该方法
    __add = function (t1, t2)
        return t1.age + t2.age
    end,
    __sub = function (t1, t2)
        return t1.age + t2.age
    end,
    -- ......
}

metaTable5 = {
    __add = function (t1, t2)
        return t1.age + t2.age + 1
    end
}

setmetatable(table4, metaTable4)
setmetatable(table5, metaTable5)

-- 如果两个子表都有对应的原表的 __add 方法实现
-- 则默认调用 + 运算符左边的子表的原表的 __add 
print(table4 + table5) -- 3

print(table5 + table4) -- 4

print("******特定操作 __index和__newindex******")

print("__index")
table6 = {}

metaTable6Father = {
    age = 18
}
metaTable6Father.__index = metaTable6Father

metaTable6 = {
    age = 12,
    -- __index 当子表找不到某一个属性时，会到元表的 __index 指向的表中查找
    -- __index = { age = 10 }
    -- 不能在元表内声明 __index指向元表自己
    -- __index = metaTable6
}

setmetatable(metaTable6, metaTable6Father)
setmetatable(table6, metaTable6)

print(table6.age) -- 10

-- 可以把元表的 __index 指向元表自己
metaTable6.__index = metaTable6

print(table6.age) -- 12


table6.age = 16
-- rawget 只获取表的age索引，不去访问元表的__index所指向的表
local age = rawget(table6, "age")
print("rawget:" .. age) -- rawget:16


print("__newindex")

-- newIndex  当赋值时，如果赋值一个不存在的索引
-- 那么会把这个值赋值到 newIndex 所指向的表中，不会修改自己

table7 = {}

-- table7.age = 6
-- print(table7.age) -- 6

metaTable7 = {
    
}
metaTable7.__newindex = {}

setmetatable(table7, metaTable7)
-- 赋值了一个 table7 不存在的索引
-- 将这个值赋值给了原表 metaTable7的 __newindex指向的表，并没有赋值给table7
table7.age = 10
-- 因此打印 nil
print(table7.age) -- nil

-- rawset 只会赋值表的age索引，不会去赋值元表 __newindex指向的表
rawset(table7, "age", 10)
print("rawset:" .. table7.age) -- rawset:10


print("******获取元表******")

-- getmetatable 获取table7的元表
print(getmetatable(table7)) -- table: 0000000000ec2410