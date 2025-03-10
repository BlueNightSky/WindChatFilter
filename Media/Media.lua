local W, F, L = unpack(select(2, ...))
local format = format

W.Media = {
	Icons = {},
	Textures = {}
}

local MediaPath = "Interface/Addons/" .. W.AddonNamePlain .. "/Media/"

do
	local template = "|T%s:%d:%d:0:0:64:64:5:59:5:59|t"
	local s = 14
	function F.GetIconString(icon, size)
		return format(template, icon, size or s, size or s)
	end
end

local function AddMedia(name, file, type)
	W.Media[type][name] = MediaPath .. type .. "/" .. file
end

do
	AddMedia("title", "WindDungeonHelperTitle.tga", "Textures")

	local texTable = {
		texHeight = 512,
		texWidth = 1024,
		languages = {
			-- {offsetY, width, height}
			enUS = {0, 655, 122},
			zhCN = {150, 375, 108},
			zhTW = {300, 311, 108}
		}
	}

	function F.GetTitleSize(scale)
		local data = texTable.languages[W.Locale] or texTable.languages["enUS"]
		if not data then
			return
		end

		return {
			width = function()
				return scale * data[2]
			end,
			height = function()
				return scale * data[3]
			end
		}
	end

	function F.GetTitleTexCoord()
		local data = texTable.languages[W.Locale] or texTable.languages["enUS"]
		if not data then
			return
		end

		return {0, data[2] / texTable.texWidth, data[1] / texTable.texHeight, (data[1] + data[3]) / texTable.texHeight}
	end
end

AddMedia("icon", "Icon.tga", "Icons")

AddMedia("discord", "Discord.tga", "Icons")
AddMedia("github", "Github.tga", "Icons")
AddMedia("nga", "NGA.tga", "Icons")
AddMedia("qq", "QQ.tga", "Icons")
AddMedia("kook", "KOOK.tga", "Icons")

AddMedia("donateKofi", "Ko-fi.tga", "Icons")
AddMedia("donateAiFaDian", "AiFaDian.tga", "Icons")
