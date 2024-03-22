
local name = "Common Auras"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..name)
local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2")

local bzorgrimmar = AceLibrary("Babble-Zone-2.2")["Orgrimmar"]
local bzthunderbluff = AceLibrary("Babble-Zone-2.2")["Thunder Bluff"]
local bzundercity = AceLibrary("Babble-Zone-2.2")["Undercity"]
local bzstonard = AceLibrary("Babble-Zone-2.2")["Stonard"]
local bzstormwind = AceLibrary("Babble-Zone-2.2")["Stormwind City"]
local bzironforge = AceLibrary("Babble-Zone-2.2")["Ironforge"]
local bzdarnassus = AceLibrary("Babble-Zone-2.2")["Darnassus"]
local bztheramore = AceLibrary("Babble-Zone-2.2")["Theramore Isle"]
local bzkarazhan = AceLibrary("Babble-Zone-2.2")["Karazhan"]

local spellStatus = nil

local whZone = nil
local whColor = nil
local whText = nil

local portalColor = nil
local portalText = nil

-- Use for detecting instant cast target (Fear Ward)
local spellTarget = nil
local spellCasting = nil

local timeToShutdown = nil
local shutdownBigWarning = nil

L:RegisterTranslations("enUS", function() return {
	-- iconPrefix = "Interface\\Icons\\",
	
	-- msg_fearward = " FearWard on ",
	-- bar_fearward = " FearWard CD",
	
	-- msg_shieldwall = " Shield Wall",
	-- bar_shieldwall = " Shield Wall",
	
	-- msg_laststand = " Last Stand",
	-- bar_laststand = " Last Stand",
	
	-- msg_lifegivingGem = " Lifegiving Gem",
	-- bar_lifegivingGem = " Lifegiving Gem",
	
	-- msg_challengingShout = " Challenging Shout",
	-- bar_challengingShout = " Challenging Shout",
	
	-- msg_challengingRoar = " Challenging Roar",
	-- bar_challengingRoar = " Challenging Roar",
	
	-- msg_divineIntervention = "Divine Intervention on ",
	-- bar_divineIntervention = " Divine Intervention",
	
	-- portal_regexp = ".*: (.*)",
	
	-- trigger_wormhole = "just opened a wormhole.",--CHAT_MSG_MONSTER_EMOTE
	-- bar_wormhole = " Wormhole",
	-- msg_wormhole = " Wormhole",
	
	-- trigger_orange = "begins to conjure a refreshment table.",--CHAT_MSG_MONSTER_EMOTE
	-- bar_orange = "Oranges!",
	-- msg_orange = "Oranges! Get your Vitamin C",
	
	-- trigger_soulwell = "begins a Soulwell ritual.",--CHAT_MSG_MONSTER_EMOTE
	-- bar_soulwell = "Soulwell!",
	-- msg_soulwell = "Soulwell! Get your Cookie",
	
	-- trigger_shutdown = "Shutdown in (.+) (.+)",--CHAT_MSG_SYSTEM
	-- trigger_restart = "Restart in (.+) (.+)",--CHAT_MSG_SYSTEM
	-- trigger_restartMinSec = "Shutdown in (.+) Minutes (.+) Seconds.",--CHAT_MSG_SYSTEM
	-- trigger_shutdownMinSec = "Restart in (.+) Minutes (.+) Seconds.",--CHAT_MSG_SYSTEM
	-- bar_shutDown = "Server Shutdown/Restart",
	
	["Toggle %s display."] = true,
	["Wormhole"] = true,
	["Orange"] = true,
	["Soulwell"] = true,
	["Portal"] = true,
	["Shutdown"] = true,
	["broadcast"] = true,
	["Broadcast"] = true,
	["Toggle broadcasting the messages to the raidwarning channel."] = true,

	["Gives timer bars and raid messages about common buffs and debuffs."] = true,
	["Common Auras"] = true,
	["commonauras"] = true,

	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-03-12
	iconPrefix = "Interface\\Icons\\",
	
	msg_fearward = " 守护恐惧 ",
	bar_fearward = " 守护恐惧冷却",
	
	msg_shieldwall = " 盾墙",
	bar_shieldwall = " 盾墙",
	
	msg_laststand = " 破釜沉舟",
	bar_laststand = " 破釜沉舟",
	
	msg_lifegivingGem = " 生命赐予宝石",
	bar_lifegivingGem = " 生命赐予宝石",
	
	msg_challengingShout = " 挑战怒吼",
	bar_challengingShout = " 挑战怒吼",
	
	msg_challengingRoar = " 挑战咆哮",
	bar_challengingRoar = " 挑战咆哮",
	
	msg_divineIntervention = "圣佑术在 ",
	bar_divineIntervention = " 圣佑术",
	
	portal_regexp = ".*: (.*)",
	
	trigger_wormhole = "just opened a wormhole.",--CHAT_MSG_MONSTER_EMOTE
	bar_wormhole = " 虫洞",
	msg_wormhole = " 虫洞",
	
	trigger_orange = "begins to conjure a refreshment table.",--CHAT_MSG_MONSTER_EMOTE
	bar_orange = "橙子！",
	msg_orange = "橙子！补充维生素C",
	
	trigger_soulwell = "begins a Soulwell ritual.",--CHAT_MSG_MONSTER_EMOTE
	bar_soulwell = "灵魂之井!",
	msg_soulwell = "灵魂之井！拿你的饼干",
	
	trigger_shutdown = "Shutdown in (.+) (.+)",--CHAT_MSG_SYSTEM
	trigger_restart = "Restart in (.+) (.+)",--CHAT_MSG_SYSTEM
	trigger_restartMinSec = "Shutdown in (.+) Minutes (.+) Seconds.",--CHAT_MSG_SYSTEM
	trigger_shutdownMinSec = "Restart in (.+) Minutes (.+) Seconds.",--CHAT_MSG_SYSTEM
	bar_shutDown = "服务器关机/重启",
	
	["Toggle %s display."] = "切换%s显示。",
	-- ["Wormhole"] = "虫洞",
	-- ["Orange"] = "橘子",
	-- ["Soulwell"] = "灵魂之井",
	-- ["Portal"] = "传送门",
	-- ["Shutdown"] = "关机",
	-- ["broadcast"] = "广播",
	-- ["Broadcast"] = "广播",
	["Toggle broadcasting the messages to the raidwarning channel."] = "切换广播信息到团队警告频道。",

	["Gives timer bars and raid messages about common buffs and debuffs."] = "提供关于常见增益和减益的计时条和团队信息。",
	-- ["Common Auras"] = "常见的光环",
	-- ["commonauras"] = "常见的光环",
	Dwarf = "Dwarf",
	Alliance = "Alliance",
	Horde = "Horde",
	yougaindivineintervention = "You gain Divine Intervention.",
} end )

L:RegisterTranslations("zhCN", function() return {
	iconPrefix = "Interface\\Icons\\",
	
	msg_fearward = " 守护恐惧 ",
	bar_fearward = " 守护恐惧冷却",
	
	msg_shieldwall = " 盾墙",
	bar_shieldwall = " 盾墙",
	
	msg_laststand = " 破釜沉舟",
	bar_laststand = " 破釜沉舟",
	
	msg_lifegivingGem = " 生命赐予宝石",
	bar_lifegivingGem = " 生命赐予宝石",
	
	msg_challengingShout = " 挑战怒吼",
	bar_challengingShout = " 挑战怒吼",
	
	msg_challengingRoar = " 挑战咆哮",
	bar_challengingRoar = " 挑战咆哮",
	
	msg_divineIntervention = "圣佑术在 ",
	bar_divineIntervention = " 圣佑术",
	
	portal_regexp = ".*: (.*)",
	
	trigger_wormhole = "just opened a wormhole.",--CHAT_MSG_MONSTER_EMOTE
	bar_wormhole = " 虫洞",
	msg_wormhole = " 虫洞",
	
	trigger_orange = "begins to conjure a refreshment table.",--CHAT_MSG_MONSTER_EMOTE
	bar_orange = "橙子！",
	msg_orange = "橙子！补充维生素C",
	
	trigger_soulwell = "begins a Soulwell ritual.",--CHAT_MSG_MONSTER_EMOTE
	bar_soulwell = "灵魂之井!",
	msg_soulwell = "灵魂之井！拿你的饼干",
	
	trigger_shutdown = "Shutdown in (.+) (.+)",--CHAT_MSG_SYSTEM
	trigger_restart = "Restart in (.+) (.+)",--CHAT_MSG_SYSTEM
	trigger_restartMinSec = "Shutdown in (.+) Minutes (.+) Seconds.",--CHAT_MSG_SYSTEM
	trigger_shutdownMinSec = "Restart in (.+) Minutes (.+) Seconds.",--CHAT_MSG_SYSTEM
	bar_shutDown = "服务器关机/重启",
	
	["Toggle %s display."] = "切换%s显示。",
	["Wormhole"] = "虫洞",
	["Orange"] = "橘子",
	["Soulwell"] = "灵魂之井",
	["Portal"] = "传送门",
	["Shutdown"] = "关机",
	["broadcast"] = "广播",
	["Broadcast"] = "广播",
	["Toggle broadcasting the messages to the raidwarning channel."] = "切换广播信息到团队警告频道。",

	["Gives timer bars and raid messages about common buffs and debuffs."] = "提供关于常见增益和减益的计时条和团队信息。",
	["Common Auras"] = "常见的光环",
	["commonauras"] = "常见的光环",
	Dwarf = "矮人",
	Alliance = "联盟",
	Horde = "部落",
	yougaindivineintervention = "你获得了神圣干涉。",
} end )

BigWigsCommonAuras = BigWigs:NewModule(name, "AceHook-2.1")
BigWigsCommonAuras.synctoken = myname
BigWigsCommonAuras.defaultDB = {
	fearward = true,
	shieldwall = true,
	laststand = true,
	lifegivinggem = true,
	challengingshout = true,
	challengingroar = true,
	di = true,
	portal = true,
	wormhole = true,
	orange = true,
	soulwell = true,
	shutdown = true,
	broadcast = false,
}
BigWigsCommonAuras.consoleCmd = L["commonauras"]
BigWigsCommonAuras.revision = 30066
BigWigsCommonAuras.external = true
BigWigsCommonAuras.consoleOptions = {
	type = "group",
	name = L["Common Auras"],
	desc = L["Gives timer bars and raid messages about common buffs and debuffs."],
	args   = {
		["fearward"] = {
			type = "toggle",
			name = BS["Fear Ward"],
			desc = string.format(L["Toggle %s display."], BS["Fear Ward"]),
			get = function() return BigWigsCommonAuras.db.profile.fearward end,
			set = function(v) BigWigsCommonAuras.db.profile.fearward = v end,
		},
		["shieldwall"] = {
			type = "toggle",
			name = BS["Shield Wall"],
			desc = string.format(L["Toggle %s display."], BS["Shield Wall"]),
			get = function() return BigWigsCommonAuras.db.profile.shieldwall end,
			set = function(v) BigWigsCommonAuras.db.profile.shieldwall = v end,
		},
		["laststand"] = {
			type = "toggle",
			name = BS["Last Stand"],
			desc = string.format(L["Toggle %s display."], BS["Last Stand"]),
			get = function() return BigWigsCommonAuras.db.profile.laststand end,
			set = function(v) BigWigsCommonAuras.db.profile.laststand = v end,
		},
		["lifegivinggem"] = {
			type = "toggle",
			name = BS["Lifegiving Gem"],
			desc = string.format(L["Toggle %s display."], BS["Lifegiving Gem"]),
			get = function() return BigWigsCommonAuras.db.profile.lifegivinggem end,
			set = function(v) BigWigsCommonAuras.db.profile.lifegivinggem = v end,
		},
		["challengingshout"] = {
			type = "toggle",
			name = BS["Challenging Shout"],
			desc = string.format(L["Toggle %s display."], BS["Challenging Shout"]),
			get = function() return BigWigsCommonAuras.db.profile.challengingshout end,
			set = function(v) BigWigsCommonAuras.db.profile.challengingshout = v end,
		},
		["challengingroar"] = {
			type = "toggle",
			name = BS["Challenging Roar"],
			desc = string.format(L["Toggle %s display."], BS["Challenging Roar"]),
			get = function() return BigWigsCommonAuras.db.profile.challengingroar end,
			set = function(v) BigWigsCommonAuras.db.profile.challengingroar = v end,
		},
		["di"] = {
			type = "toggle",
			name = BS["Divine Intervention"],
			desc = string.format(L["Toggle %s display."], BS["Divine Intervention"]),
			get = function() return BigWigsCommonAuras.db.profile.di end,
			set = function(v) BigWigsCommonAuras.db.profile.di = v end,
		},
		["portal"] = {
			type = "toggle",
			name = L["Portal"],
			desc = string.format(L["Toggle %s display."], L["Portal"]),
			get = function() return BigWigsCommonAuras.db.profile.portal end,
			set = function(v) BigWigsCommonAuras.db.profile.portal = v end,
		},
		["wormhole"] = {
			type = "toggle",
			name = L["Wormhole"],
			desc = string.format(L["Toggle %s display."], L["Wormhole"]),
			get = function() return BigWigsCommonAuras.db.profile.wormhole end,
			set = function(v) BigWigsCommonAuras.db.profile.wormhole = v end,
		},
		["orange"] = {
			type = "toggle",
			name = L["Orange"],
			desc = string.format(L["Toggle %s display."], L["Orange"]),
			get = function() return BigWigsCommonAuras.db.profile.orange end,
			set = function(v) BigWigsCommonAuras.db.profile.orange = v end,
		},
		["soulwell"] = {
			type = "toggle",
			name = L["Soulwell"],
			desc = string.format(L["Toggle %s display."], L["Soulwell"]),
			get = function() return BigWigsCommonAuras.db.profile.soulwell end,
			set = function(v) BigWigsCommonAuras.db.profile.soulwell = v end,
		},
		["shutdown"] = {
			type = "toggle",
			name = L["Shutdown"],
			desc = string.format(L["Toggle %s display."], L["Shutdown"]),
			get = function() return BigWigsCommonAuras.db.profile.shutdown end,
			set = function(v) BigWigsCommonAuras.db.profile.shutdown = v end,
		},
		["broadcast"] = {
			type = "toggle",
			name = L["Broadcast"],
			desc = L["Toggle broadcasting the messages to the raidwarning channel."],
			get = function() return BigWigsCommonAuras.db.profile.broadcast end,
			set = function(v) BigWigsCommonAuras.db.profile.broadcast = v end,
		},
	}
}

local timer = {
	fearward = 30,
	laststand = 20,
	lifegivingGem = 20,
	challenging = 6,
	di = 60,
	portal = 60,
	wormhole = 8,
	orange = 60,
	soulwell = 60,
}
local icon = {
	fearward = L["iconPrefix"].."spell_holy_excorcism",
	shieldwall = L["iconPrefix"].."ability_warrior_shieldwall",
	laststand = L["iconPrefix"].."spell_holy_ashestoashes",
	lifegivingGem = L["iconPrefix"].."inv_misc_gem_pearl_05",
	challengingShout = L["iconPrefix"].."ability_bullrush",
	challengingRoar = L["iconPrefix"].."ability_druid_challangingroar",
	di = L["iconPrefix"].."spell_nature_timestop",
	wormhole = L["iconPrefix"].."Inv_Misc_EngGizmos_12",
	orange = L["iconPrefix"].."inv_misc_food_41",
	soulwell = L["iconPrefix"].."inv_stone_04",
	shutdown = L["iconPrefix"].."trade_engineering",
}
local color = {
	fearward = "Cyan",
	shieldwall = "Red",
	laststand = "Red",
	lifegivingGem = "Red",
	challengingShout = "Red",
	challengingRoar = "Red",
	di = "Blue",
	wormhole = "Cyan",
	orange = "Green",
	soulwell = "Green",
	shutdown = "White",
}

function BigWigsCommonAuras:OnEnable()
	--if UnitName("Player") == "Relar" then self:RegisterEvent("CHAT_MSG_SAY") end --Debug
	
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")--trigger_wormhole, trigger_orange, trigger_soulwell
	self:RegisterEvent("CHAT_MSG_SYSTEM")--trigger_shutdown, trigger_restart
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS")
	
	if UnitClass("player") == BC["Warrior"] or UnitClass("player") == BC["Druid"] then
		self:RegisterEvent("SpellStatus_SpellCastInstant")
	
	elseif UnitClass("player") == BC["Priest"] and UnitRace("player") == L["Dwarf"] then
		self:RegisterEvent("SpellStatus_SpellCastInstant")
	
	elseif UnitClass("player") == BC["Mage"] then
		if not spellStatus then spellStatus = AceLibrary("SpellStatus-1.0") end
		self:RegisterEvent("SpellStatus_SpellCastCastingFinish")
		self:RegisterEvent("SpellStatus_SpellCastFailure")
	end
	
	self:RegisterEvent("BigWigs_RecvSync")
	-- XXX Lets have a low throttle because you'll get 2 syncs from yourself, so
	-- it results in 2 messages.
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCAFW", .4) -- Fear Ward
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCASW", .4) -- Shield Wall
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCALS", .4) -- Last Stand
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCALG", .4) -- Last Stand
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCACS", .4) -- Challenging Shout
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCACR", .4) -- Challenging Roar
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCAP", .4) -- Portal
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCAWH", .4) -- Wormhole
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCAOR", .4) -- Orange
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCAWL", .4) -- Soulwell
end


function BigWigsCommonAuras:SpellStatus_SpellCastInstant(sId, sName, sRank, sFullName, sCastTime)
	if sName == BS["Fear Ward"] then
		local targetName = nil
		if spellTarget then
			targetName = spellTarget
			spellCasting = nil
			spellTarget = nil
		else
			if UnitExists("target") and UnitIsPlayer("target") and not UnitIsEnemy("target", "player") then
				targetName = UnitName("target")
			else
				targetName = UnitName("player")
			end
		end
		self:TriggerEvent("BigWigs_SendSync", "BWCAFW "..targetName)
	elseif sName == BS["Shield Wall"] then
		local shieldWallDuration
		local talentName, _, _, _, currentRank, _, _, _ = GetTalentInfo(3, 13)
		if currentRank == 0 then
			shieldWallDuration = 10
		elseif currentRank == 1 then
			shieldWallDuration = 13
		else
			shieldWallDuration = 15
		end
		self:TriggerEvent("BigWigs_SendSync", "BWCASW "..tostring(shieldWallDuration))
	elseif sName == BS["Last Stand"] then
		self:TriggerEvent("BigWigs_SendSync", "BWCALS")
	elseif sName == BS["Challenging Shout"] then
		self:TriggerEvent("BigWigs_SendSync", "BWCACS")
	elseif sName == BS["Challenging Roar"] then
		self:TriggerEvent("BigWigs_SendSync", "BWCACR")
	end
end

function BigWigsCommonAuras:CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS(msg)
	if string.find(msg, BS["Gift of Life"]) and (UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Druid"] or UnitClass("Player") == BC["Paladin"] ) then
		self:TriggerEvent("BigWigs_SendSync", "BWCALG")
	elseif msg == L["yougaindivineintervention"] then
		self:TriggerEvent("BigWigs_SendSync", "BWCADI")
	end
end

function BigWigsCommonAuras:SpellStatus_SpellCastCastingFinish(sId, sName, sRank, sFullName, sCastTime)
	if not string.find(sName, L["Portal"]) then return end
	local name = BS:HasReverseTranslation(sName) and BS:GetReverseTranslation(sName) or sName
	self:ScheduleEvent("bwcaspellcast", self.SpellCast, 0.3, self, name)
end

function BigWigsCommonAuras:SpellStatus_SpellCastFailure(sId, sName, sRank, sFullName, isActiveSpell, UIEM_Message, CMSFLP_SpellName, CMSFLP_Message)
	-- do nothing if we are casting a spell but the error doesn't consern that spell, thanks Iceroth.
	if (spellStatus:IsCastingOrChanneling() and not spellStatus:IsActiveSpell(sId, sName)) then
		return
	end
	if self:IsEventScheduled("bwcaspellcast") then
		self:CancelScheduledEvent("bwcaspellcast")
	end
end

function BigWigsCommonAuras:SpellCast(sName)
	self:TriggerEvent("BigWigs_SendSync", "BWCAP "..sName)
end

function BigWigsCommonAuras:CHAT_MSG_MONSTER_EMOTE(msg, sender)
	if string.find(msg, L["trigger_wormhole"]) then
		
		--Debug
		if UnitName("Player") == "Relar" or UnitName("Player") == "Dreadsome" then DEFAULT_CHAT_FRAME:AddMessage("发送者： "..sender) end
		
		
		whZone = nil
		if GetNumRaidMembers() > 0 then
			for i=1,GetNumRaidMembers() do
				if UnitName("raid"..i) == sender then
					if UnitFactionGroup("raid"..i) == L["Alliance"] then whZone = bzstormwind
					elseif UnitFactionGroup("raid"..i) == L["Horde"] then whZone = bzorgrimmar
					else whZone = sender
					end
				end
			end
		elseif GetNumPartyMembers() > 0 then
			for i=1,GetNumPartyMembers() do
				if UnitName("party"..i) == sender then
					if UnitFactionGroup("party"..i) == L["Alliance"] then whZone = bzstormwind
					elseif UnitFactionGroup("party"..i) == L["Horde"] then whZone = bzorgrimmar
					else whZone = sender
					end
				end
			end
		else
			whZone = sender
		end
		
		if whZone ~= nil then
			self:TriggerEvent("BigWigs_SendSync", "BWCAWH "..whZone)
		end
		
		
	elseif	string.find(msg, L["trigger_orange"]) then
		self:TriggerEvent("BigWigs_SendSync", "BWCAOR")
		
	elseif	string.find(msg, L["trigger_soulwell"]) then
		self:TriggerEvent("BigWigs_SendSync", "BWCAWL")
	end
end

function BigWigsCommonAuras:CHAT_MSG_SYSTEM(msg)	
	if string.find(msg, L["trigger_restartMinSec"]) or string.find(msg, L["trigger_shutdownMinSec"]) then
		local _,_, minutes, seconds = string.find(msg, " in (.+) Minutes (.+) Seconds.")
		timeToShutdown = tonumber(minutes) * 60 + tonumber(seconds)
		
		if self.db.profile.shutdown then
			if timeToShutdown > 9 then 
				self:TriggerEvent("BigWigs_StopBar", self, L["bar_shutDown"])
				self:TriggerEvent("BigWigs_StartBar", self, L["bar_shutDown"], timeToShutdown, icon.shutdown, true, color.shutdown)
			end
		
			if not shutdownBigWarning then
				self:TriggerEvent("BigWigs_Sound", "Beware")
				self:TriggerEvent("BigWigs_ShowWarningSign", icon.shutdown, 2)
				shutdownBigWarning = true
			end
		end
		
		
		
	elseif string.find(msg, L["trigger_restart"]) or string.find(msg, L["trigger_shutdown"]) then
		local _,_, digits, minSec = string.find(msg, " in (.+) (.+)")
		if string.find(minSec, "inute") then
			timeToShutdown = tonumber(digits) * 60
		else
			timeToShutdown = tonumber(digits)
		end
		
		if self.db.profile.shutdown then
			if timeToShutdown > 9 then 
				self:TriggerEvent("BigWigs_StopBar", self, L["bar_shutDown"])
				self:TriggerEvent("BigWigs_StartBar", self, L["bar_shutDown"], timeToShutdown, icon.shutdown, true, color.shutdown)
			end
		
			if not shutdownBigWarning then
				self:TriggerEvent("BigWigs_Sound", "Beware")
				self:TriggerEvent("BigWigs_ShowWarningSign", icon.shutdown, 2)
				shutdownBigWarning = true
			end
		end
	end
end

--Debug
--function BigWigsCommonAuras:CHAT_MSG_SAY(msg)
--end



function BigWigsCommonAuras:BigWigs_RecvSync( sync, rest, nick )
	if not nick then nick = UnitName("player") end
	
	if self.db.profile.fearward and sync == "BWCAFW" and rest then
		self:TriggerEvent("BigWigs_Message", nick..L["msg_fearward"]..rest, "Positive", false, nil, false)
		self:TriggerEvent("BigWigs_StartBar", self, nick..L["bar_fearward"], timer.fearward, icon.fearward, true, color.fearward)
	
	
	elseif self.db.profile.shieldwall and sync == "BWCASW" then
		local swTime = tonumber(rest)
		if not swTime then swTime = 10 end -- If the tank uses an old BWCA, just assume 10 seconds.
		self:TriggerEvent("BigWigs_Message", nick..L["msg_shieldwall"], "Urgent", false, nil, false)
		self:TriggerEvent("BigWigs_StartBar", self, nick..L["bar_shieldwall"], swTime, icon.shieldwall, true, color.shieldwall)
		self:SetCandyBarOnClick("BigWigsBar "..nick..L["bar_shieldwall"], function(name, button, extra) TargetByName(extra, true) end, nick )
	
	
	elseif self.db.profile.laststand and sync == "BWCALS" then
		self:TriggerEvent("BigWigs_Message", nick..L["msg_laststand"], "Urgent", false, nil, false)
		self:TriggerEvent("BigWigs_StartBar", self, nick..L["bar_laststand"], timer.laststand, icon.laststand, true, color.laststand)
		self:SetCandyBarOnClick("BigWigsBar "..nick..L["bar_laststand"], function(name, button, extra) TargetByName(extra, true) end, nick )
	
	
	elseif self.db.profile.lifegivinggem and sync == "BWCALG" then
		self:TriggerEvent("BigWigs_Message", nick..L["msg_lifegivingGem"], "Urgent", false, nil, false)
		self:TriggerEvent("BigWigs_StartBar", self, nick..L["bar_lifegivingGem"], timer.lifegivingGem, icon.lifegivingGem, true, color.lifegivingGem)
		self:SetCandyBarOnClick("BigWigsBar "..nick..L["bar_lifegivingGem"], function(name, button, extra) TargetByName(extra, true) end, nick )
	
	
	elseif self.db.profile.challengingshout and sync == "BWCACS" then
		self:TriggerEvent("BigWigs_Message", nick..L["msg_challengingShout"], "Urgent", false, nil, false)
		self:TriggerEvent("BigWigs_StartBar", self, nick..L["bar_challengingShout"], timer.challenging, icon.challengingShout, true, color.challengingShout)
		self:SetCandyBarOnClick("BigWigsBar "..nick..L["bar_challengingShout"], function(name, button, extra) TargetByName(extra, true) end, nick )
	
	
	elseif self.db.profile.challengingroar and sync == "BWCACR" then
		self:TriggerEvent("BigWigs_Message", nick..L["msg_challengingRoar"], "Urgent", false, nil, false)
		self:TriggerEvent("BigWigs_StartBar", self, nick..L["bar_challengingRoar"], timer.challenging, icon.challengingRoar, true, color.challengingRoar)
		self:SetCandyBarOnClick("BigWigsBar "..nick..L["bar_challengingRoar"], function(name, button, extra) TargetByName(extra, true) end, nick )
	
	elseif self.db.profile.di and sync == "BWCADI" then
		self:TriggerEvent("BigWigs_Message", L["msg_divineIntervention"]..nick, "Urgent", false, nil, false)
		self:TriggerEvent("BigWigs_StartBar", self, nick..L["bar_divineIntervention"], timer.di, icon.di, true, color.di)
		self:SetCandyBarOnClick("BigWigsBar "..nick..L["bar_divineIntervention"], function(name, button, extra) TargetByName(extra, true) end, nick )
	
	elseif self.db.profile.portal and sync == "BWCAP" and rest then
		rest = BS:HasTranslation(rest) and BS:GetTranslation(rest) or rest
		local _, _, zone = string.find(rest, L["portal_regexp"])
		if zone then
			if zone == bzorgrimmar or zone == bzthunderbluff or zone == bzundercity or zone == bzstonard then
				portalColor = "Red"
				portalText = "--部落-- 传送门到 "
			elseif zone == bzstormwind or zone == bzironforge or zone == bzdarnassus or zone == bztheramore then
				portalColor = "Blue"
				portalText = "--联盟-- 传送门到 "
			elseif zone == bzkarazhan or zone  then
				portalColor = "Green"
				portalText = "--中立-- 传送门到 "
			end
			self:TriggerEvent("BigWigs_Message", portalText..zone, L["Attention"], false, nil, false)
			if zone == bzstonard then
				self:TriggerEvent("BigWigs_StartBar", self, rest, timer.portal, L["iconPrefix"].."Spell_Arcane_PortalStonard", true, portalColor)
			elseif zone == bztheramore then
				self:TriggerEvent("BigWigs_StartBar", self, rest, timer.portal, L["iconPrefix"].."Spell_Arcane_PortalTheramore", true, portalColor)
			elseif zone == bzkarazhan then
				self:TriggerEvent("BigWigs_StartBar", self, rest, timer.portal, L["iconPrefix"].."Spell_Arcane_PortalUndercity", true, portalColor)
			else
				self:TriggerEvent("BigWigs_StartBar", self, rest, timer.portal, BS:GetSpellIcon(rest), true, portalColor)
			end
		end
	
	
	elseif self.db.profile.wormhole and sync == "BWCAWH" and rest then
		if rest == bzorgrimmar then
			whColor = "Red"
			whText = "--部落-- 虫洞到奥格瑞玛"
		elseif rest == bzstormwind then
			whColor = "Blue"
			whText = "--联盟-- 虫洞到暴风城"
		end
		self:TriggerEvent("BigWigs_Message", whText, "Attention", false, nil, false)
		self:TriggerEvent("BigWigs_StartBar", self, rest..L["bar_wormhole"], timer.wormhole, icon.wormhole, true, whColor)
		self:TriggerEvent("BigWigs_Sound", "BikeHorn")
		self:TriggerEvent("BigWigs_ShowWarningSign", icon.wormhole, 2)
		
	
	elseif self.db.profile.orange and sync == "BWCAOR" then
		self:TriggerEvent("BigWigs_Message", L["msg_orange"], "Positive", false, nil, false)
		self:TriggerEvent("BigWigs_StartBar", self, L["bar_orange"], timer.orange, icon.orange, true, color.orange)
		self:TriggerEvent("BigWigs_Sound", "BikeHorn")
		self:TriggerEvent("BigWigs_ShowWarningSign", icon.orange, 5)
	
	
	elseif self.db.profile.orange and sync == "BWCAWL" then
		self:TriggerEvent("BigWigs_Message", L["msg_soulwell"], "Positive", false, nil, false)
		self:TriggerEvent("BigWigs_StartBar", self, L["bar_soulwell"], timer.soulwell, icon.soulwell, true, color.soulwell)
		self:TriggerEvent("BigWigs_Sound", "BikeHorn")
		self:TriggerEvent("BigWigs_ShowWarningSign", icon.soulwell, 5)
	end
end
