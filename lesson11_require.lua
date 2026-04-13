print("******多脚本执行******")

print("******全局变量和本地变量******")

for i = 1, 2 do
    c = "xiancai"
end

print(c)

-- 本地变量的关键字 local
for i = 1, 2 do
    -- 作用域只在循环内
    local d = "xiancai"
end
print(d) -- nil

print("******多脚本执行******")
-- 用于执行另一个脚本文件
require('test')

print(testA) -- 333
print(localTestA) -- nil

print("******脚本卸载******")
-- 如果是require加载执行的脚本 加载一次过后不会再被执行
require('test')

-- 再次加载后，不会执行该脚本文件代码
require('test')

-- package.loaded['脚本名'] 获取该脚本是否被加载过
print("获取脚本是否已被加载")
local loaded = package.loaded['test']
print(loaded)

print("脚本卸载")
-- 卸载已经执行过的脚本
package.loaded['test'] = nil
loaded = package.loaded['test']
print(loaded)

-- 被卸载后，仍能访问其他脚本的全局变量（感觉像是卸载了他的一次执行）
print(testA)

-- 被卸载后，再次加载，会再次执行该脚本代码
-- require 执行一个脚本时，可以在脚本中返回外部希望获取的内容
local testB = require('test')
print(testB)

print("******大G表******")
-- _G表是个总表(table) 他将我们声明的全部全局变量都存储在其中
for k, v in pairs(_G) do
    print(string.format("_G表: %s => %s", k, v))
end