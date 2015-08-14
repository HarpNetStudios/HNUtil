--[[

=== HNUtil ===

 A modulescript with lots of useful functions.

 (Somewhat) up-to-date source code can (usually) be found at our GitHub:
 https://www.github.com/harpnetstudios/hnutil

Usage:

 local HN = require(game.ReplicatedStorage.HNUtil)
 HN.hex2vec("#FF2400")

Function list:

 Vector3 hex2vec(string hex, boolean decimal):
 	 When given a sting with a hexadecimal color, is returns a Vector3 of the RGB values.

 Color3 hex2clr(string hex, boolean decimal):
	 The same as hex2vec() except it returns a Color3.

 string vec2hex(Vector3 vec3):
	 Returns a hexadecimal color from a Vector3 which has either a decimal or 24-bit RGB color in it.

 string clr2hex(Color3 clr3):
	 The same as vec2hex(), however it takes Color3 as an argument.

 int rrandom(int min, int max):
	 Generates a table of 255 random number in the range of the arguments, picks a random number from those.

 string httpGET(string url, boolean nocache):
	 Allows you to easily send GET requests to web servers. You must have "http://" or "https://" at the beginning of your URL.

 string httpPOST(string url, string data, HttpContentType type):
	 Allows you to easily send POST requests to web servers. You must have "http://" or "https://" at the beginning of your URL.

]]--

local _M = {}

local http = game:GetService("HttpService")

function _M.hex2vec(hex, decimal)
    hex = hex:gsub("#","")
	if decimal then
		return Vector3.new(tonumber("0x"..hex:sub(1,2)/255), tonumber("0x"..hex:sub(3,4)/255), tonumber("0x"..hex:sub(5,6))/255)
	elseif not decimal then
		return Vector3.new(tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6)))
	elseif decimal == nil then
		return Vector3.new(tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6)))
	end
end

function _M.hex2clr(hex, decimal)
    hex = hex:gsub("#","")
    if decimal then
		return Color3.new(tonumber("0x"..hex:sub(1,2)/255), tonumber("0x"..hex:sub(3,4)/255), tonumber("0x"..hex:sub(5,6))/255)
	elseif not decimal then
		return Color3.new(tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6)))
	elseif decimal == nil then
		return Color3.new(tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6)))
	end
end

function _M.clr2hex(clr3)
	local hx = '0X'

	if (not clr3.r == math.floor(clr3.r)) or (not clr3.g == math.floor(clr3.g)) or (not clr3.b == math.floor(clr3.b)) then
		rgb = {clr3.r*255, clr3.g*255, clr3.b*255}
	else
		rgb = {clr3.r, clr3.g, clr3.b}
	end

	for key, value in pairs(rgb) do
		local hex = ''
		while value > 0cdo
			local index = math.fmod(value, 16) + 1
			value = math.floor(value / 16)
			hex = string.sub('0123456789ABCDEF', index, index) .. hex
		end

		if string.len(hex) == 0 then
			hex = '00'

		elseif string.len(hex) == 1 then
			hex = '0' .. hex
		end

		hx = hx .. hex
	end

	return hx
end

function _M.vec2hex(vec3)
	local hx = '0X'

	if (not vec3.x == math.floor(vec3.x)) or (not vec3.y == math.floor(vec3.y)) or (not vec3.z == math.floor(vec3.z)) then
		rgb = {vec3.x*255, vec3.y*255, vec3.z*255}
	else
		rgb = {vec3.x, vec3.y, vec3.z}
	end

	for key, value in pairs(rgb) do
		local hex = ''
		while value > 0cdo
			local index = math.fmod(value, 16) + 1
			value = math.floor(value / 16)
			hex = string.sub('0123456789ABCDEF', index, index) .. hex
		end

		if string.len(hex) == 0 then
			hex = '00'

		elseif string.len(hex) == 1 then
			hex = '0' .. hex
		end

		hx = hx .. hex
	end

	return hx
end

function _M.rrandom()
	numbers = {}
	for i = 1,255 do
		if min == nil or max == nil then
			newvalues = math.random(-100, 100)
		elseif max == nil and min ~= nil then
			newvalues = math.random(min, 100)
		elseif min == nil and max ~= nil then
			newvalues = math.random(-100, max)
		else
			newvalues = math.random(min, max)
		end
		table.insert(numbers, #numbers, newvalues)
	end
	term = math.random(1,255)
	return numbers[term]
end

return _M --REMEMBER TO KEEP THIS LINE. THE MOST IMPORTANT LINE OF THE MODULESCRIPT!
