local module, L = BigWigs:ModuleDeclaration("High Priestess Mar'li", "Zul'Gurub")
local BC = AceLibrary("Babble-Class-2.2")
local bbspawnofmarli = AceLibrary("Babble-Boss-2.2")["Spawn of Mar'li"]

module.revision = 30034
module.enabletrigger = module.translatedName
module.toggleoptions = {"webs", "charge", "drain", "phase", "spider", "volley", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Marli",

    webs_cmd = "webs",
    webs_name = "包围之网警报",
    webs_desc = "包围之网出现时进行警告",

    charge_cmd = "charge",
    charge_name = "冲锋警报",
    charge_desc = "冲锋出现时进行警告",

    drain_cmd = "drain",
    drain_name = "生命吸取警报",
    drain_desc = "生命吸取出现时进行警告",

    phase_cmd = "phase",
    phase_name = "阶段转换警报",
    phase_desc = "阶段转换出现时进行警告",

    spider_cmd = "spider",
    spider_name = "蜘蛛增援警报",
    spider_desc = "蜘蛛增援出现时进行警告",

    volley_cmd = "volley",
    volley_name = "毒箭齐射警报",
    volley_desc = "毒箭齐射出现时进行警告",


    trigger_engage = "Draw me to your web mistress Shadra. Unleash your venom!",--CHAT_MSG_MONSTER_YELL
    trigger_bossDead = "High Priestess Mar'li dies.",--CHAT_MSG_COMBAT_HOSTILE_DEATH
    --trigger_addDead = "Spawn of Mar'li dies.",--CHAT_MSG_COMBAT_HOSTILE_DEATH

    trigger_websOther = "(.+) is afflicted by Enveloping Webs.", --CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
    trigger_websYou = "You are afflicted by Enveloping Webs.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    bar_websCd = "包围之网冷却",

    trigger_charge = "High Priestess Mar'li's Charge",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_chargeCd = "冲锋冷却",

    --if registering CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE then will Warlock's...
    trigger_drainLifeOther = "(.+) is afflicted by Drain Life.",--CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_drainLifeYou = "You are afflicted by Drain Life.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_drainLifeFade = "Drain Life fades from (.+)",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_drainLife = "生命吸取",
    msg_drainLife = "生命吸取！打断/驱散！",

    trigger_spiderPhase = "Shadra, make of me your avatar!",--CHAT_MSG_MONSTER_YELL
    bar_spiderPhaseTimer = "蜘蛛阶段结束",

    --no trigger for Troll Phase
    bar_trollPhaseTimer = "巨魔阶段结束",

    --no trigger for adds spawn
    msg_addsDead = "/4 蜘蛛死亡",
    msg_spidersSpawn = "击败蜘蛛增援！",

    trigger_poisonVolley = "afflicted by Poison Bolt Volley.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    bar_poisonVolleyCd = "毒箭齐射冷却",
} end )

L:RegisterTranslations("zhCN", function() return {
    cmd = "Marli",

    webs_cmd = "webs",
    webs_name = "包围之网警报",
    webs_desc = "包围之网出现时进行警告",

    charge_cmd = "charge",
    charge_name = "冲锋警报",
    charge_desc = "冲锋出现时进行警告",

    drain_cmd = "drain",
    drain_name = "生命吸取警报",
    drain_desc = "生命吸取出现时进行警告",

    phase_cmd = "phase",
    phase_name = "阶段转换警报",
    phase_desc = "阶段转换出现时进行警告",

    spider_cmd = "spider",
    spider_name = "蜘蛛增援警报",
    spider_desc = "蜘蛛增援出现时进行警告",

    volley_cmd = "volley",
    volley_name = "毒箭齐射警报",
    volley_desc = "毒箭齐射出现时进行警告",


    trigger_engage = "Draw me to your web mistress Shadra. Unleash your venom!",--CHAT_MSG_MONSTER_YELL
    trigger_bossDead = "High Priestess Mar'li dies.",--CHAT_MSG_COMBAT_HOSTILE_DEATH
    --trigger_addDead = "Spawn of Mar'li dies.",--CHAT_MSG_COMBAT_HOSTILE_DEATH

    trigger_websOther = "(.+) is afflicted by Enveloping Webs.", --CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
    trigger_websYou = "You are afflicted by Enveloping Webs.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    bar_websCd = "包围之网冷却",

    trigger_charge = "High Priestess Mar'li's Charge",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_chargeCd = "冲锋冷却",

    --if registering CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE then will Warlock's...
    trigger_drainLifeOther = "(.+) is afflicted by Drain Life.",--CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_drainLifeYou = "You are afflicted by Drain Life.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_drainLifeFade = "Drain Life fades from (.+)",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_drainLife = "生命吸取",
    msg_drainLife = "生命吸取！打断/驱散！",

    trigger_spiderPhase = "Shadra, make of me your avatar!",--CHAT_MSG_MONSTER_YELL
    bar_spiderPhaseTimer = "蜘蛛阶段结束",

    --no trigger for Troll Phase
    bar_trollPhaseTimer = "巨魔阶段结束",

    --no trigger for adds spawn
    msg_addsDead = "/4 蜘蛛死亡",
    msg_spidersSpawn = "击败蜘蛛增援！",

    trigger_poisonVolley = "afflicted by Poison Bolt Volley.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    bar_poisonVolleyCd = "毒箭齐射冷却",
} end )

local timer = {
	websCd = {10,20},--saw 11,19 
	chargeCd = {10,20},--to be confirmed
	drainLife = 7,
	trollPhase = 35,--to be confirmed
	spiderPhase = 35,--to be confirmed
	poisonVolleyCd = {10,19},--saw 10,19
}
local icon = {
	webs = "Spell_Nature_EarthBind",
	charge = "ability_warrior_charge",
	drainLife = "spell_shadow_lifedrain02",
	trollPhase = "inv_misc_head_troll_02",
	spiderPhase = "inv_misc_monsterspidercarapace_01",
	spiderAdd = "inv_egg_04",
	poisonVolley = "spell_nature_corrosivebreath",
}
local color = {
	websCd = "Blue",
	chargeCd = "Red",
	drainLife = "Red",
	trollPhase = "White",
	spiderPhase = "White",
	poisonVolley = "Green",
}
local syncName = {
	webs = "MarliWebs"..module.revision,
	charge = "MarliCharge"..module.revision,
	drainStart = "MarliDrainStart"..module.revision,
	drainOver = "MarliDrainEnd"..module.revision,
	trollPhase = "MarliTrollPhase"..module.revision,
	spiderPhase = "MarliSpiderPhase"..module.revision,
	spidersSpawn = "MarliSpiders"..module.revision,
	poisonVolley = "MarliVolley"..module.revision,
}

local addsDead = 0

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")--trigger_engage, trigger_spiderSpawn
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_websYou, trigger_poisonVolley
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_websOther, trigger_poisonVolley
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_websOther, trigger_poisonVolley
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--trigger_charge
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--trigger_charge
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--trigger_charge
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--trigger_drainLifeFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--trigger_drainLifeFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--trigger_drainLifeFade
	
	self:ThrottleSync(3, syncName.webs)
	self:ThrottleSync(3, syncName.charge)
	self:ThrottleSync(5, syncName.drainStart)
	self:ThrottleSync(5, syncName.drainOver)
	self:ThrottleSync(5, syncName.trollPhase)
	self:ThrottleSync(5, syncName.spiderPhase)
	self:ThrottleSync(5, syncName.spidersSpawn)
	self:ThrottleSync(9, syncName.poisonVolley)
end

function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

function module:OnEngage()
	if self.db.profile.phase then
		self:TrollPhase()
	end
	if self.db.profile.volley then
		self:IntervalBar(L["bar_poisonVolleyCd"], timer.poisonVolleyCd[1], timer.poisonVolleyCd[2], icon.poisonVolley, true, color.poisonVolley)
	end
	
	addsDead = 0
	watchForSpawn = nil
end

function module:OnDisengage()
end

function module:CheckTarget()
	if UnitName("target") == bbspawnofmarli and not UnitIsDeadOrGhost("target") and UnitExists("target") then
		self:CancelScheduledEvent("bwmarliaddcheck")
		if (IsRaidLeader() or IsRaidOfficer()) then
			SetRaidTarget("target",8)
		end
		self:Sync(syncName.spidersSpawn)
	else
		for i = 1,GetNumRaidMembers() do
			if UnitName("Raid"..i.."target") == bbspawnofmarli and not UnitIsDeadOrGhost("Raid"..i.."target") and UnitExists("Raid"..i.."target") then
				self:CancelScheduledEvent("bwmarliaddcheck")
				if (IsRaidLeader() or IsRaidOfficer()) then
					SetRaidTarget("Raid"..i.."target",8)
				end
				self:Sync(syncName.spidersSpawn)
				break
			end
		end
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == L["trigger_bossDead"] then
		self:SendBossDeathSync()
	elseif msg == string.format(UNITDIESOTHER, "Spawn of Mar'li") then
		if addsDead < 4 then
			addsDead = addsDead + 1
			self:Message(addsDead..L["msg_addsDead"], "Positive", false, nil, false)
		else
			self:ScheduleRepeatingEvent("bwmarliaddcheck", self.CheckTarget, 0.5, self)
		end
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L["trigger_engage"] then
		module:SendEngageSync()

	elseif string.find(msg, L["trigger_spiderPhase"]) then
		self:Sync(syncName.spiderPhase)
	end
end

function module:Event(msg)
	if msg == L["trigger_websYou"] then
		self:Sync(syncName.webs)
	elseif string.find(msg, L["trigger_websOther"]) then
		self:Sync(syncName.webs)
	
	elseif string.find(msg, L["trigger_charge"]) then
		self:Sync(syncName.charge)
	
	elseif msg == L["trigger_drainLifeYou"] then
		self:Sync(syncName.drainStart)
	elseif string.find(msg, L["trigger_drainLifeOther"]) then
		self:Sync(syncName.drainStart)
	elseif string.find(msg, L["trigger_drainLifeFade"]) then
		self:Sync(syncName.drainOver)
	
	elseif string.find(msg, L["trigger_poisonVolley"]) then
		self:Sync(syncName.poisonVolley)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.webs and self.db.profile.webs then
		self:Webs()
	elseif sync == syncName.charge and self.db.profile.charge then
		self:Charge()
	elseif sync == syncName.drainStart and self.db.profile.drain then
		self:DrainStart()
	elseif sync == syncName.drainOver and self.db.profile.drain then
		self:DrainOver()
	elseif sync == syncName.spiderPhase and self.db.profile.phase then
		self:SpiderPhase()
	elseif sync == syncName.trollPhase and self.db.profile.phase then
		self:TrollPhase()
	elseif sync == syncName.spidersSpawn and self.db.profile.spider then
		self:SpidersSpawn()
	elseif sync == syncName.poisonVolley and self.db.profile.volley then
		self:PoisonVolley()
	end
end


function module:Webs()
	self:RemoveBar(L["bar_websCd"])
	self:IntervalBar(L["bar_websCd"], timer.websCd[1], timer.websCd[2], icon.webs, true, color.websCd)
	if UnitClass("Player") == BC["Paladin"] then
		self:WarningSign(icon.webs, 0.7)
		self:Sound("Info")
	end
end

function module:Charge()
	self:RemoveBar(L["bar_chargeCd"])
	self:IntervalBar(L["bar_chargeCd"], timer.chargeCd[1], timer.chargeCd[2], icon.charge, true, color.chargeCd)
end

function module:DrainStart()
	self:Bar(L["bar_drainLife"], timer.drainLife, icon.drainLife, true, color.drainLife)
	self:Message(L["msg_drainLife"], "Attention", false, nil, false)
	
	if UnitClass("Player") == BC["Rogue"] or UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Paladin"] or UnitClass("Player") == BC["Priest"] or UnitClass("Player") == BC["Shaman"] or UnitClass("Player") == BC["Mage"] then
		self:WarningSign(icon.drainLife, timer.drainLife)
		self:Sound("Beware")
	end
end

function module:DrainOver()
	self:RemoveBar(L["bar_drainLife"])
	self:RemoveWarningSign(icon.drainLife)
end

function module:SpiderPhase()
	self:RemoveBar(L["bar_drainLife"])
	self:RemoveBar(L["bar_poisonVolleyCd"])
	self:RemoveBar(L["bar_trollPhaseTimer"])
	
	self:Bar(L["bar_spiderPhaseTimer"], timer.spiderPhase, icon.spiderPhase, true, color.spiderPhase)
	self:ScheduleEvent("bwsendtrollphasesync", self.SendTrollPhaseSync, timer.spiderPhase, self)
end

function module:SendTrollPhaseSync()
	self:Sync(syncName.trollPhase)
end

function module:TrollPhase()
	self:CancelScheduledEvent("bwsendtrollphasesync")
	self:RemoveBar(L["bar_websCd"])
	self:RemoveBar(L["bar_chargeCd"])
	self:RemoveBar(L["bar_spiderPhaseTimer"])
	
	self:Bar(L["bar_trollPhaseTimer"], timer.trollPhase, icon.trollPhase, true, color.trollPhase)
end

function module:SpidersSpawn()
	self:CancelScheduledEvent("bwmarliaddcheck")
	self:Message(L["msg_spidersSpawn"], "Attention", false, nil, false)
	self:Sound("BikeHorn")
end

function module:PoisonVolley()
	self:IntervalBar(L["bar_poisonVolleyCd"], timer.poisonVolleyCd[1], timer.poisonVolleyCd[2], icon.poisonVolley, true, color.poisonVolley)
	if UnitClass("Player") == BC["Shaman"] then
		self:WarningSign(icon.poisonVolley, 0.7)
		self:Sound("Info")
	end
end
