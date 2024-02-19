
local module, L = BigWigs:ModuleDeclaration("Baron Geddon", "Molten Core")

module.revision = 30044
module.enabletrigger = module.translatedName
module.toggleoptions = {"bomb", "inferno", "service", "ignite", "icon", "bosskill"}
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Molten Core"],
	AceLibrary("Babble-Zone-2.2")["Molten Core"],
}

L:RegisterTranslations("enUS", function() return {
    cmd = "Baron",
    
    bomb_cmd = "bomb",
    bomb_name = "活体炸弹警报",
    bomb_desc = "警告玩家成为活体炸弹时",
    
    inferno_cmd = "inferno",
    inferno_name = "地狱火警报",
    inferno_desc = "迦顿男爵的地狱火的计时条。",
    
    service_cmd = "service",
    service_name = "最后的仪式警告",
    service_desc = "迦顿男爵的最后的仪式的计时条。",
    
    ignite_cmd = "ignite",
    ignite_name = "点燃法力警报",
    ignite_desc = "显示点燃法力的计时器，并通报驱散它",
    
    icon_cmd = "icon",
    icon_name = "团队标志标记炸弹人",
    icon_desc = "在被活体炸弹标记的人身上放置团队标志。（需要助理或更高权限）",
   
    
    trigger_bomb = "(.+) is afflicted by Living Bomb.",
    trigger_bombYou = "You are afflicted by Living Bomb.",
    trigger_bombFade = "Living Bomb fades from (.+).",
    bar_bomb = " 炸弹！",
    msg_bomb = " 是炸弹！",
    
    trigger_inferno = "Baron Geddon gains Inferno.",
    trigger_infernoFade = "Inferno fades from Baron Geddon.",--to be confirmed, check CLEU
    trigger_infernoYou = "You suffer (.+) Fire damage from Baron Geddon's Inferno.",--to be confirmed, check CLEU
    bar_infernoChannel = "地狱火",
    bar_infernoCd = "下一次地狱火",
    
    trigger_service = "performs one last service for Ragnaros",
    bar_service = "世界末日！",
    msg_service = "最后的仪式！迦顿男爵将在8秒后爆炸！",
    
    trigger_ignite = "afflicted by Ignite Mana",
    trigger_ignite2 = "Ignite Mana was resisted",
    bar_igniteCd = "点燃法力 CD",
    msg_ignite = "现在就驱散法力！",
} end)

L:RegisterTranslations("zhCN", function() return {
    cmd = "Baron",
    
    bomb_cmd = "bomb",
    bomb_name = "活体炸弹警报",
    bomb_desc = "警告玩家成为活体炸弹时",
    
    inferno_cmd = "inferno",
    inferno_name = "地狱火警报",
    inferno_desc = "迦顿男爵的地狱火的计时条。",
    
    service_cmd = "service",
    service_name = "最后的仪式警告",
    service_desc = "迦顿男爵的最后的仪式的计时条。",
    
    ignite_cmd = "ignite",
    ignite_name = "点燃法力警报",
    ignite_desc = "显示点燃法力的计时器，并通报驱散它",
    
    icon_cmd = "icon",
    icon_name = "团队标志标记炸弹人",
    icon_desc = "在被活体炸弹标记的人身上放置团队标志。（需要助理或更高权限）",
   
    
    trigger_bomb = "(.+) is afflicted by Living Bomb.",
    trigger_bombYou = "You are afflicted by Living Bomb.",
    trigger_bombFade = "Living Bomb fades from (.+).",
    bar_bomb = " 炸弹！",
    msg_bomb = " 是炸弹！",
    
    trigger_inferno = "Baron Geddon gains Inferno.",
    trigger_infernoFade = "Inferno fades from Baron Geddon.",--to be confirmed, check CLEU
    trigger_infernoYou = "You suffer (.+) Fire damage from Baron Geddon's Inferno.",--to be confirmed, check CLEU
    bar_infernoChannel = "地狱火",
    bar_infernoCd = "下一次地狱火",
    
    trigger_service = "performs one last service for Ragnaros",
    bar_service = "世界末日！",
    msg_service = "最后的仪式！迦顿男爵将在8秒后爆炸！",
    
    trigger_ignite = "afflicted by Ignite Mana",
    trigger_ignite2 = "Ignite Mana was resisted",
    bar_igniteCd = "点燃法力 CD",
    msg_ignite = "现在就驱散法力！",
} end)

local timer = {
	bomb = 8,
	
	infernoChannel = 8,
	firstInfernoCd = {18,24},
	infernoCd = {10,16},
	
	service = 8,
	
	firstIgniteCd = {10,15},
	igniteCd = {20,30},
}
local icon = {
	bomb = "Inv_Enchant_EssenceAstralSmall",
	bombBigIcon = "Spell_Shadow_MindBomb",
	inferno = "Spell_Fire_Incinerate",
	service = "Spell_Fire_SelfDestruct",
	ignite = "Spell_Fire_Incinerate",
}
local color = {
	bomb = "Cyan",
	infernoChannel = "Red",
	infernoCd = "Black",
	service = "White",
	ignite = "Blue",
}
local syncName = {
	bomb = "GeddonBomb"..module.revision,
	bombFade = "GeddonBombStop"..module.revision,
	inferno = "GeddonInferno"..module.revision,
	infernoFade = "GeddonInfernoFade"..module.revision,
	service = "GeddonService"..module.revision,
	ignite = "Geddonignite"..module.revision,
}

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

	self:ThrottleSync(5, syncName.bomb)
	self:ThrottleSync(3, syncName.bombFade)
	self:ThrottleSync(5, syncName.inferno)
	self:ThrottleSync(5, syncName.infernoFade)
	self:ThrottleSync(4, syncName.service)
	self:ThrottleSync(4, syncName.ignite)
	
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	if self.db.profile.inferno then
		self:IntervalBar(L["bar_infernoCd"], timer.firstInfernoCd[1], timer.firstInfernoCd[2], icon.inferno, true, color.infernoCd)
	end
	
	if self.db.profile.ignite then
		self:IntervalBar(L["bar_igniteCd"], timer.firstIgniteCd[1], timer.firstIgniteCd[2], icon.ignite, true, color.ignite)
	end
end

function module:OnDisengage()
end

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if string.find(msg, L["trigger_service"]) then
		self:Sync(syncName.service)
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_bomb"]) then
		local _,_, bombPlayer,_ = string.find(msg, L["trigger_bomb"])
		self:Sync(syncName.bomb .. " " .. bombPlayer)
	
	elseif msg == L["trigger_bombYou"] then
		self:Sync(syncName.bomb .. " " .. UnitName("Player"))
		
	elseif string.find(msg, L["trigger_bombFade"]) then
		local _,_, bombFadePlayer,_ = string.find(msg, L["trigger_bombFade"])
		if bombFadePlayer == "you" then bombFadePlayer = UnitName("Player") end
		self:Sync(syncName.bombFade .. " " .. bombFadePlayer)
		
		
	elseif msg == L["trigger_inferno"] then
		self:Sync(syncName.inferno)
	elseif msg == L["trigger_infernoFade"] then
		self:Sync(syncName.infernoFade)
	elseif string.find(msg, L["trigger_infernoYou"]) then
		self:InfernoYou()
		
	elseif string.find(msg, L["trigger_ignite"]) or string.find(msg, L["trigger_ignite2"]) then
		self:Sync(syncName.ignite)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.bomb and rest and self.db.profile.bomb then
		self:Bomb(rest)
	elseif sync == syncName.bombFade and rest and self.db.profile.bomb then
		self:BombFade(rest)
	elseif sync == syncName.inferno and self.db.profile.inferno then
		self:Inferno()
	elseif sync == syncName.infernoFade and self.db.profile.inferno then
		self:InfernoFade()
	elseif sync == syncName.service and self.db.profile.service then
		self:Service()
	elseif sync == syncName.ignite and self.db.profile.ignite then
		self:Ignite()
	end
end


function module:Bomb(rest)
	self:Bar(rest..L["bar_bomb"], timer.bomb, icon.bomb, true, color.bomb)
	self:Message(rest..L["msg_bomb"], "Urgent", false, nil, false)
	
	if rest == UnitName("Player") then
		SendChatMessage(UnitName("player").." is the Bomb!","SAY")
		self:WarningSign(icon.bombBigIcon, timer.bomb)
		self:Sound("RunAway")
	end
	
	if IsRaidLeader() or IsRaidOfficer() then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 8)
			end
		end
	end
end

function module:BombFade(rest)
	self:RemoveBar(rest..L["bar_bomb"])
	
	if IsRaidLeader() or IsRaidOfficer() then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 0)
			end
		end
	end
end

function module:Inferno()
	self:RemoveBar(L["bar_infernoCd"])
	
	self:Bar(L["bar_infernoChannel"], timer.infernoChannel, icon.inferno, true, color.infernoChannel)
	self:DelayedIntervalBar(timer.infernoChannel, L["bar_infernoCd"], timer.infernoCd[1], timer.infernoCd[2], icon.inferno, true, color.infernoCd)
end

function module:InfernoFade()
	self:RemoveBar(L["bar_infernoChannel"])
	self:IntervalBar(L["bar_infernoCd"], timer.firstInfernoCd[1], timer.firstInfernoCd[2], icon.inferno, true, color.infernoCd)
end

function module:InfernoYou()
	local doWarn = false
	
	
	if UnitName("Target") == nil then
		doWarn = true
	elseif UnitName("Target") ~= nil and UnitName("TargetTarget") == nil then
		doWarn = true
	
	--don't do it if you're the tank
	elseif UnitName("Target") == "Baron Geddon" and UnitName("TargetTarget") == UnitName("Player") then
		doWarn = false
		return
	end
	
	
	if doWarn == true then
		--don't do it if you're the bomb
		for i = 1, 10 do local icon, count = UnitDebuff("Player", i)
			if icon and icon == "Interface\\Icons\\Inv_Enchant_EssenceAstralSmall" then
				doWarn = false
				return
			end
		end
	end
	
	
	if doWarn == true then
		--icon + sound if taking damage from ignite
		self:WarningSign(icon.ignite, 0.7)
		self:Sound("Info")
	end
	
end

function module:Service()
	self:Bar(L["bar_service"], timer.service, icon.service, true, color.service)
	self:Message(L["msg_service"], "Important", false, nil, false)
	
	self:CancelDelayedBar(L["bar_infernoCd"])
	self:RemoveBar(L["bar_infernoCd"])
	self:RemoveBar(L["bar_infernoChannel"])
	self:RemoveBar(L["bar_igniteCd"])
end

function module:Ignite()
	self:IntervalBar(L["bar_igniteCd"], timer.igniteCd[1], timer.igniteCd[2], icon.ignite, true, color.ignite)

	if UnitClass("Player") == "Paladin" or UnitClass("Player") == "Priest" then
		self:WarningSign(icon.ignite, 0.7)
		self:Sound("Info")
		self:Message(L["msg_ignite"], "Personal", false, nil, false)
	end
end
