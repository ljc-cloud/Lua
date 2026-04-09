print("******字符串******")

-- 获取字符串长度
-- 一个汉字占三个长度 英文字符占一个长度
print("******获取字符串长度******")
s = 'addada李咸菜'
print(s)
-- 15
print(#s)

print("******字符串多行打印******")
print("123\n321")
s = [[
li
xian
cai
]]
print(s)

print("******字符串多行拼接******")
s = "456" .. "654"
print(s)
s = "456" .. 1.2
print(s)

-- %d 与数字拼接
-- %a 与任何字符串拼接
-- %s 与字符串拼接
s = string.format("我是lixiancai，今年%d岁", 15)
print(s)


print("******tostring******")
n = 1;
print(tostring(1))


print("******字符串公共方法******")
s = 'abcdefg'
-- 小写转大写
print(string.upper(s))
-- 大写转小写
print(string.lower(s))
-- 反转字符串
print(string.reverse(s))
-- 字符串索引查找 返回 字符串首字符的起始索引和结尾索引 3	5
print(string.find(s, "cde"))
-- 截取字符串  返回字符串的子串， 该子串从 i 开始到 j 为止。
print(string.sub(s, 3))
print(string.sub(s, 3, 5))
-- 字符串重复
print(string.rep(s, 2))
-- 字符串修改 返回修改后的结果和修改的次数  ab**efg**	2
s = 'abcdefgcd'
print(string.gsub(s, "cd", "**"))
-- 字符串转ASCII码
a = string.byte("lua", 1);
print(a)
-- ASCII码转字符
print(string.char(a))