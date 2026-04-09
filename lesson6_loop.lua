print("******循环语句******")

print("******while循环******")
num = 1
-- while 进入循环条件 do 语句块 end
while num <= 5 do
    print(num)
    num = num + 1
end

print("******do while循环******")
num = 0
-- repeat 语句块 until 结束循环条件 
repeat
    print(num)
    num = num + 1
until num > 5

print("******for循环******")

for i = 1, 5 do
    print(i)
end

-- i = 1, 10, 2  2为步长，就是每次循环i添加的步长
for i = 1, 10, 2 do
        print(i)
end