
local module, L = BigWigs:ModuleDeclaration("The Prophet Skeram", "Ahn'Qiraj")

module.revision = 30027
module.enabletrigger = module.translatedName
module.toggleoptions = {"mc", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Skeram",

    mc_cmd = "mc",
    mc_name = "精神控制警报",
    mc_desc = "精神控制出现时进行警告",

    split_cmd = "split",
    split_name = "分裂警报",
    split_desc = "分裂前进行警告",
    
    trigger_mcYou = "You are afflicted by True Fulfillment.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE (unconfirmed)
    trigger_mcOther = "(.+) is afflicted by True Fulfillment.",--CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
    msg_mc = " 被精神控制",
    bar_mc = " 精神控制",
    
    trigger_kill = "You only delay... the inevetable.",--CHAT_MSG_MONSTER_YELL

    splitsoon_message = "即将分裂！准备好！",
    split_message = "分裂！",
    kill_trigger = "You only delay",
    
    ["You have slain %s!"] = true,
    ["You have slain %s!"] = "你已经击败了%s！",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-02-08
    cmd = "Skeram",

    mc_cmd = "mc",
    mc_name = "精神控制警报",
    mc_desc = "精神控制出现时进行警告",

    split_cmd = "split",
    split_name = "分裂警报",
    split_desc = "分裂前进行警告",
    
    trigger_mcYou = "You are afflicted by True Fulfillment.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE (unconfirmed)
    trigger_mcOther = "(.+) is afflicted by True Fulfillment.",--CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
    msg_mc = " 被精神控制",
    bar_mc = " 精神控制",
    
    trigger_kill = "You only delay... the inevetable.",--CHAT_MSG_MONSTER_YELL

    splitsoon_message = "即将分裂！准备好！",
    split_message = "分裂！",
    kill_trigger = "You only delay",
    
    ["You have slain %s!"] = "你已经击败了%s！",
} end )

local timer = {
	mc = 20,
}
local icon = {
	mc = "Spell_Shadow_Charm",
}
local syncName = {
	mc = "SkeramMC"..module.revision,
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")--trigger_kill
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--mcYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Event")--mcOther

	self:ThrottleSync(1, syncName.mc)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:CheckForWipe()
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

function module:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["kill_trigger"]) then
		self:SendBossDeathSync()
		--BigWigs:Debug("yell kill trigger")
	end
end

function module:Event(msg)
	if UnitName("target") ~= nil and (IsRaidLeader() or IsRaidOfficer()) then
		if UnitName("target") == "The Prophet Skeram" then
			if UnitHealthMax("target") > 350000 then
				SetRaidTarget("target",6)
			end
		end
	end
	
	if msg == L["trigger_mcYou"] then
		self:Sync(syncName.mc .. " " .. UnitName("player"))
	elseif string.find(msg, L["trigger_mcOther"]) then
		local _,_, mcPerson, _ = string.find(msg, L["trigger_mcOther"])
		self:Sync(syncName.mc .. " " .. mcPerson)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.mc and rest and self.db.profile.mc then
		self:MC(rest)
	end
end

function module:MC(rest)
	for i=1,GetNumRaidMembers() do
		if UnitName("raid"..i) == rest then
			SetRaidTarget("raid"..i, 4)
		end
	end
	
	self:Bar(rest..L["bar_mc"].. " >Click Me<", timer.mc, icon.mc, true, "White")
	self:SetCandyBarOnClick("BigWigsBar "..rest..L["bar_mc"].. " >Click Me<", function(name, button, extra) TargetByName(extra, true) end, rest)
	self:Message(rest..L["msg_mc"], "Attention", false, nil, false)
end
