print("******条件分支语句******")

a = 8
-- if 条件 then 语句块 end
if a > 4 then 
    print("a > 4")
end

-- if 条件 then 语句块 else 语句块 end
a = 3
if a > 4 then 
    print("a > 4")
else
    print("a <= 4")
end

-- 多分支
-- if 条件 then 语句块 elseif 条件 then 语句块 elseif 条件 then 语句块 end ......
a =  4
if a > 4 then
    print("a > 4")
elseif a == 4 then
    print("a == 4")
else
    print("a < 4")
end

-- lua中没有switch语法，需要自己实现