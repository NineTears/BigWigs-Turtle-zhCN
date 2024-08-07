
local module, L = BigWigs:ModuleDeclaration("Sanctum Dreamer", "Emerald Sanctum")

module.revision = 30020
module.enabletrigger = module.translatedName
module.toggleoptions = {"dreamstate"}
module.trashMod = true
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Emerald Sanctum"],
	AceLibrary("Babble-Zone-2.2")["Emerald Sanctum"],
}

L:RegisterTranslations("enUS", function() return {
    cmd = "SanctumDreamer",

    dreamstate_cmd = "dreamstate",
    dreamstate_name = "梦境状态警报",
    dreamstate_desc = "梦境状态出现时进行警告",

    trigger_sleepYou = "You are afflicted by Dreamstate.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_sleepFade = "Dreamstate fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY
    trigger_sleepOther = "(.+) is afflicted by Dreamstate.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
    
    --bar_dreamstate = " is Sleeping",
    bar_dreamstate = "沉睡的人",
    
    ["You have slain %s!"] = true,
    ["You have slain %s!"] = "你已击败了%s！",
    you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "SanctumDreamer",

    dreamstate_cmd = "dreamstate",
    dreamstate_name = "梦境状态警报",
    dreamstate_desc = "梦境状态出现时进行警告",

    trigger_sleepYou = "你受到了梦境效果的影响。",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_sleepFade = "梦境效果从(.+)身上消失了。",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY
    trigger_sleepOther = "(.+)受到了梦境效果的影响。",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
    
    --bar_dreamstate = " is Sleeping",
    bar_dreamstate = "治疗沉睡队友！",
    
    ["You have slain %s!"] = "你已击败了%s！",
    you = "你",
} end )

module.defaultDB = {
	bosskill = nil,
}

local timer = {
	dreamstate = 10,
}
local icon = {
	dreamstate = "Spell_Nature_Sleep",
}
local color = {
	dreamstate = "White",
}
local syncName = {
	sleepOn = "SanctumDreamerDreamstateOn"..module.revision,
	--sleepOff = "SanctumDreamerDreamstateOff"..module.revision,
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_sleepYou
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--trigger_sleepFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--trigger_sleepFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--trigger_sleepFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_sleepOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_sleepOther
	
	
	
	self:ThrottleSync(3, syncName.sleepOn)
	--self:ThrottleSync(0, syncName.sleepOff)
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
	if msg == L["trigger_sleepYou"] then
		self:Sync(syncName.sleepOn .. " " .. UnitName("Player"))
	
	--elseif msg == L["trigger_sleepFade"] then
	--	local _,_, sleepOffTarget, _ = string.find(msg, L["trigger_sleepFade"])
	--	if sleepOffTarget == L["you"] then sleepOffTarget = UnitName("Player") end
	--	self:Sync(syncName.sleepOff .. " " .. sleepOffTarget)
	
	elseif string.find(msg, L["trigger_sleepOther"]) then
		local _,_, sleepOnTarget, _ = string.find(msg, L["trigger_sleepOther"])
		self:Sync(syncName.sleepOn .. " " .. sleepOnTarget)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.sleepOn and rest and self.db.profile.dreamstate then
		self:SleepOn(rest)
	--elseif sync == syncName.sleepOff and rest and self.db.profile.dreamstate then
	--	self:SleepOff(rest)
	end
end


function module:SleepOn(rest)
	self:Bar(L["bar_dreamstate"], timer.dreamstate, icon.dreamstate, true, color.dreamstate)
	--self:Bar(rest..L["bar_dreamstate"], timer.dreamstate, icon.dreamstate, true, color.dreamstate)
end

function module:SleepOff(rest)
	self:RemoveBar(L["bar_dreamstate"])
	--self:RemoveBar(rest..L["bar_dreamstate"])
end
