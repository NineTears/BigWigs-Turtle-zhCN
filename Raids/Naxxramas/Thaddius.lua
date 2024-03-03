
local module, L = BigWigs:ModuleDeclaration("Thaddius", "Naxxramas")
local feugen = AceLibrary("Babble-Boss-2.2")["Feugen"]
local stalagg = AceLibrary("Babble-Boss-2.2")["Stalagg"]

module.revision = 30014
module.enabletrigger = {module.translatedName, feugen, stalagg}
module.toggleoptions = {"sounds", "bigicon", "enrage", "charge", "polarity", -1, "power", "magneticPull", "phase", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Thaddius",

    bigicon_cmd = "bigicon",
    bigicon_name = "大图标磁力吸引警报",
    bigicon_desc = "用大图标警告添加坦克为磁力吸引嘲讽",

    sounds_cmd = "sounds",
    sounds_name = "磁力吸引的声音警告",
    sounds_desc = "用声音警告添加坦克为磁力吸引嘲讽",
    
    enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒时进行警告",

    phase_cmd = "phase",
    phase_name = "阶段转换警报",
    phase_desc = "阶段转换时进行警告",

    polarity_cmd = "polarity",
    polarity_name = "极性转化警报",
    polarity_desc = "极性转化时进行警告",

    power_cmd = "power",
    power_name = "能量涌动警报",
    power_desc = "斯塔拉格的能量涌动时进行警告",

    adddeath_cmd = "adddeath",
    adddeath_name = "增援死亡警报",
    adddeath_desc = "增援死亡时进行警告",

    charge_cmd = "charge",
    charge_name = "电荷警报",
    charge_desc = "警告你自己的正/负电荷",

    magneticPull_cmd = "magneticPull",
    magneticPull_name = "磁力吸引警报",
    magneticPull_desc = "坦克平台交换时进行警告",
    
    feugen = "feugen",
    stalagg = "stalagg",
    
    start_trigger = "Stalagg crush you!", --CHAT_MSG_MONSTER_YELL
    start_trigger1 = "Feed you to master!", --CHAT_MSG_MONSTER_YELL
    
    enrage_trigger = "%s goes into a berserker rage!",--to confirm
    enrage_warn = "激怒！",
    enrage60sec_warn = "激怒在60秒内",
    enrage30sec_warn = "激怒在30秒内",
    enrage10sec_warn = "激怒在10秒内",
    enrage_bar = "激怒",
        
    trigger_feugenDead1 = "Feugen dies.", --CHAT_MSG_COMBAT_HOSTILE_DEATH ok
    trigger_feugenDead2 = "No... more... Feugen...",--CHAT_MSG_MONSTER_YELL cannot confirm if this exists, would be on feugen death
    trigger_stalaggDead1 = "Stalagg dies.", --CHAT_MSG_COMBAT_HOSTILE_DEATH ok
    trigger_stalaggDead2 = "Master save me...",--CHAT_MSG_MONSTER_YELL ok
    
    msg_phase2 = "第二阶段",
    bar_phase2 = "塔迪乌斯 活动中",
    polarityPosition_warn = "----- 塔迪乌斯 +++++",
    
    trigger_3sec = "%s overloads!",--CHAT_MSG_RAID_BOSS_EMOTE
    
    polarityShiftCast_trigger = "Thaddius begins to cast Polarity Shift", --?? CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    polarityShiftCast_warn = "极性转化即将到来！",
    polarityShiftCast_bar = "极性转化施法",
    polarityShiftCD_bar = "极性转化冷却",

    polarityShift_trigger = "Now YOU feel pain!", --CHAT_MSG_MONSTER_YELL
    
    nochange = "你的负面效果没有改变！",
    positivetype = "Interface\\Icons\\Spell_ChargePositive",
    poswarn = "你变成了正电荷！",
    negativetype = "Interface\\Icons\\Spell_ChargeNegative",
    negwarn = "你变成了负电荷！",
    polaritytickbar = "极性跳动",
    
    powerSurge_trigger = "Stalagg gains Power Surge.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    powerSurge_warn = "斯塔拉格获得能量涌动！",
    powerSurge_bar = "能量涌动",

    magneticPull_Bar = "磁力吸引",
    
    trigger_manaBurn = "Feugen's Static Field hits you for", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    trigger_manaBurn2 = "You absorb Feugen's Static Field.",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_manaBurn = "费尔根对你释放了法力燃烧！30码范围效果",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Thaddius",
	
	--bigicon_cmd = "bigicon",
	bigicon_name = "BigIcon Magnetic Pull Alert",
	bigicon_desc = "Warns adds tanks to taunt for Magnetic Pull with a BigIcon",
	
	--sounds_cmd = "sounds",
	sounds_name = "Sound Alert for Magnetic Pull",
	sounds_desc = "Warns adds tanks to taunt for Magnetic Pull with sound",
	
	--enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warn for Enrage",

	--phase_cmd = "phase",
	phase_name = "Phase Alerts",
	phase_desc = "Warn for Phase transitions",

	--polarity_cmd = "polarity",
	polarity_name = "Polarity Shift Alert",
	polarity_desc = "Warn for polarity shifts",

	--power_cmd = "power",
	power_name = "Power Surge Alert",
	power_desc = "Warn for Stalagg's power surge",

	--adddeath_cmd = "adddeath",
	adddeath_name = "Add Death Alert",
	adddeath_desc = "Alerts when an add dies.",

	--charge_cmd = "charge",
	charge_name = "Charge Alert",
	charge_desc = "Warn about Positive/Negative charge for yourself only.",

	--magneticPull_cmd = "magneticPull",
	magneticPull_name = "Magnetic Pull Alerts",
	magneticPull_desc = "Warn about tank platform swaps.",
	
	feugen = "Feugen",
	stalagg = "Stalagg",
	
	enrage_trigger = "%s goes into a berserker rage!",
	enrage_warn = "Enrage!",
	enrage60sec_warn = "Enrage in 60 seconds",
	enrage30sec_warn = "Enrage in 30 seconds",
	enrage10sec_warn = "Enrage in 10 seconds",
	enrage_bar = "Enrage",
	
	start_trigger = "Stalagg crush you!", --yell
	start_trigger1 = "Feed you to master!", --yell
	
	teslaOverload_trigger = "overloads!",
	
	phase2_trigger1 = "EAT YOUR BONES", --yell
	phase2_trigger2 = "BREAK YOU!", --yell
	phase2_trigger3 = "KILL!", --yell

	--stalaggDead_trigger = "Stalagg dies.", --"CHAT_MSG_COMBAT_HOSTILE_DEATH"
	adddeath2 = "Master save me...",
	--feugenDead_trigger = "Feugen dies.", --"CHAT_MSG_COMBAT_HOSTILE_DEATH"
	adddeath = "No... more... Feugen...",
	phase2_14sec_warn = "Thaddius in 14 seconds",
	
	powerSurge_trigger = "Stalagg gains Power Surge.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	powerSurge_warn = "Power Surge on Stalagg!",
	powerSurge_bar = "Power Surge",

	magneticPull_trigger = "casts Magnetic Pull", --?? CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	magneticPull_warn = "Magnetic Pull in 5 seconds!",
	magneticPull_Bar = "Magnetic Pull",
	
	phase2_trigger = "overloads!", --emote
	phase2_warn = "Phase 2, Thaddius in 4 seconds",
	phase2_bar = "Phase 2",
	
	polarityPosition_warn = "----- Thaddius +++++",
	polarityShift_trigger = "Now YOU feel pain!", --yell
	
	polarityShiftCast_trigger = "Thaddius begins to cast Polarity Shift", --?? CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	polarityShiftCast_warn = "Polarity Shift inc!",
	polarityShiftCast_bar = "Polarity Shift Cast",
	polarityShiftCD_bar = "Polarity Shift冷却",

	nochange = "Your debuff did not change!",
	positivetype = "Interface\\Icons\\Spell_ChargePositive",
	poswarn = "You changed to a Positive Charge!",
	negativetype = "Interface\\Icons\\Spell_ChargeNegative",
	negwarn = "You changed to a Negative Charge!",
	polaritytickbar = "Polarity tick",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-02-08
    cmd = "Thaddius",

    bigicon_cmd = "bigicon",
    bigicon_name = "大图标磁力吸引警报",
    bigicon_desc = "用大图标警告添加坦克为磁力吸引嘲讽",

    sounds_cmd = "sounds",
    sounds_name = "磁力吸引的声音警告",
    sounds_desc = "用声音警告添加坦克为磁力吸引嘲讽",
    
    enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒时进行警告",

    phase_cmd = "phase",
    phase_name = "阶段转换警报",
    phase_desc = "阶段转换时进行警告",

    polarity_cmd = "polarity",
    polarity_name = "极性转化警报",
    polarity_desc = "极性转化时进行警告",

    power_cmd = "power",
    power_name = "能量涌动警报",
    power_desc = "斯塔拉格的能量涌动时进行警告",

    adddeath_cmd = "adddeath",
    adddeath_name = "增援死亡警报",
    adddeath_desc = "增援死亡时进行警告",

    charge_cmd = "charge",
    charge_name = "电荷警报",
    charge_desc = "警告你自己的正/负电荷",

    magneticPull_cmd = "magneticPull",
    magneticPull_name = "磁力吸引警报",
    magneticPull_desc = "坦克平台交换时进行警告",
    
    feugen = "伏晨",
    stalagg = "斯塔拉格",
    
    start_trigger = "Stalagg crush you!", --CHAT_MSG_MONSTER_YELL
    start_trigger1 = "Feed you to master!", --CHAT_MSG_MONSTER_YELL
    
    enrage_trigger = "%s goes into a berserker rage!",--to confirm
    enrage_warn = "激怒！",
    enrage60sec_warn = "激怒在60秒内",
    enrage30sec_warn = "激怒在30秒内",
    enrage10sec_warn = "激怒在10秒内",
    enrage_bar = "激怒",
        
    trigger_feugenDead1 = "Feugen dies.", --CHAT_MSG_COMBAT_HOSTILE_DEATH ok
    trigger_feugenDead2 = "No... more... Feugen...",--CHAT_MSG_MONSTER_YELL cannot confirm if this exists, would be on feugen death
    trigger_stalaggDead1 = "Stalagg dies.", --CHAT_MSG_COMBAT_HOSTILE_DEATH ok
    trigger_stalaggDead2 = "Master save me...",--CHAT_MSG_MONSTER_YELL ok
    
    msg_phase2 = "第二阶段",
    bar_phase2 = "塔迪乌斯 活动中",
    polarityPosition_warn = "----- 塔迪乌斯 +++++",
    
    trigger_3sec = "%s overloads!",--CHAT_MSG_RAID_BOSS_EMOTE
    
    polarityShiftCast_trigger = "Thaddius begins to cast Polarity Shift", --?? CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    polarityShiftCast_warn = "极性转化即将到来！",
    polarityShiftCast_bar = "极性转化施法",
    polarityShiftCD_bar = "极性转化冷却",

    polarityShift_trigger = "Now YOU feel pain!", --CHAT_MSG_MONSTER_YELL
    
    nochange = "你的负面效果没有改变！",
    positivetype = "Interface\\Icons\\Spell_ChargePositive",
    poswarn = "你变成了正电荷！",
    negativetype = "Interface\\Icons\\Spell_ChargeNegative",
    negwarn = "你变成了负电荷！",
    polaritytickbar = "极性跳动",
    
    powerSurge_trigger = "Stalagg gains Power Surge.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    powerSurge_warn = "斯塔拉格获得能量涌动！",
    powerSurge_bar = "能量涌动",

    magneticPull_Bar = "磁力吸引",
    
    trigger_manaBurn = "Feugen's Static Field hits you for", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    trigger_manaBurn2 = "You absorb Feugen's Static Field.",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_manaBurn = "费尔根对你释放了法力燃烧！30码范围效果",
} end )

local timer = {
	enrage = 300,
	phase2 = 14,
	
	powerSurge = 10,
	--firstMagneticPull = 23.5,
	magneticPull = 20.5,
	
	firstPolarity = {11.6,14.2},--11.6, 14.2
	polarityShiftCD = 30,--{25,35},
	polarityShiftCast = 3,
	polarityTick = 6,
}
local icon = {
	powerSurge = "Spell_Shadow_UnholyFrenzy",
	magneticPull = "spell_nature_groundingtotem",
	enrage = "Spell_Shadow_UnholyFrenzy",
	polarityShift = "Spell_Nature_Lightning",
	positive = "Spell_ChargePositive",
	negative = "Spell_ChargeNegative",
	taunt = "spell_nature_reincarnation",
	phase2 = "Inv_misc_pocketwatch_01",
	manaBurn = "Spell_Shadow_ManaBurn",
}
local syncName = {
	enrage = "ThaddiusEnrage"..module.revision,
	feugenDeath = "ThaddiusFeugenDeath"..module.revision,
	stalaggDeath = "ThaddiusStalaggDeath"..module.revision,
	addsDead = "ThaddiusAddsDead"..module.revision,
	teslaOverload = "ThaddiusTeslaOverload"..module.revision,
	
	polarityShiftCast = "ThaddiusPolarityShiftCast"..module.revision,
	polarity = "ThaddiusPolarity"..module.revision,
	
	powerSurge = "StalaggPower"..module.revision,
	magneticPull = "ThaddiusMagneticPull"..module.revision,
}

local phase2started = nil
local stalaggDead = nil
local feugenDead = nil
local bothDead = nil
local _, playerClass = UnitClass("player")

module:RegisterYellEngage(L["start_trigger"])
module:RegisterYellEngage(L["start_trigger1"])

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "Event")--Stalagg & Feugen Death
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL", "Event")--Stalagg & Feugen Death, polarity shift done casting
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "Event")--p2 in 3 seconds
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")-- begins casting polarity shift
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")-- manaBurn
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")--powerSurge
	
	self:ThrottleSync(4, syncName.powerSurge)
	
	self:ThrottleSync(20, syncName.feugenDeath)
	self:ThrottleSync(20, syncName.stalaggDeath)
	self:ThrottleSync(20, syncName.addsDead)
	self:ThrottleSync(5, syncName.teslaOverload)
	
	self:ThrottleSync(10, syncName.enrage)
	self:ThrottleSync(10, syncName.polarityShiftCast)
	self:ThrottleSync(10, syncName.polarity)
end

function module:OnSetup()
	phase2started = nil
	
	self.started = nil
	self.previousCharge = ""
	
	stalaggDead = false
	feugenDead = false
	bothDead = false
	
	self.feugenHP = 100
	self.stalaggHP = 100
end

function module:OnEngage()
	phase2started = false
	
	self.previousCharge = ""
	
	stalaggDead = false
	feugenDead = false
	bothDead = false
	
	self.feugenHP = 100
	self.stalaggHP = 100
	self:TriggerEvent("BigWigs_StartHPBar", self, L["feugen"], 100)
	self:TriggerEvent("BigWigs_SetHPBar", self, L["feugen"], 0)
	self:TriggerEvent("BigWigs_StartHPBar", self, L["stalagg"], 100)
	self:TriggerEvent("BigWigs_SetHPBar", self, L["stalagg"], 0)
	self:ScheduleRepeatingEvent("bwThaddiusAddCheck", self.CheckAddHP, 0.5, self)
	if self.db.profile.magneticPull then
		self:Bar(L["magneticPull_Bar"], timer.magneticPull, icon.magneticPull, true, "blue")
		self:ScheduleRepeatingEvent("bwThaddiusMagneticPull", self.MagneticPull, timer.magneticPull, self)
	end
end

function module:OnDisengage()
end

function module:CheckAddHP()
	local feugenHealth
	local stalaggHealth
	if UnitName("playertarget") == L["feugen"] then
		feugenHealth = math.ceil((UnitHealth("playertarget") / UnitHealthMax("playertarget")) * 100)
	elseif UnitName("playertarget") == L["stalagg"] then
		stalaggHealth = math.ceil((UnitHealth("playertarget") / UnitHealthMax("playertarget")) * 100)
	end
	for i = 1, GetNumRaidMembers(), 1 do
		if UnitName("Raid"..i.."target") == L["feugen"] then
			feugenHealth = math.ceil((UnitHealth("Raid"..i.."target") / UnitHealthMax("Raid"..i.."target")) * 100)
		elseif UnitName("Raid"..i.."target") == L["stalagg"] then
			stalaggHealth = math.ceil((UnitHealth("Raid"..i.."target") / UnitHealthMax("Raid"..i.."target")) * 100)
		end
		if feugenHealth and stalaggHealth then break; end
	end
	if feugenHealth then
		self.feugenHP = feugenHealth
		self:TriggerEvent("BigWigs_SetHPBar", self, L["feugen"], 100-self.feugenHP)
	end
	if stalaggHealth then
		self.stalaggHP = stalaggHealth
		self:TriggerEvent("BigWigs_SetHPBar", self, L["stalagg"], 100-self.stalaggHP)
	end
end

function module:Event(msg)
	if string.find(msg, L["enrage_trigger"]) then
		self:Sync(syncName.enrage)
	elseif msg == L["trigger_feugenDead1"] or msg == L["trigger_feugenDead2"] then
		self:Sync(syncName.feugenDeath)
	elseif msg == L["trigger_stalaggDead1"] or msg == L["trigger_stalaggDead2"] then
		self:Sync(syncName.stalaggDeath)
	elseif msg == L["trigger_3sec"] then
		self:Sync(syncName.teslaOverload)
	elseif string.find(msg, L["polarityShiftCast_trigger"]) then
		self:Sync(syncName.polarityShiftCast)
	elseif string.find(msg, L["polarityShift_trigger"]) then
		self:Sync(syncName.polarity)
	elseif string.find(msg, L["powerSurge_trigger"]) then
		self:Sync(syncName.powerSurge)
	elseif string.find(msg, L["trigger_manaBurn"]) or string.find(msg, L["trigger_manaBurn2"]) then
		self:WarningSign(icon.manaBurn, 0.7)
		self:Message(L["msg_manaBurn"], "Urgent", true, "Beware")
	end
end




function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.enrage and self.db.profile.enrage then
		self:Enrage()
		
	elseif sync == syncName.feugenDeath then
		self:FeugenDeath()
	elseif sync == syncName.stalaggDeath then
		self:StalaggDeath()
	elseif sync == syncName.addsDead and self.db.profile.phase then
		self:AddsDead()
	elseif sync == syncName.teslaOverload and self.db.profile.phase then
		self:ThreeSec()
		
	elseif sync == syncName.polarity and self.db.profile.polarity then
		self:PolarityShift()
	elseif sync == syncName.polarityShiftCast and self.db.profile.polarity then
		self:PolarityShiftCast()
	
	
	elseif sync == syncName.powerSurge and self.db.profile.power then
		self:PowerSurge()
	end
end




function module:Enrage()
	self:RemoveBar(L["enrage_bar"])
	self:CancelDelayedMessage(L["enrage60sec_warn"])
	self:CancelDelayedMessage(L["enrage30sec_warn"])
	self:CancelDelayedMessage(L["enrage10sec_warn"])
	
	self:Message(L["enrage_warn"], "Important")
	self:WarningSign(icon.enrage, 0.7)
end

function module:FeugenDeath()
	feugenDead = true
	if stalaggDead == true then
		self:Sync(syncName.addsDead)
	end
end

function module:StalaggDeath()
	stalaggDead = true
	if feugenDead == true then
		self:Sync(syncName.addsDead)
	end
end

function module:AddsDead()
	phase2started = true
	
	--if StopHPBar does not work, do this
		--self:RemoveBar(L["feugen"])
		--self:RemoveBar(L["stalagg"])
	self:TriggerEvent("BigWigs_StopHPBar", self, L["feugen"])
	self:TriggerEvent("BigWigs_StopHPBar", self, L["stalagg"])
	self:CancelScheduledEvent("bwThaddiusAddCheck")
	self:CancelScheduledEvent("bwThaddiusMagneticPull")
	self:RemoveBar(L["magneticPull_Bar"])
	self:RemoveBar(L["powerSurge_bar"])
	self:CancelDelayedWarningSign(icon.taunt)
	self:CancelDelayedSound("Info")
	
	self:Bar(L["bar_phase2"], timer.phase2, icon.phase2, true, "black")
	self:Message(L["polarityPosition_warn"], nil, nil)
end

function module:ThreeSec()
	if phase2started == true then
		self:RemoveBar(L["bar_phase2"])
		self:Bar(L["bar_phase2"], 3, icon.phase2, true, "black")
		self:Message(L["polarityPosition_warn"], nil, nil)
		
		if self.db.profile.enrage then
			self:DelayedBar(3, L["enrage_bar"], timer.enrage, icon.enrage, true, "white")
			self:DelayedMessage(timer.enrage - 60, L["enrage60sec_warn"], "Urgent")
			self:DelayedMessage(timer.enrage - 30, L["enrage30sec_warn"], "Important")
			self:DelayedMessage(timer.enrage - 10, L["enrage10sec_warn"], "Important")
		end
		
		if self.db.profile.polarity then
			self:DelayedIntervalBar(3, L["polarityShiftCD_bar"], timer.firstPolarity[1], timer.firstPolarity[2], icon.polarityShift, true, "green")
		end
	end
end

function module:PolarityShiftCast()
	self:RemoveBar(L["polarityShiftCD_bar"])
	self:Message(L["polarityShiftCast_warn"], "Important")
	self:Bar(L["polarityShiftCast_bar"], timer.polarityShiftCast, icon.polarityShift, true, "green")
end

function module:PolarityShift()
	self:RegisterEvent("PLAYER_AURAS_CHANGED")
	self:Bar(L["polarityShiftCD_bar"], timer.polarityShiftCD, icon.polarityShift, true, "green")
end

function module:PLAYER_AURAS_CHANGED(msg)
	local chargetype = nil
	local iIterator = 1
	while UnitDebuff("player", iIterator) do
		local texture, applications = UnitDebuff("player", iIterator)
		if texture == L["positivetype"] or texture == L["negativetype"] then
			if applications > 1 then
				return
			end
			chargetype = texture
		end
		iIterator = iIterator + 1
	end
	if not chargetype then return end
	self:UnregisterEvent("PLAYER_AURAS_CHANGED")
	if self.db.profile.charge then
		self:NewPolarity(chargetype)
	end
end

function module:NewPolarity(chargetype)
	if self.previousCharge and self.previousCharge == chargetype then
		self:Message(L["nochange"], "Urgent", true, "Long")
	elseif chargetype == L["positivetype"] then
		self:Message(L["poswarn"], "Positive", true, "RunAway")
		self:Bar(L["polaritytickbar"], timer.polarityTick, icon.positive, true, "blue")
		self:WarningSign(icon.positive, 5)
	elseif chargetype == L["negativetype"] then
		self:Message(L["negwarn"], "Important", true, "RunAway")
		self:Bar(L["polaritytickbar"], timer.polarityTick, icon.negative, true, "red")
		self:WarningSign(icon.negative, 5)
	end
		
	self.previousCharge = chargetype
end

function module:PowerSurge()
	self:Message(L["powerSurge_warn"], "Important")
	self:Bar(L["powerSurge_bar"], timer.powerSurge, icon.powerSurge, true, "red")
end

function module:MagneticPull()
	self:WarningSign(icon.magneticPull, 0.7)
	self:Bar(L["magneticPull_Bar"], timer.magneticPull, icon.magneticPull, true, "blue")
end