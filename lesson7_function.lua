print("******函数******")

-- function 函数名() end
-- a = function() end

print("******无参无返******")

function F1()
    print("F1函数")
end
F1()

F2 = function ()
    print("F2函数")
end
F2()

print("******有参******")
function F3(a)
    print(a)
end
-- 调用有参函数时，如果传的参数和函数参数个数不匹配
-- 不会报错，只会补空nil 或 丢弃
F3(1, "2", true)

print("******有返******")
function F4(a)
    return a, "456", true
end
-- 调用有返回值函数时，如果接取返回变量和函数返回值个数不匹配
-- 不会报错，只会补空nil 或 丢弃
result = F4("123")

resul1, resul2, resul3 = F4("123")
print(resul1)
print(resul2)
print(resul3)

print("******函数类型******")
F5 = function ()
    
end
print(type(F5))

print("******函数重载******")
-- lua不支持函数重载，默认调用最后一个声明的函数
function F6()
    print("F6函数")
end

function F6(s)
    print(s)
end

F6()

print("******变长参数******")

function F7(...)
    -- 变长参数使用 用一个表存起来，再用
    arg = {...}
    for i = 1, #arg do
        print(arg[i])
    end
end

F7(1, "str", true, 2, 3)

print("******函数嵌套******")
function F8()
    return function ()
        print("123")
    end
end

f9 = F8()
f9()

print("******闭包******")
-- 闭包
-- 正常情况：局部变量（包括参数）在函数返回后生命周期结束，内存可被回收。
-- 闭包捕获外部变量：生命周期被“延长”
function F9(x)
    -- 参数被捕获
    local p = x
    return function ()
        print(p)
    end
end

closure1 = F9("hello")
-- 此时F9函数已执行完毕，按理来说参数x和局部变量p都应被销毁
closure1() -- 此时仍然输出 hello 说明参数p还存活

function F10(start)
    return function ()
        start = start + 1
        return start
    end
end

closure2 = F10(10)
print(closure2()) -- 11
print(closure2()) -- 12
-- start 并没有因为 内部闭包函数closure2返回而消失，而是被闭包持续保留和修改

--  生命周期延长到什么程度？
--闭包捕获的变量会一直存活，直到没有任何闭包引用它们。
-- 如果多个闭包共享同一个外部局部变量，该变量会在最后一个引用它的闭包被垃圾回收后才释放。

-- 原因
-- Lua 中的闭包使用 Upvalue（上值） 机制。当函数访问外部局部变量时，这些变量从栈上被“提升”到堆上，并被闭包引用。只要闭包还存在，这些 upvalue 就不会被回收。

-- function F9(x)
--     -- 改变传入参数的生命周期
--     return function (y)
--         return x + y
--     end
-- end

-- f10 = F9(1)
-- print(f10(2))
-- print(f10(3))