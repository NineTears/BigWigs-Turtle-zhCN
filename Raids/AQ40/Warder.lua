
local module, L = BigWigs:ModuleDeclaration("Anubisath Warder", "Ahn'Qiraj")

module.revision = 20044
module.enabletrigger = module.translatedName
module.toggleoptions = {"fear", "silence", "roots", "dust", "warnings"}
module.trashMod = true

L:RegisterTranslations("enUS", function() return {
    cmd = "Warder",

    fear_cmd = "fear",
    fear_name = "恐惧计时器",
    fear_desc = "显示恐惧冷却时间",

    silence_cmd = "silence",
    silence_name = "沉默计时器",
    silence_desc = "显示沉默冷却时间",

    roots_cmd = "roots",
    roots_name = "纠缠根须计时器",
    roots_desc = "显示纠缠根须冷却时间",

    dust_cmd = "dust",
    dust_name = "尘云计时器",
    dust_desc = "显示尘云冷却时间",

    warnings_cmd = "warnings",
    warnings_name = "警告消息",
    warnings_desc = "显示当前怪物拥有的两种技能的警告消息",

    fearTrigger = "Anubisath Warder begins to cast Fear.",
    fearWarn = "恐惧",
    fearWarn2 = "(沉默或尘云)",
    fearBar = "恐惧！",
    fearBar_next = "恐惧冷却",

    silenceTrigger = "Anubisath Warder begins to cast Silence.",
    silenceWarn = "沉默",
    silenceWarn2 = "(纠缠根须或恐惧)",
    silenceBar = "沉默！",
    silenceBar_next = "沉默冷却",

    rootsTrigger = "Anubisath Warder begins to cast Entangling Roots.",
    rootsWarn = "纠缠根须",
    rootsWarn2 = "(沉默或尘云)",
    rootsBar = "纠缠根须！",
    rootsBar_next = "纠缠根须冷却",

    dustTrigger = "Anubisath Warder begins to perform Dust Cloud.",
    dustWarn = "尘云",
    dustWarn2 = "(纠缠根须或恐惧)",
    dustBar = "尘云！",
    dustBar_next = "尘云冷却",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-02-08
    cmd = "Warder",

    fear_cmd = "fear",
    fear_name = "恐惧计时器",
    fear_desc = "显示恐惧冷却时间",

    silence_cmd = "silence",
    silence_name = "沉默计时器",
    silence_desc = "显示沉默冷却时间",

    roots_cmd = "roots",
    roots_name = "纠缠根须计时器",
    roots_desc = "显示纠缠根须冷却时间",

    dust_cmd = "dust",
    dust_name = "尘云计时器",
    dust_desc = "显示尘云冷却时间",

    warnings_cmd = "warnings",
    warnings_name = "警告消息",
    warnings_desc = "显示当前怪物拥有的两种技能的警告消息",

    fearTrigger = "Anubisath Warder begins to cast Fear.",
    fearWarn = "恐惧",
    fearWarn2 = "(沉默或尘云)",
    fearBar = "恐惧！",
    fearBar_next = "恐惧冷却",

    silenceTrigger = "Anubisath Warder begins to cast Silence.",
    silenceWarn = "沉默",
    silenceWarn2 = "(纠缠根须或恐惧)",
    silenceBar = "沉默！",
    silenceBar_next = "沉默冷却",

    rootsTrigger = "Anubisath Warder begins to cast Entangling Roots.",
    rootsWarn = "纠缠根须",
    rootsWarn2 = "(沉默或尘云)",
    rootsBar = "纠缠根须！",
    rootsBar_next = "纠缠根须冷却",

    dustTrigger = "Anubisath Warder begins to perform Dust Cloud.",
    dustWarn = "尘云",
    dustWarn2 = "(纠缠根须或恐惧)",
    dustBar = "尘云！",
    dustBar_next = "尘云冷却",
} end )

local timer = {
	earliestFear = 14,
	latestFear = 19,
	fearCast = 1.5,
	earliestSilence = 14,
	latestSilence = 19,
	silenceCast = 1.5,
	earliestRoots = 7,
	latestRoots = 14,
	rootsCast = 1.5,
	earliestDust = 14,
	latestDust = 19,
	dustCast = 1.5,
}

local icon = {
	fear = "Spell_Shadow_Possession",
	silence = "Spell_Holy_Silence",
	roots = "Spell_Nature_StrangleVines",
	dust = "Ability_Hibernation",
}

local syncName = {
	fear = "WarderFear"..module.revision,
	silence = "WarderSilence"..module.revision,
	roots = "WarderRoots"..module.revision,
	dust = "WarderDust"..module.revision,
}

local pull = nil

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")

	if not warnings then
		warnings = {
			["dust"] = {L["dustWarn"], L["dustWarn2"]},
			["roots"] = {L["rootsWarn"], L["rootsWarn2"]},
			["fear"] = {L["fearWarn"], L["fearWarn2"]},
			["silence"] = {L["silenceWarn"], L["silenceWarn2"]},
		}
	end

	self:ThrottleSync(6, syncName.fear)
	self:ThrottleSync(6, syncName.silence)
	self:ThrottleSync(3, syncName.roots)
end

function module:OnSetup()
end

function module:OnEngage()
	self.ability1 = nil
	self.ability2 = nil
end

function module:OnDisengage()
end

function module:Event(msg)
	if string.find(msg, L["fearTrigger"]) then
		self:Sync(syncName.fear)
	elseif string.find(msg, L["silenceTrigger"]) then
		self:Sync(syncName.silence)
	elseif string.find(msg, L["rootsTrigger"]) then
		self:Sync(syncName.roots)
	elseif string.find(msg, L["dustTrigger"]) then
		self:Sync(syncName.dust)
	end
end

function module:BigWigs_RecvSync( sync, rest, nick )
	if sync == syncName.fear then
		if self.db.profile.fear then
			self:RemoveBar(L["fearBar_next"])
			self:Bar(L["fearBar"], timer.fearCast, icon.fear, true, "blue")
			self:DelayedIntervalBar(timer.fearCast, L["fearBar_next"], timer.earliestFear-timer.fearCast, timer.latestFear-timer.fearCast, icon.fear, true, "blue")
		end
		self:AbilityWarn("fear")
	elseif sync == syncName.silence then
		if self.db.profile.silence then
			self:RemoveBar(L["silenceBar_next"])
			self:Bar(L["silenceBar"], timer.silenceCast, icon.silence, true, "red")
			self:DelayedIntervalBar(timer.silenceCast, L["silenceBar_next"], timer.earliestSilence-timer.silenceCast, timer.latestSilence-timer.silenceCast, icon.silence, true, "red")
		end
		self:AbilityWarn("silence")
	elseif sync == syncName.roots then
		if self.db.profile.roots then
			self:RemoveBar(L["rootsBar_next"])
			self:Bar(L["rootsBar"], timer.rootsCast, icon.roots, true, "Green")
			self:DelayedIntervalBar(timer.rootsCast, L["rootsBar_next"], timer.earliestRoots-timer.rootsCast, timer.latestRoots-timer.rootsCast, icon.roots, true, "Green")
		end
		self:AbilityWarn("roots")
	elseif sync == syncName.dust then
		if self.db.profile.dust then
			self:RemoveBar(L["dustBar_next"])
			self:Bar(L["dustBar"], timer.dustCast, icon.dust, true, "White")
			self:DelayedIntervalBar(timer.dustCast, L["dustBar_next"], timer.earliestDust-timer.dustCast, timer.latestDust-timer.dustCast, icon.dust, true, "White")
		end
		self:AbilityWarn("dust")
	end
end

function module:AbilityWarn( ability )
	if self.db.profile.warnings then
		if not self.ability1 then
			self.ability1 = ability
			self:Message(string.format("%s + %s",warnings[self.ability1][1], warnings[self.ability1][2]), "Core", nil, "Long")
		elseif not self.ability2 and ability ~= self.ability1 then
			self.ability2 = ability
			self:Message(string.format("%s + %s",warnings[self.ability1][1], warnings[self.ability2][1]), "Core", nil, "Long")
		end
	end
end
