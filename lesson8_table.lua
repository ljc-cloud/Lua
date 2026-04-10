print("******TABLE******")
-- 所有复杂类型都是table（表）
print("******数组******")
a = {1,2, "3",true, nil}
print(type)
-- lua中索引从1开始
print(a[0]) -- nil
print(a[1]) -- 1
print(a[2]) -- 2
print(a[3]) -- 3
print(a[4]) -- true
print(a[5]) -- nil

-- # 是通用的获取长度的关键字
-- 在获取长度是 nil会被忽略
print(#a) -- 4，nil被忽略

-- 如果表（数组）中某一位为nil，会影响#获取的长度（打断）
a = {1,2,nil,"3",true}
print(#a) -- 2, 被nil打断

print("******数组遍历******")
-- #获取长度被nil打断
-- 1 2
for i = 1, #a, 1 do
    print(a[i])
end

print("******二维数组******")
a = {
    {1,2,3},
    {4,5,6},
    "hello",
}
print(a[1][1]) -- 1
print(a[2][1]) -- 4
print(a[2][2]) -- 5

print("******二维数组遍历******")
for i = 1, #a do
    b = a[i]
    if type(b) == 'table' then
        for j = 1, #b do
            print(b[j])
        end
    end
end

print("******自定义索引******")
aa = {[0] = 1, 2, [-1] = 3, 4,5}
print(aa[0])
print(aa[-1])
print(aa[1])
print(aa[2])

-- 索引不连续时，#aa获取aa数组的长度会被打断
aa = {[1] = 1, [2] = 2, [4] = 4, [6] = 6}
print(#aa) -- 2，索引1,2 是连续的，索引2,4是不连续的