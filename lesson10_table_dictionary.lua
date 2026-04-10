print("******复杂数据类型-表 2******")

print("******字典******")
print("******字典的声明******")
a = {["name"] = "lixiancai", ["age"] = 14, ["key"] = "value"}

-- 查询
print(a["name"]) -- lixiancai
print(a["age"]) -- 14
print(a["key"]) -- value

-- 虽然可以通过表.成员变量的形式得到值，但不能是数字number（a.1）
print(a.name) -- lixiancai
print(a.age) -- 14
print(a.key) -- value

-- 修改
a["name"] = "李咸菜"
print(a["name"]) -- 李咸菜

-- 新增
a["sex"] = 1
print(a["sex"])

-- 删除
a["sex"] = nil
print(a["sex"])

print("******字典的遍历******")
-- 如果用表模拟字典，则一定需要pairs遍历
for key, value in pairs(a) do
    print("字典遍历键值:" .. key .. "=>" .. value)
end

for key in pairs(a) do
    print("字典遍历键:" .. key)
end

for _,value in pairs(a) do
    print("字典遍历值:" .. value)
end