print("******表的公共方法******")

print("******表的插入******")
t1 = { {name = "Lisa", age = 12}, {name = "John", age = 18} }
t2 = { name = "赵六", age = 16 }

print(#t1) -- 2
-- 将t2作为尾部元素插入到t1中
table.insert(t1, t2)
-- 将t2插入到t1中并指定索引
-- table.insert(t1, 1, t2)
print(#t1) -- 3

print(t1[1].name) -- Lisa
print(t1[2].name) -- John
print(t1[3].name) -- 赵六

print("******表的删除******")

-- remove方法，将t1的最后一个元素删除
table.remove(t1)
print(t1[1])
print(t1[2])
print(t1[3]) -- nil

-- 将t1的指定索引的元素删除
table.remove(t1, 1)

print("******表的排序******")
a = {3,1,0,-2,7}
-- 升序
table.sort(a) 
print("升序")
for _, value in pairs(a) do
    print(value)
end

-- 降序
print("降序")
table.sort(a, function (a, b)
    return b < a
end)

for _, value in pairs(a) do
    print(value)
end

print("******表的拼接******")
tb = {"123", "267", "999"}
str = table.concat(tb, ";")
print(str) -- 123;267;999