
local module, L = BigWigs:ModuleDeclaration("Core Hound", "Molten Core")

module.revision = 30073
module.enabletrigger = module.translatedName
module.toggleoptions = {"respawn"}
module.trashMod = true
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Molten Core"],
	AceLibrary("Babble-Zone-2.2")["Molten Core"],
}
module.defaultDB = {
	bosskill = nil,
}

L:RegisterTranslations("enUS", function() return {
	cmd = "CoreHound",

	respawn_cmd = "respawn",
    respawn_name = "重生警报",
    respawn_desc = "重生出现时进行警告",
	
	
	trigger_smolder = "Core Hound collapses and begins to smolder.",
    bar_respawn = "重生",
    msg_respawn = "在10秒内杀死所有熔火恶犬",

    ["You have slain %s!"] = true,
    ["You have slain %s!"] = "你击杀了 %s！",
} end )

L:RegisterTranslations("zhCN", function() return {
	cmd = "CoreHound",

	respawn_cmd = "respawn",
    respawn_name = "重生警报",
    respawn_desc = "重生出现时进行警告",
	
	
	trigger_smolder = "Core Hound collapses and begins to smolder.",
    bar_respawn = "重生",
    msg_respawn = "在10秒内杀死所有熔火恶犬",

    ["You have slain %s!"] = true,
    ["You have slain %s!"] = "你击杀了 %s！",
} end )

local timer = {
	respawn = 10,
}
local icon = {
	respawn = "inv_misc_pocketwatch_01",
}
local color = {
	respawn = "Magenta",
}
local syncName = {
	dead = "CoreHoundDead"..module.revision,
}

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	
	self:ThrottleSync(10, syncName.dead)
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

			if UnitExists("Target") and UnitAffectingCombat("Target") then
				local target = UnitName("Target")
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

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if msg == L["trigger_smolder"] then
		self:Sync(syncName.dead)
	end
end

function module:Event(msg)
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.dead and self.db.profile.respawn then
		self:StartTimer()
	end
end


function module:StartTimer()
	self:Message(L["msg_respawn"])
	self:Bar(L["bar_respawn"], timer.respawn, icon.respawn, true, color.respawn)
end
