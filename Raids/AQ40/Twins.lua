
local module, L = BigWigs:ModuleDeclaration("The Twin Emperors", "Ahn'Qiraj")

module.revision = 30067
local veklor = AceLibrary("Babble-Boss-2.2")["Emperor Vek'lor"]
local veknilash = AceLibrary("Babble-Boss-2.2")["Emperor Vek'nilash"]
local boss = AceLibrary("Babble-Boss-2.2")["The Twin Emperors"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs" .. boss)
module.enabletrigger = {veklor, veknilash}
module.toggleoptions = {"teleport", "enrage", "blizzard", "heal", "targeticon", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Twins",
    
    teleport_cmd = "teleport",
    teleport_name = "传送警报",
    teleport_desc = "传送出现时进行警告",
    
    enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒出现时进行警告",
    
    blizzard_cmd = "blizzard",
    blizzard_name = "暴风雪警报",
    blizzard_desc = "暴风雪出现时进行警告",

    heal_cmd = "heal",
    heal_name = "治疗警报",
    heal_desc = "双子治疗时进行警告",
    
    targeticon_cmd = "targeticon",
    targeticon_name = "双子目标团队标志",
    targeticon_desc = "给施法的双子目标标一个星星，给近战的双子目标标一个骷髅",
    
    
    trigger_tp = "gains Twin Teleport.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    bar_tpCd = "传送冷却",
    bar_tpOffCd = "传送准备...",
    msg_tpOffCd = "10秒内传送！",
    
    trigger_enrage = "Emperor Vek'nilash becomes enraged.",--??
    trigger_enrage2 = "Emperor Vek'lor becomes enraged.",--??
    bar_enrage = "激怒",
    msg_enrage60 = "60秒后激怒",
    msg_enrage10 = "10秒后激怒",
    msg_enrage = "双子激怒了",
    
    trigger_blizzard = "You are afflicted by Blizzard.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_blizzardFade = "Blizzard fades from you.",--CHAT_MSG_SPELL_AURA_GONE_SELF
    msg_blizzard = "远离暴风雪！",
    
    trigger_heal = "Heal Brother heals",--??
    msg_heal = "双子在治疗，快分开他们！",

    pull_trigger1 = "Ah, lambs to the slaughter.",
    pull_trigger2 = "Prepare to embrace oblivion!",
    pull_trigger3 = "Join me brother, there is blood to be shed.",
    pull_trigger4 = "To decorate our halls.",
    pull_trigger5 = "Let none survive!",
    pull_trigger6 = "It's too late to turn away.",
    pull_trigger7 = "Look brother, fresh blood.",
    pull_trigger8 = "Like a fly in a web.",
    pull_trigger9 = "Shall be your undoing!",
    pull_trigger10 = "Your brash arrogance",

    kill_trigger = "My brother...NO!",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-11
    cmd = "Twins",
    
    teleport_cmd = "teleport",
    teleport_name = "传送警报",
    teleport_desc = "传送出现时进行警告",
    
    enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒出现时进行警告",
    
    blizzard_cmd = "blizzard",
    blizzard_name = "暴风雪警报",
    blizzard_desc = "暴风雪出现时进行警告",

    heal_cmd = "heal",
    heal_name = "治疗警报",
    heal_desc = "双子治疗时进行警告",
    
    targeticon_cmd = "targeticon",
    targeticon_name = "双子目标团队标志",
    targeticon_desc = "给施法的双子目标标一个星星，给近战的双子目标标一个骷髅",
    
    
    trigger_tp = "gains Twin Teleport.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    bar_tpCd = "传送冷却",
    bar_tpOffCd = "传送准备...",
    msg_tpOffCd = "10秒内传送！",
    
    trigger_enrage = "Emperor Vek'nilash becomes enraged.",--??
    trigger_enrage2 = "Emperor Vek'lor becomes enraged.",--??
    bar_enrage = "激怒",
    msg_enrage60 = "60秒后激怒",
    msg_enrage10 = "10秒后激怒",
    msg_enrage = "双子激怒了",
    
    trigger_blizzard = "You are afflicted by Blizzard.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_blizzardFade = "Blizzard fades from you.",--CHAT_MSG_SPELL_AURA_GONE_SELF
    msg_blizzard = "远离暴风雪！",
    
    trigger_heal = "Heal Brother heals",--??
    msg_heal = "双子在治疗，快分开他们！",

    pull_trigger1 = "Ah, lambs to the slaughter.",
    pull_trigger2 = "Prepare to embrace oblivion!",
    pull_trigger3 = "Join me brother, there is blood to be shed.",
    pull_trigger4 = "To decorate our halls.",
    pull_trigger5 = "Let none survive!",
    pull_trigger6 = "It's too late to turn away.",
    pull_trigger7 = "Look brother, fresh blood.",
    pull_trigger8 = "Like a fly in a web.",
    pull_trigger9 = "Shall be your undoing!",
    pull_trigger10 = "Your brash arrogance",

    kill_trigger = "My brother...NO!",
} end )

local timer = {
	tpInterval = {30,40},
	tpReady = 10,
	enrage = 900,
	blizzard = 10,
}
local icon = {
	tp = "Spell_Arcane_Blink",
	enrage = "Spell_Shadow_UnholyFrenzy",
	blizzard = "Spell_Frost_IceStorm",
	heal = "spell_nature_healingwavegreater",
}
local color = {
	tpCd = "White",
	tpReady = "Cyan",
	enrage = "Black",
}
local syncName = {
	tp = "TwinsTeleport"..module.revision,
	enrage = "TwinsEnrage"..module.revision,
	heal = "TwinsHeal"..module.revision,
}

module:RegisterYellEngage(L["pull_trigger1"])
module:RegisterYellEngage(L["pull_trigger2"])
module:RegisterYellEngage(L["pull_trigger3"])
module:RegisterYellEngage(L["pull_trigger4"])
module:RegisterYellEngage(L["pull_trigger5"])
module:RegisterYellEngage(L["pull_trigger6"])
module:RegisterYellEngage(L["pull_trigger7"])
module:RegisterYellEngage(L["pull_trigger8"])
module:RegisterYellEngage(L["pull_trigger9"])
module:RegisterYellEngage(L["pull_trigger10"])

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL") --pull trigger, kill trigger
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_blizzard
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--trigger_blizzardFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")--trigger_tp
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "Event") --probably enrage


	self:ThrottleSync(28, syncName.tp)
	self:ThrottleSync(10, syncName.enrage)
	self:ThrottleSync(10, syncName.heal)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	self:Sync(syncName.tp)

	if self.db.profile.enrage then
		self:DelayedBar(timer.enrage - 60, L["bar_enrage"], 60, icon.enrage, true, color.enrage)
		self:DelayedMessage(timer.enrage - 60, L["msg_enrage60"], "Urgent", false, nil, false)
		self:DelayedMessage(timer.enrage - 10, L["msg_enrage10"], "Urgent", false, nil, false)
	end
	
	if self.db.profile.targetIcon then
		self:ScheduleRepeatingEvent("veklorTargetCheck", self.VeklorTarget, 0.5, self)
		self:ScheduleRepeatingEvent("veknilashTargetCheck", self.VeknilashTarget, 0.5, self)
	end
end

function module:OnDisengage()
	self:CancelScheduledEvent("veklorTargetCheck")
	self:CancelScheduledEvent("veknilashTargetCheck")
end

function module:CheckForBossDeath(msg)
	if msg == string.format(UNITDIESOTHER, veklor) or msg == string.format(UNITDIESOTHER, veknilash) then
		self:SendBossDeathSync()
	end
end

function module:VeklorTarget()
	if UnitName("target") ~= nil and UnitName("targettarget") ~= nil and (IsRaidLeader() or IsRaidOfficer()) then
		if UnitName("target") == veklor then
			SetRaidTarget("targettarget",1)
		end
	end
end

function module:VeknilashTarget()
	if UnitName("target") ~= nil and UnitName("targettarget") ~= nil and (IsRaidLeader() or IsRaidOfficer()) then
		if UnitName("target") == veknilash then
			SetRaidTarget("targettarget",8)
		end
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["kill_trigger"]) then
		self:SendBossDeathSync()
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_tp"]) then
		self:Sync(syncName.tp)
		
	elseif string.find(msg, L["trigger_enrage"]) or string.find(msg, L["trigger_enrage2"]) then
		self:Sync(syncName.enrage)
		
	elseif msg == L["trigger_blizzard"] and self.db.profile.blizzard then
		self:Blizzard()
	elseif msg == L["trigger_blizzardFade"] and self.db.profile.blizzard then
		self:BlizzardFade()
	
	elseif string.find(msg, L["trigger_heal"]) then
		self:Sync(syncName.heal)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.tp and self.db.profile.teleport then
		self:TP()
	elseif sync == syncName.enrage and self.db.profile.enrage then
		self:Enrage()
	elseif sync == syncName.heal and self.db.profile.heal then
		self:Heal()
	end
end


function module:TP()
	self:CancelDelayedBar(L["bar_tpOffCd"])
	self:CancelDelayedSound("One")
	self:CancelDelayedMessage(L["msg_tpOffCd"])
	self:CancelDelayedBar(L["bar_tpOffCd"])
	self:RemoveBar(L["bar_tpOffCd"])
	
	self:IntervalBar(L["bar_tpCd"], timer.tpInterval[1], timer.tpInterval[2], icon.tp, true, color.tpCd)
	
	self:DelayedSound(timer.tpInterval[1] - 10, "Ten")
	self:DelayedSound(timer.tpInterval[1] - 3, "Three")
	self:DelayedSound(timer.tpInterval[1] - 2, "Two")
	self:DelayedSound(timer.tpInterval[1] - 1, "One")
	self:DelayedMessage(timer.tpInterval[1] - 0.1, L["msg_tpOffCd"], "Attention", false, nil, false)

	self:DelayedBar(timer.tpInterval[1], L["bar_tpOffCd"], timer.tpReady, icon.tp, true, color.tpReady)
end

function module:Enrage()
	self:CancelDelayedBar(L["bar_enrage"])
	self:CancelDelayedMessage(L["msg_enrage60"])
	self:CancelDelayedMessage(L["msg_enrage10"])
	
	self:Message(L["msg_enrage"], "Important", false, nil, false)
	self:WarningSign(icon.enrage, 0.7)
	self:Sound("Beware")
end

function module:Blizzard()
	self:Message(L["msg_blizzard"], "Personal", false, nil, false)
	self:WarningSign(icon.blizzard, timer.blizzard)
	self:Sound("Info")
end

function module:BlizzardFade()
	self:RemoveWarningSign(icon.blizzard)
end

function module:Heal()
	self:Message(L["msg_heal"], "Important", false, nil, false)
	self:WarningSign(icon.heal, 2)
end
