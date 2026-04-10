print("******类和结构体******")

-- lua中是没有面向对象的实现的，需要通过表来模拟

Student = {
    -- 成员变量
    name = "lixiancai",
    age = 20,
    sex = 1,
    -- 成员函数
    Greeting = function ()
        print("打个招呼")
    end,
    PrintName = function (self)
        print("name:" .. self.name)
    end
}

-- lua中类的表现，更像是一个类中有很多的静态变量和函数
print(Student.name)
print(Student.age)
print(Student.sex)
Student.Greeting()

-- 在表外声明变量和方法
Student.score = 100
print(Student.score)

Student.Speek = function ()
    print("Speek")
end
Student.Speek()

function Student.Speek2()
    print("Speek2")
end

Student.Speek2()

-- 在函数内部想要访问表内的变量和方法，可以使用 表名.变量 和 表名.方法 
function Student.Grow()
    Student.age = Student.age + 1
    print(Student.name .. "成长了，现在是" .. Student.age .. "岁")
end

Student.Grow()

-- 也可以通过参数传递的方式，把表作为参数传进来
function Student.Grow2(stu)
    stu.age = stu.age + 1
    print(stu.name .. "成长了，现在是" .. stu.age .. "岁")
end

Student.Grow2(Student)

-- 也可以通过参数传递的方式，把表作为参数传进来
function Student.Grow3(stu)
    stu.age = stu.age + 1
    print(stu.name .. "成长了，现在是" .. stu.age .. "岁")
end

-- 使用 : 冒号访问内部变量和方法

-- PrintName是表内部声明的，表内部声明的方法如果需要访问内部的变量和其他方法时，需要在添加一个参数 
-- 然后再使用 表名:方法 的方式调用，这样默认就会将调用者作为第一个参数传入
Student:PrintName() -- 将Student作为参数传入

-- 表外部声明的方法，则不需要添加一个参数，只需要 声明函数时 使用 function 表名:方法() end 即可
-- 这样方法内部就会有一个默认的变量self为调用者
function Student:Grow4()
    self.age = self.age + 1
    print(self.name .. "成长了，现在是" .. self.age .. "岁")
end

-- 调用时 也需要 表名:方法 调用
Student:Grow4()