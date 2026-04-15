print("******协同程序******")

print("******协程创建******")
-- 常用方式
-- coroutine.create
func = function ()
    print("协程运行...")
end

co = coroutine.create(func)
-- 协程的本质是线程对象
print(co) -- thread: 0000000000fdddb8
print(type(co)) -- thread

co2 = coroutine.wrap(func)
print(co2) -- function: 00000000006c93e0
print(type(co2)) -- function

print("******协程运行******")
-- 第一种方式，对应的是 使用create方法创建的协程
coroutine.resume(co)
-- 第二种方式
co2()

print("******协程挂起******")
func2 = function ()
    local i  = 1
    while true do
        print(i)
        
        i = i + 1
        -- 协程的挂起，等待resume函数再次唤醒
        -- coroutine.yield 可以返回值
        coroutine.yield(i, "test")
    end
end

co3 = coroutine.create(func2)
-- resume函数可以获得 yield返回的内容
-- 第一个返回值默认是协程执行是否成功，之后是 yield的返回内容
isOk, result, s = coroutine.resume(co3) -- 1
print(isOk, result, s) -- true  2  test
isOk, result, s = coroutine.resume(co3) -- 2
print(isOk, result, s) -- true  3  test

co4 = coroutine.wrap(func2)
-- 使用wrap函数创建的协程，不会有默认的协程执行成功结果返回，只有yield函数返回的内容
result, s = co4() -- 1
print(result, s)
result, s = co4() -- 2
print(result, s)
result, s = co4() -- 3
print(result, s)



print("******协程状态******")
-- coroutine.status(协程对象)
-- dead  结束
-- suspended  暂停
-- running 运行中
print(coroutine.status(co3)) -- suspended，被yield函数挂起
print(coroutine.status(co)) -- dead 已经执行完毕

func3 = function ()
    while true do
        
    end
end

co5 = coroutine.create(func3)
coroutine.resume(co5)
print("co5" .. coroutine.status(co5))

-- 获取正在运行的协程号 （复数）
runningcos = coroutine.running()
