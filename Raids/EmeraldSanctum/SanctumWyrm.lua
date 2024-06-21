local module, L = BigWigs:ModuleDeclaration("Sanctum Wyrm", "Emerald Sanctum")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30020
module.enabletrigger = module.translatedName
module.toggleoptions = {"volley"}
module.trashMod = true
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Emerald Sanctum"],
	AceLibrary("Babble-Zone-2.2")["Emerald Sanctum"],
}

L:RegisterTranslations("enUS", function() return {
    cmd = "SanctumWyrm",

    volley_cmd = "volley",
    volley_name = "毒箭齐射警报",
    volley_desc = "毒箭齐射出现时进行警告",

    trigger_volley = "Sanctum Wyrm's Poison Bolt Volley",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_volley = "毒箭齐射",
    
    trigger_volleyYou = "Sanctum Wyrm's Poison Bolt Volley hits you",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_volley = "保持最远距离以躲避毒箭齐射！",
    
    ["You have slain %s!"] = true,
    ["You have slain %s!"] = "你已击败了%s！",
	
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-21
    cmd = "SanctumWyrm",

    volley_cmd = "volley",
    volley_name = "毒箭齐射警报",
    volley_desc = "毒箭齐射出现时进行警告",

    trigger_volley = "Sanctum Wyrm's Poison Bolt Volley",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_volley = "毒箭齐射",
    
    trigger_volleyYou = "Sanctum Wyrm's Poison Bolt Volley hits you",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_volley = "保持最远距离以躲避毒箭齐射！",
    
    ["You have slain %s!"] = "你已击败了%s！",
	
} end )

module.defaultDB = {
	bosskill = nil,
}

local timer = {
	volley = 15,
}
local icon = {
	volley = "Spell_Nature_CorrosiveBreath",
}
local color = {
	volley = "Black",
}
local syncName = {
	volley = "SanctumWyrmVolley"..module.revision,
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--trigger_volley, trigger_volleyYou
	
	self:ThrottleSync(1, syncName.volley)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:CheckForBossDeath(msg)
	if msg == string.format(UNITDIESOTHER, self:ToString())
		or msg == string.format(L["You have slain %s!"], self.translatedName) then
		local function IsBossInCombat()
			local t = module.enabletrigger
			if not t then return false end
			if type(t) == "string" then t = {t} end

			if UnitExists("target") and UnitAffectingCombat("target") then
				local target = UnitName("target")
				for _, mob in pairs(t) do
					if target == mob then
						return true
					end
				end
			end

			local num = GetNumRaidMembers()
			for i = 1, num do
				local raidUnit = string.format("raid%starget", i)
				if UnitExists(raidUnit) and UnitAffectingCombat(raidUnit) then
					local target = UnitName(raidUnit)
					for _, mob in pairs(t) do
						if target == mob then
							return true
						end
					end
				end
			end
			return false
		end

		if not IsBossInCombat() then
			self:SendBossDeathSync()
		end
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_volley"]) then
		self:Sync(syncName.volley)
	end
	
	if string.find(msg, L["trigger_volleyYou"]) then
		if UnitClass("Player") == BC["Mage"] then
			self:Message(L["msg_volley"], "Urgent", false, nil, false)
			self:Sound("Info")
		elseif UnitClass("Player") == BC["Warlock"] then
			self:Message(L["msg_volley"], "Urgent", false, nil, false)
			self:Sound("Info")
		elseif UnitClass("Player") == BC["Priest"] then
			self:Message(L["msg_volley"], "Urgent", false, nil, false)
			self:Sound("Info")
		end
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.volley and self.db.profile.volley then
		self:Volley()
	end
end


function module:Volley()
	self:RemoveBar(L["bar_volley"])
	self:Bar(L["bar_volley"], timer.volley, icon.volley, true, color.volley)
	
	if UnitClass("Player") == BC["Shaman"] then
		self:WarningSign(icon.volley, 0.7)
	end
end
