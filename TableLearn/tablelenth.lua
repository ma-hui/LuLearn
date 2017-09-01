--关于lua的长度判断学习小结

-- ***基础部分***
local names = {
	[1] = 'M',
	[2] = 'A',
	[3] = 'H',
	[4] = 'U',
	[5] = 'I',
}

--在lua中需要获取table的长度，一般方法有3种

-- --1、 table.getn(), 获取table中从1开始，遇到值为nil前的最大的，连续的数字键，以此数字作为table长度返回
-- local lenth = table.getn(names)
-- print (string.format("1: lenth = %d",lenth))
-- --1: lenth = 5


-- --2、table.maxn()，获取table中，最大的数字键值
-- local lenth = table.maxn(names)
-- print (string.format("2: lenth = %d",lenth))
-- --2: lenth = 5


-- -- 3、# 的计算方法和getn()相同
-- local lenth = #names
-- print (string.format("3: lenth = %d",lenth))
-- --3: lenth = 5


-- ***进阶部分***
--[[
	table可以理解为键值对.
	key如果不指定，默认为数字，从1开始，类似于列表（list
	如果手工指定了值的key，为字符串的情况，此时的table相当于字典（dict
	如果存在两种共用的情况，此时再用之前的三种方法来获取table的长度，一定会出错
]]--

local books = {
	[2] = '2',
	[10] = '10',
	['LUA'] = 'M',
	['PYTHON'] = 'A',
	['PHP'] = 'H',
	['C'] = 'U',
	['C#'] = 'I',
}

--1、 table.getn(), 获取table中从1开始，遇到值为nil前的最大的，连续的数字键，以此数字作为table长度返回
local lenth = table.getn(books)
print (string.format("1: lenth = %d",lenth))
--1: lenth = 0
--[[
	table中没有起始的数字键1，因此books在getn的计算中长度为0， 如果books增加books[1]的值，输出结果会变成2
]]--


--2、table.maxn()
local lenth = table.maxn(books)
print (string.format("2: lenth = %d",lenth))
--2: lenth = 10

-- 3、# 的计算方法和getn()相同
local lenth = #books
print (string.format("3: lenth = %d",lenth))
--3: lenth = 0

--三种情况下，输出的长度都为0。


-- ***判空***
--判断table是否为空

--1、需要判断table是否为nil
if names == nil then
	print('table is nil')
end

--2、判断table是否为{}

local ttab = {}

--（1）直接判断一定是错误的
if ttab == {} then
	print('ttab is {}')
else
	print("ttab可以理解为存储了一个地址，这个地址指向一块内存，内存中存放的内容为{}\n如果直接将两者比较，是将两个内存地址进行比较，结果永远是false")
end

--（2）通过长度判断
--[[
可以使用基础部分的三种方法来进行判断。但是需要保证，table如果有值，一定都为数字键，否则会出现误判的情况。
对于纯字典型table，三种长度判断方法都无效。
]]--

if #ttab ~= 0 then
	print('ttab is not null')
end

--(3) 通过迭代器
if next(ttab) == nil then
	print("只要table中存在内容，next迭代器就可以获取到这个内容\n pairs")
end
