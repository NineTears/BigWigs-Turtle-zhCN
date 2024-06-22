
local module, L = BigWigs:ModuleDeclaration("The Four Horsemen", "Naxxramas")
local thane = AceLibrary("Babble-Boss-2.2")["Thane Korth'azz"]
local mograine = AceLibrary("Babble-Boss-2.2")["Highlord Mograine"]
local zeliek = AceLibrary("Babble-Boss-2.2")["Sir Zeliek"]
local blaumeux = AceLibrary("Babble-Boss-2.2")["Lady Blaumeux"]
local BC = AceLibrary("Babble-Class-2.2")
local bsimprovedsealofjustice = AceLibrary("Babble-Spell-2.2")["Improved Seal of Justice"]
local bsdefiance = AceLibrary("Babble-Spell-2.2")["Defiance"]
local bsferalinstinct = AceLibrary("Babble-Spell-2.2")["Feral Instinct"]

module.revision = 30066
module.enabletrigger = {"库尔塔兹领主", "大领主莫格莱尼", "札里克爵士", "女公爵布洛莫斯"}
module.toggleoptions = {"mark", "shieldwall", -1, "meteor", "void", "wrath", -1, "taunt", "tankswarn", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Horsemen",

    mark_cmd = "mark",
    mark_name = "印记警报",
    mark_desc = "印记出现时进行警告",
    
    meteor_cmd = "meteor",
    meteor_name = "流星警报",
    meteor_desc = "库尔塔兹领主施放流星时进行警告。",
    
    wrath_cmd = "wrath",
    wrath_name = "神圣之怒警报",
    wrath_desc = "札里克爵士施放神圣之怒时进行警告。",
    
    void_cmd = "void",
    void_name = "虚空领域警报",
    void_desc = "女公爵布洛莫斯施放虚空领域时进行警告。",
    
    shieldwall_cmd = "shieldwall",
    shieldwall_name = "盾墙警报",
    shieldwall_desc = "盾墙出现时进行警告",
    
    taunt_cmd = "taunt",
    taunt_name = "嘲讽抵抗/成功警报",
    taunt_desc = "嘲讽抵抗和嘲讽成功时进行警告",
    
    tankswarn_cmd = "tankswarn",
    tankswarn_name = "嘲讽抵抗警报",
    tankswarn_desc = "嘲讽抵抗时进行警告",
	
	
    bar_markCount = "印记 ",
    msg_markCount = "印记 ",
    trigger_markZeliek = "afflicted by Mark of Zeliek",
    trigger_markKorthAzz = "afflicted by Mark of Korth'azz",
    trigger_markBlaumeux = "afflicted by Mark of Blaumeux",
    trigger_markMograine = "afflicted by Mark of Mograine",
    
    trigger_markZeliekFade = "Mark of Zeliek fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    trigger_markKorthAzzFade = "Mark of Korth'azz fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    trigger_markBlaumeuxFade = "Mark of Blaumeux fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    trigger_markMograineFade = "Mark of Mograine fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    msg_zeliekTankReady = "准备好对札里克爵士进行坦克",
    msg_korthAzzTankReady = "准备好对库尔塔兹领主进行坦克",
    msg_blaumeuxTankReady = "准备好对女公爵布洛莫斯进行坦克",
    msg_mograineTankReady = "准备好对大领主莫格莱尼进行坦克",
    
    trigger_markYou = "You are afflicted by Mark of ",
    msg_doubleMark = "你被超过一个印记命中 - 注意你的位置！",
    
    trigger_mark4 = "You are afflicted by Mark of (.+) %(4%).",
    msg_mark4 = "你身上有4层印记 - 快跑开/吃暗抗！",
    msg_mark4Tank = "身上有4层印记 - 替换我！",
	
    --trigger_void = "Lady Blaumeux casts Void Zone"
    trigger_void2 = "Your life is mine!",
    bar_void = "虚空领域",
    msg_voidYou = "虚空领域在你身上！",
    
    --trigger_meteor = "Thane Korth'azz's Meteor hits ",
    trigger_meteor2 = "I like my meat extra crispy!",
    bar_meteor = "流星 CD",

    --trigger_wrath = "Sir Zeliek's Holy Wrath hits ",
    trigger_wrath2 = "I have no choice but to obey!",
    bar_wrath = "神圣之怒 CD",
    
    trigger_shieldWall = "(.+) gains Shield Wall.",
    bar_shieldWall = " - 盾墙",
    msg_shieldWallUp = " - 盾墙持续20秒",
    msg_shieldWallFade = " - 盾墙结束！",
    
    trigger_tauntResist = "Your Taunt was resisted by (.+).", --CHAT_MSG_SPELL_SELF_DAMAGE
    trigger_growlResist = "Your Growl was resisted by (.+).", --CHAT_MSG_SPELL_SELF_DAMAGE
    msg_tauntResist = "嘲讽被抵抗",
    
    trigger_tauntSuccess = "You perform Taunt on (.+).", --CHAT_MSG_SPELL_SELF_DAMAGE
    trigger_growlSuccess = "You perform Growl on (.+).", --CHAT_MSG_SPELL_SELF_DAMAGE
    msg_tauntSuccess = "嘲讽成功",
} end )

L:RegisterTranslations("zhCN", function() return {

    cmd = "Horsemen",

    mark_cmd = "mark",
    mark_name = "印记警报",
    mark_desc = "印记出现时进行警告",
    
    meteor_cmd = "meteor",
    meteor_name = "流星警报",
    meteor_desc = "库尔塔兹领主施放流星时进行警告。",
    
    wrath_cmd = "wrath",
    wrath_name = "神圣之怒警报",
    wrath_desc = "札里克爵士施放神圣之怒时进行警告。",
    
    void_cmd = "void",
    void_name = "虚空领域警报",
    void_desc = "女公爵布洛莫斯施放虚空领域时进行警告。",
    
    shieldwall_cmd = "shieldwall",
    shieldwall_name = "盾墙警报",
    shieldwall_desc = "盾墙出现时进行警告",
    
    taunt_cmd = "taunt",
    taunt_name = "嘲讽抵抗/成功警报",
    taunt_desc = "嘲讽抵抗和嘲讽成功时进行警告",
    
    tankswarn_cmd = "tankswarn",
    tankswarn_name = "嘲讽抵抗警报",
    tankswarn_desc = "嘲讽抵抗时进行警告",
	
	
    bar_markCount = "印记 ",
    msg_markCount = "印记 ",
    trigger_markZeliek = "受到了札里克爵士印记效果的影响",
    trigger_markKorthAzz = "受到了库尔塔兹领主印记效果的影响",
    trigger_markBlaumeux = "受到了女公爵布洛莫斯印记效果的影响",
    trigger_markMograine = "受到了大领主莫格莱尼印记效果的影响",
    
    trigger_markZeliekFade = "Mark of Zeliek fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    trigger_markKorthAzzFade = "Mark of Korth'azz fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    trigger_markBlaumeuxFade = "Mark of Blaumeux fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    trigger_markMograineFade = "Mark of Mograine fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    msg_zeliekTankReady = "准备好对札里克爵士进行坦克",
    msg_korthAzzTankReady = "准备好对库尔塔兹领主进行坦克",
    msg_blaumeuxTankReady = "准备好对女公爵布洛莫斯进行坦克",
    msg_mograineTankReady = "准备好对大领主莫格莱尼进行坦克",
    
    trigger_markYou = "You are afflicted by Mark of ",
    msg_doubleMark = "你被超过一个印记命中 - 注意你的位置！",
    
    trigger_mark4 = "You are afflicted by Mark of (.+) %(4%).",
    msg_mark4 = "你身上有4层印记 - 快跑开/吃暗抗！",
    msg_mark4Tank = "身上有4层印记 - 替换我！",
	
    --trigger_void = "Lady Blaumeux casts Void Zone"
    trigger_void2 = "你的命是我的了！",
    bar_void = "虚空领域",
    msg_voidYou = "虚空领域在你身上！",
    
    --trigger_meteor = "Thane Korth'azz's Meteor hits ",
    trigger_meteor2 = "我最喜欢烤肉了!",
    bar_meteor = "流星 CD",

    --trigger_wrath = "Sir Zeliek's Holy Wrath hits ",
    trigger_wrath2 = "除了服从，我别无选择！",
    bar_wrath = "神圣之怒 CD",
    
    trigger_shieldWall = "(.*)获得了盾墙的效果。",
    bar_shieldWall = " - 盾墙",
    msg_shieldWallUp = " - 盾墙持续20秒",
    msg_shieldWallFade = " - 盾墙结束！",
    
    trigger_tauntResist = "你的嘲讽被(.+)抵抗了。", --CHAT_MSG_SPELL_SELF_DAMAGE
    trigger_growlResist = "你的低吼被(.+)抵抗了。", --CHAT_MSG_SPELL_SELF_DAMAGE
    msg_tauntResist = "嘲讽被抵抗",
    
    trigger_tauntSuccess = "你对(.+)使用嘲讽。", --CHAT_MSG_SPELL_SELF_DAMAGE
    trigger_growlSuccess = "你对(.+)使用低吼。", --CHAT_MSG_SPELL_SELF_DAMAGE
    msg_tauntSuccess = "嘲讽成功",
} end )

local timer = {
    firstMark = 20,
    mark = 12,
    
	firstMeteor = 20,
    meteor = {12,15},
    
	firstWrath = 20,
    wrath = {10,14},
    
	firstVoid = 15,
    void = {12,15},
    
	shieldwall = 20,
}
local icon = {
    mark = "Spell_Shadow_CurseOfAchimonde",
    meteor = "Spell_Fire_Fireball02",
    wrath = "Spell_Holy_Excorcism",
    void = "spell_shadow_antishadow",
    shieldwall = "Ability_Warrior_ShieldWall",
}
local color = {
	mark = "White",
    meteor = "Red",
    wrath = "Yellow",
    void = "Black",
    shieldwall = "Blue",
}
local syncName = {
    mark = "HorsemenMark"..module.revision,
	meteor = "HorsemenMeteor"..module.revision,
	wrath = "HorsemenWrath"..module.revision,
	delayedVoidZone = "HorsemenDelayedVoidZone"..module.revision,
	shieldwall = "HorsemenShieldWall"..module.revision,
}

local gotMarkTime = 0
local marks = 0

local korthAzzDead = nil
local mograineDead = nil
local zeliekDead = nil
local blaumeuxDead = nil

local isTank = nil
	
function module:OnEnable()
    --self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	
    self:RegisterEvent("CHAT_MSG_MONSTER_SAY") --trigger_void2, trigger_meteor2, trigger_wrath2
	
    self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --4 mark triggers
    self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --4 mark triggers
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --4 mark triggers
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_shieldWall

	self:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "Event") --Taunt Resist/Success
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --Marks fade

    self:ThrottleSync(3, syncName.shieldwall)
    self:ThrottleSync(8, syncName.mark)
    self:ThrottleSync(5, syncName.delayedVoidZone)
    self:ThrottleSync(5, syncName.wrath)
    self:ThrottleSync(5, syncName.meteor)
end

function module:OnSetup()
    self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH") --count horsement death for SendBossDeathSync()
    --globalMarks = 0
end

function module:OnEngage()
    gotMarkTime = GetTime()
	marks = 0
	
	korthAzzDead = nil
	mograineDead = nil
	zeliekDead = nil
	blaumeuxDead = nil
	
	isTank = nil
	
    if self.db.profile.mark then
		self:Bar(L["bar_markCount"]..marks + 1, timer.firstMark, icon.mark, true, color.mark)
    end
    if self.db.profile.meteor then
        self:Bar(L["bar_meteor"], timer.firstMeteor, icon.meteor, true, color.meteor)
    end
    if self.db.profile.wrath then
        self:Bar(L["bar_wrath"], timer.firstWrath, icon.wrath, true, color.wrath)
    end
    if self.db.profile.void then
        self:Bar(L["bar_void"], timer.firstVoid, icon.void, true, color.void)
    end

	--[[
	if self.db.profile.strategy then
		globalMarks = 0
		for i = 0, GetNumRaidMembers() do
			if GetRaidRosterInfo(i) then
				local n, _, group = GetRaidRosterInfo(i);
				if n == UnitName('player') then
					playerGroup = group
				end
			end
		end

		if playerGroup > 0 then
			if playerGroup == 3 then
				fh_alert_marks(MOVE_THANE)
			end
			if playerGroup == 4 then
				fh_alert_marks(MOVE_SAFE_SPOT)
			end
			if playerGroup == 5 then
				fh_alert_marks(MOVE_MOGRAINE)
			end
			if playerGroup == 6 then
				fh_alert_marks(MOVE_SAFE_SPOT)
			end
		end
	end
	]]--
end

function module:OnDisengage()
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, thane) then
		korthAzzDead = true
	elseif msg == string.format(UNITDIESOTHER, mograine) then
		mograineDead = true
	elseif msg == string.format(UNITDIESOTHER, zeliek) then
		zeliekDead = true
	elseif msg == string.format(UNITDIESOTHER, blaumeux) then
		blaumeuxDead = true
	end
	
	if korthAzzDead == true and mograineDead == true and zeliekDead == true and blaumeuxDead == true then
        self:SendBossDeathSync()
    end
end

function module:CHAT_MSG_MONSTER_SAY(msg)
    if string.find(msg, L["trigger_void2"]) then
        self:Sync(syncName.delayedVoidZone)
    
	elseif string.find(msg, L["trigger_meteor2"]) then
        self:Sync(syncName.meteor)
    
	elseif string.find(msg, L["trigger_wrath2"]) then
        self:Sync(syncName.wrath)
    end
end

function module:Event(msg)
	if string.find(msg, L["trigger_markYou"]) and self.db.profile.mark then
		self:GotMark()
	end
	
	if string.find(msg, L["trigger_mark4"]) then
		self:Mark4()
	end
	
	if string.find(msg, L["trigger_markZeliek"]) or string.find(msg, L["trigger_markKorthAzz"]) or string.find(msg, L["trigger_markBlaumeux"]) or string.find(msg, L["trigger_markMograine"]) then
        self:Sync(syncName.mark)
	
	elseif string.find(msg, L["trigger_shieldWall"]) then
		local _, _, shieldWallUser = string.find(msg, L["trigger_shieldWall"])
		if shieldWallUser == thane or shieldWallUser == mograine or shieldWallUser == zeliek or shieldWallUser == blaumeux then
			self:Sync(syncName.shieldwall .. " " .. shieldWallUser)
		end
	
	
	
	elseif string.find(msg, L["trigger_markZeliekFade"]) and zeliekDead == nil and (isTank ~= false) and self.db.profile.tankswarn then
		self:ZeliekMarkFade()
	elseif string.find(msg, L["trigger_markKorthAzzFade"]) and korthAzzDead == nil and (isTank ~= false) and self.db.profile.tankswarn then
		self:KorthAzzMarkFade()
	elseif string.find(msg, L["trigger_markBlaumeuxFade"]) and blaumeuxDead == nil and (isTank ~= false) and self.db.profile.tankswarn then
		self:BlaumeuxMarkFade()
	elseif string.find(msg, L["trigger_markMograineFade"]) and mograineDead == nil and (isTank ~= false) and self.db.profile.tankswarn then
		self:MograineMarkFade()
	
	
	
	elseif string.find(msg, L["trigger_tauntResist"]) and self.db.profile.taunt then
		local _, _, tauntTarget = string.find(msg, L["trigger_tauntResist"])
		if tauntTarget == thane or tauntTarget == mograine or tauntTarget == zeliek or tauntTarget == blaumeux then
			self:TauntResist()
		end
	
	elseif string.find(msg, L["trigger_growlResist"]) and self.db.profile.taunt then
		local _, _, tauntTarget = string.find(msg, L["trigger_growlResist"])
		if tauntTarget == thane or tauntTarget == mograine or tauntTarget == zeliek or tauntTarget == blaumeux then
			self:TauntResist()
		end
	
	
	
	elseif string.find(msg, L["trigger_tauntSuccess"]) and self.db.profile.taunt then
		local _, _, tauntTarget = string.find(msg, L["trigger_tauntSuccess"])
		if tauntTarget == thane or tauntTarget == mograine or tauntTarget == zeliek or tauntTarget == blaumeux then
			self:TauntSuccess()
		end
		
	elseif string.find(msg, L["trigger_growlSuccess"]) and self.db.profile.taunt then
		local _, _, tauntTarget = string.find(msg, L["trigger_growlSuccess"])
		if tauntTarget == thane or tauntTarget == mograine or tauntTarget == zeliek or tauntTarget == blaumeux then
			self:TauntSuccess()
		end
    end
end



--tanks say when they are ready to tank
function module:ZeliekMarkFade()
	if (UnitName("Target") == thane or UnitName("Target") == mograine or UnitName("Target") == zeliek or UnitName("Target") == blaumeux) and UnitName("TargetTarget") == UnitName("Player") then
		return
	else
		if isTank == nil then self:TankCheck() end
		if isTank == true then
			SendChatMessage(UnitName("Player")..L["msg_zeliekTankReady"], "SAY")
		end
	end
end

function module:KorthAzzMarkFade()
	if (UnitName("Target") == thane or UnitName("Target") == mograine or UnitName("Target") == zeliek or UnitName("Target") == blaumeux) and UnitName("TargetTarget") == UnitName("Player") then
		return
	else
		if isTank == nil then self:TankCheck() end
		if isTank == true then
			SendChatMessage(UnitName("Player")..L["msg_korthAzzTankReady"], "SAY")
		end
	end
end

function module:BlaumeuxMarkFade()
	if (UnitName("Target") == thane or UnitName("Target") == mograine or UnitName("Target") == zeliek or UnitName("Target") == blaumeux) and UnitName("TargetTarget") == UnitName("Player") then
		return
	else
		if isTank == nil then self:TankCheck() end
		if isTank == true then
			SendChatMessage(UnitName("Player")..L["msg_blaumeuxTankReady"], "SAY")
		end
	end
end

function module:MograineMarkFade()
	if (UnitName("Target") == thane or UnitName("Target") == mograine or UnitName("Target") == zeliek or UnitName("Target") == blaumeux) and UnitName("TargetTarget") == UnitName("Player") then
		return
	else
		if isTank == nil then self:TankCheck() end
		if isTank == true then
			SendChatMessage(UnitName("Player")..L["msg_mograineTankReady"], "SAY")
		end
	end
end

function module:TankCheck()
	if UnitClass("Player") == BC["Warrior"] and UnitHealthMax("Player") >= 8000 then
		local numTabs = GetNumTalentTabs()
		for t=1, numTabs do
			local numTalents = GetNumTalents(t)
			for i=1, numTalents do
				local nameTalent, icon, tier, column, currRank, maxRank= GetTalentInfo(t,i)
				if nameTalent == bsdefiance then
					if currRank == 5 then
						isTank = true
					end
				end
			end
		end
	
	elseif UnitClass("Player") == BC["Druid"] and UnitHealthMax("Player") >= 8000 then
		local numTabs = GetNumTalentTabs()
		for t=1, numTabs do
			local numTalents = GetNumTalents(t)
			for i=1, numTalents do
				local nameTalent, icon, tier, column, currRank, maxRank= GetTalentInfo(t,i)
				if nameTalent == bsferalinstinct then
					if currRank == 3 then
						isTank = true
					end
				end
			end
		end
		
	elseif UnitClass("Player") == BC["Paladin"] and UnitHealthMax("Player") >= 8000 then
		local numTabs = GetNumTalentTabs()
		for t=1, numTabs do
			local numTalents = GetNumTalents(t)
			for i=1, numTalents do
				local nameTalent, icon, tier, column, currRank, maxRank= GetTalentInfo(t,i)
				if nameTalent == bsimprovedsealofjustice then
					if currRank == 3 then
						isTank = true
					end
				end
			end
		end
	end
	
	if isTank == nil then
		isTank = false
	end
end


--get hit by more than 1 mark at once
function module:GotMark()
	if (GetTime() - gotMarkTime) <= 1 then
		self:Message(L["msg_doubleMark"], "Urgent", false, nil, false)
		self:Sound("Long")
	end
	gotMarkTime = GetTime()
end


--get hit by mark 4
function module:Mark4()
	--if you are a tank, yell for replacement
	--if you are not a tank, warn to GTFO
	if (UnitName("Target") == thane or UnitName("Target") == mograine or UnitName("Target") == zeliek or UnitName("Target") == blaumeux) and UnitName("TargetTarget") == UnitName("Player") then
		if self.db.profile.tankswarn then
			SendChatMessage(UnitName("Player")..L["msg_mark4Tank"], "Yell")
		end
	else
		if self.db.profile.mark then
			self:Message(L["msg_mark4"], "Urgent", false, nil, false)
			self:Sound("RunAway")
		end
	end
end


function module:TauntResist()
	SendChatMessage(L["msg_tauntResist"], "SAY")
end

function module:TauntSuccess()
	SendChatMessage(L["msg_tauntSuccess"], "SAY")
end

	--nothing calls this function!?
--function module:DelayedVoidZone(msg)
--    if string.find(msg, trigger_void) then
--        self:Sync(syncName.delayedVoidZone)
--    end
--end

function module:DelayedVoidZoneEvent()
    local target = self:CheckTarget()

    if target then
        if (IsRaidLeader() or IsRaidOfficer()) then
			for i=1,GetNumRaidMembers() do
				if UnitName("raid"..i) == target then
					SetRaidTargetIcon("raid"..i, 3)
				end
			end
		end
        if target == UnitName("Player") then
            self:Message(L["msg_voidYou"], "Urgent", false, nil, false)
            self:Sound("Beware")
            SendChatMessage("虚空领域在我身上！", "SAY")
        end
    end
end

function module:CheckTarget()
    if UnitName("Target") == blaumeux then
        return UnitName("TargetTarget")
    else
        for i = 1, GetNumRaidMembers() do
            if UnitName("Raid" .. i .. "Target") == blaumeux then
                return UnitName("Raid" .. i .. "TargetTarget")
            end
        end
    end
    return nil
end


function module:BigWigs_RecvSync(sync, rest, nick)
    if sync == syncName.mark and self.db.profile.mark then
        self:Mark()
    
	elseif sync == syncName.meteor and self.db.profile.meteor then
        self:Meteor()
    
	elseif sync == syncName.wrath and self.db.profile.wrath then
        self:Wrath()
    
	elseif sync == syncName.delayedVoidZone and self.db.profile.void then
        self:VoidZoneEvent()
    
	elseif sync == syncName.shieldwall and rest and self.db.profile.shieldwall then
        self:Shieldwall(rest)
    end
end


function module:Mark()
    self:RemoveBar(L["bar_markCount"]..marks)
    marks = marks + 1
    
	self:Message(L["msg_markCount"]..marks, "Important", false, nil, false)
	self:Bar(L["bar_markCount"]..marks + 1, timer.mark, icon.mark, true, color.mark)
	
	--[[
	if self.db.profile.strategy then
		self:Something()
	end
	]]--
end

function module:Meteor()
	self:IntervalBar(L["bar_meteor"], timer.meteor[1], timer.meteor[2], icon.meteor, true, color.meteor)
end

function module:Wrath()
	self:IntervalBar(L["bar_wrath"], timer.wrath[1], timer.wrath[2], icon.wrath, true, color.wrath)
end

function module:VoidZoneEvent()
    self:ScheduleEvent("DelayedVoidZoneEvent", self.DelayedVoidZoneEvent, 0.2, self)
    self:WarningSign(icon.void, 3)
    self:IntervalBar(L["bar_void"], timer.void[1], timer.void[2], icon.void, true, color.void)
end

function module:Shieldwall(rest)
	self:Message(rest..L["msg_shieldWallUp"], "Attention", false, nil, false)
	self:Bar(rest..L["bar_shieldWall"], timer.shieldwall, icon.shieldwall, true, color.shieldwall)
	self:DelayedMessage(timer.shieldwall, rest..L["msg_shieldWallFade"], "Positive", false, nil, false)
end

--[[
local globalMarks = 0
local playerGroup = 0
local MOVE_SAFE_SPOT = "MOVE TO |cf75DE52fSAFE SPOT"
local MOVE_THANE = "MOVE TO |cff7b9a2fTHANE|r - STACK ON TANK"
local MOVE_MOGRAINE = "MOVE TO |cffb2422eMOGRAINE"
]]--

--[[
local fhAlert = CreateFrame("Frame", "fhAlert");

fhAlert:RegisterEvent("CHAT_MSG_ADDON")

fhAlert:SetPoint("CENTER", UIParent, "CENTER", 0, -100);

fhAlert.text = fhAlert:CreateFontString("$parentText", "OVERLAY");
fhAlert.text:Hide()
fhAlert.text:SetWidth(800);
fhAlert.text:SetHeight(108);
fhAlert.text:SetFont(STANDARD_TEXT_FONT, 50, "OUTLINE");
fhAlert.text:SetPoint("CENTER", UIParent, 0, 100);
fhAlert.text:SetJustifyV("MIDDLE");
fhAlert.text:SetJustifyH("CENTER");

local fh_alert = CreateFrame('Frame')
fh_alert:Hide()
function fh_alert_marks(message)
    fhAlert.text:SetText(message);
    DEFAULT_CHAT_FRAME:AddMessage(message)
    fh_alert:Show()
end

fhAlert.healerIndex = 0

fhAlert:SetScript("OnEvent", function()
    if event then
        if event == 'CHAT_MSG_ADDON' and arg1 == "TWABW" then
            local data = string.split(arg2, ' ')
            for _, d in data do
                for healerIndex = 1, 3 do
                    if string.find(d, '[' .. healerIndex .. ']' .. UnitName('player'), 1, true) then
                        fhAlert.healerIndex = healerIndex
                        DEFAULT_CHAT_FRAME:AddMessage("Healer index set to " .. healerIndex)
                        break
                    end
                end
            end
        end
    end
end)

fh_alert:SetScript("OnShow", function()
    this.startTime = GetTime()
    fhAlert.text:Show()
end)
fh_alert:SetScript("OnHide", function()
    fhAlert.text:Hide()
end)
fh_alert:SetScript("OnUpdate", function()
    local plus = 5
    local gt = GetTime() * 1000
    local st = (this.startTime + plus) * 1000
    if gt >= st then
        fh_alert:Hide()
    end
end)
]]--

--[[
function string:split(delimiter)
    local result = {}
    local from = 1
    local delim_from, delim_to = string.find(self, delimiter, from)
    while delim_from do
        table.insert(result, string.sub(self, from, delim_from - 1))
        from = delim_to + 1
        delim_from, delim_to = string.find(self, delimiter, from)
    end
    table.insert(result, string.sub(self, from))
    return result
end

function module:Something()
	globalMarks = globalMarks + 1
	if horsemenIsRL() then
		SendChatMessage("HEALER [" .. globalMarks .. "] ROTATE", "RAID", DEFAULT_CHAT_FRAME.editBox.languageID);
	end
	if globalMarks == fhAlert.healerIndex then
		fh_alert_marks("|cf75DE52f- MOVE -")
		self:TriggerEvent("BigWigs_Sound", "BikeHorn")
	end

	if globalMarks == 3 then
		if fhAlert.healerIndex == 0 then
			self:TriggerEvent("BigWigs_Sound", "BikeHorn")
		end
		globalMarks = 0
	end

	if playerGroup > 0 then

		if marks == 0 or marks == 12 or marks == 24 or marks == 36 then
			if playerGroup == 3 then
				fh_alert_marks(MOVE_THANE)
			end
			if playerGroup == 4 then
				fh_alert_marks(MOVE_SAFE_SPOT)
			end
			if playerGroup == 5 then
				fh_alert_marks(MOVE_MOGRAINE)
			end
			if playerGroup == 6 then
				fh_alert_marks(MOVE_SAFE_SPOT)
			end
		end

		if marks == 3 or marks == 15 or marks == 27 or marks == 39 then
			if playerGroup == 3 then
				fh_alert_marks(MOVE_SAFE_SPOT)
			end
			if playerGroup == 4 then
				fh_alert_marks(MOVE_THANE)
			end
			if playerGroup == 5 then
				fh_alert_marks(MOVE_SAFE_SPOT)
			end
			if playerGroup == 6 then
				fh_alert_marks(MOVE_MOGRAINE)
			end
		end

		if marks == 6 or marks == 18 or marks == 30 or marks == 42 then
			if playerGroup == 3 then
				fh_alert_marks(MOVE_MOGRAINE)
			end
			if playerGroup == 4 then
				fh_alert_marks(MOVE_SAFE_SPOT)
			end
			if playerGroup == 5 then
				fh_alert_marks(MOVE_THANE)
			end
			if playerGroup == 6 then
				fh_alert_marks(MOVE_SAFE_SPOT)
			end
		end

		if marks == 9 or marks == 21 or marks == 33 or marks == 45 then
			if playerGroup == 3 then
				fh_alert_marks(MOVE_SAFE_SPOT)
			end
			if playerGroup == 4 then
				fh_alert_marks(MOVE_MOGRAINE)
			end
			if playerGroup == 5 then
				fh_alert_marks(MOVE_SAFE_SPOT)
			end
			if playerGroup == 6 then
				fh_alert_marks(MOVE_THANE)
			end
		end
	end
end

function horsemenIsRL()
    if not UnitInRaid("Player") then
        return false
    end
    for i = 0, GetNumRaidMembers() do
        if GetRaidRosterInfo(i) then
            local n, r = GetRaidRosterInfo(i);
            if n == UnitName("Player") and r == 2 then
                return true
            end
        end
    end
    return false
end
]]--

