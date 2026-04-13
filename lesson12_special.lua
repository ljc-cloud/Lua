print("******特殊用法******")

print("******and or******")

-- and or 不仅可以连接 boolean 任何东西都可以用来连接
-- 在lua中 只有 nil 和 false 被认为是假
-- “短路” 对于and来说  有假则假 对于or来说 有真则真
-- 所以只需要判断第一个是否满足 就会停止运算
print("and")
print(1 and 2) -- 2
print(true and 2) -- 2
print(false and 2) -- false
print(nil and 2) -- nil

print("or")
print(1 or 2) -- 1
print(true or 2) -- true
print(false or 2) -- 2
print(nil or 2) -- 2

x = 2
y = 1

-- 模拟三目运算符
local res = (x > y) and x or y
print(res)
