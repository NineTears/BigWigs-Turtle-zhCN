
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Lucifron", "Molten Core")

module.revision = 20007 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}

module.toggleoptions = {"adds", "curse", "doom", "shock", "mc", "bosskill"}

module.defaultDB = {
	adds = false,
}

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {
	curse = 15,
	firstCurse = 20,
	doom = 20,
	firstDoom = 10,
	mc = 15,
}
local icon = {
	curse = "Spell_Shadow_BlackPlague",
	doom = "Spell_Shadow_NightOfTheDead",
	mc = "Spell_Shadow_ShadowWordDominate",
}
local syncName = {
	curse = "LucifronCurseRep"..module.revision,
	doom = "LucifronDoomRep"..module.revision,
	shock = "LucifronShock"..module.revision,
	mc = "LucifronMC"..module.revision.."_",
	mcEnd = "LucifronMCEnd"..module.revision.."_",
	add = "LucifronAddDead",
}


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
    curse_trigger = "afflicted by Lucifron",
    doom_trigger = "afflicted by Impending Doom",
    shock_trigger = "s Shadow Shock hits",
    shock_trigger2 = "s Shadow Shock was resisted",
    curse_trigger2 = " Lucifron(.*) Curse was resisted",
    doom_trigger2 = "s Impending Doom was resisted",
    curse_warn_soon = "鲁西弗隆的诅咒还有5秒到来！",
    curse_warn_now = "鲁西弗隆的诅咒 - 下一次诅咒20秒后出现！",
    doom_warn_soon = "厄运降临还有5秒到来！",
    doom_warn_now = "厄运降临 - 下一次厄运降临15秒后出现！",
    mindcontrolyou_trigger = "You are afflicted by Dominate Mind.",
    mindcontrolother_trigger = "(.*) is afflicted by Dominate Mind.",
    mindcontrolyouend_trigger = "Dominate Mind fades from you.",
    mindcontrolotherend_trigger = "Dominate Mind fades from (.*).",
    deathyou_trigger = "You die.",
    deathother_trigger = "(.*) dies.",
    deadaddtrigger = "Flamewaker Protector dies",
    add_name = "Flamewaker Protector",

    mindcontrol_message = "%s 被精神控制了！",
    mindcontrol_message_you = "你被精神控制了！",
    mindcontrol_bar = "精神控制：%s",
    addmsg = "%d/2 烈焰行者保卫者死亡！",

    curse_bar = "鲁西弗隆的诅咒",
    doom_bar = "厄运降临",
    shock_bar = "暗影震击",

    cmd = "Lucifron",

    adds_cmd = "adds",
    adds_name = "死亡增援计数器",
    adds_desc = "通报烈焰行者保卫者死亡",

    mc_cmd = "mc",
    mc_name = "统御意志",
    mc_desc = "当有人被精神控制时进行警告",

    curse_cmd = "curse",
    curse_name = "鲁西弗隆的诅咒警报",
    curse_desc = "鲁西弗隆的诅咒出现时进行警告",

    doom_cmd = "doom",
    doom_name = "厄运降临警报",
    doom_desc = "厄运降临出现时进行警告",

    shock_cmd = "shock",
    shock_name = "暗影震击警报",
    shock_desc  = "暗影震击出现时进行警告",
} end)

L:RegisterTranslations("esES", function() return {
	curse_trigger = "sufre de Lucifron",
	doom_trigger = "sufre de Condena inminente",
	shock_trigger = "Choque de Sombras golpea",
	shock_trigger2 = "Resistido Choque de Sombras de Lucifron",
	curse_trigger2 = "Resistido Maldición de Lucifrón de Lucifron",
	doom_trigger2 = "Resistido Condena inminente de Lucifron",
	curse_warn_soon = "¡5 segundos hasta Maldición de Lucifrón!",
	curse_warn_now = "¡Maldición de Lucifrón - 20 segundos hasta el próximo!",
	doom_warn_soon = "¡5 segundos hasta Condena inminente!",
	doom_warn_now = "¡Condena inminente - 15 segundos hasta el próximo!",
	mindcontrolyou_trigger = "sufres de Subyugar mente.",
	mindcontrolother_trigger = "(.*) sufre de Subyugar mente.",
	mindcontrolyouend_trigger = "Subyugar mente acaba de disiparse.",
	mindcontrolotherend_trigger = "Subyugar mente desaparece de (.*).",
	deathyou_trigger = "Has muerto.",
	deathother_trigger = "(.*) ha muerto.",
	deadaddtrigger = "Protector despiertallamas muere",
	add_name = "Protector despiertallamas",

	mindcontrol_message = "¡%s tiene Subyugar mente!",
	mindcontrol_message_you = "¡Tienes Subyugar mente!",
	mindcontrol_bar = "Subyugar Mente: %s",
	addmsg = "¡%d/2 Protector despiertallamas muertos!",

	curse_bar = "Maldición de Lucifrón",
	doom_bar = "Condena inminente",
	shock_bar = "Choque de Sombras",

	--cmd = "Lucifron",

	--adds_cmd = "adds",
	adds_name = "Contador de despiertallamas muertos",
	adds_desc = "Anuncia Protector despiertallamas muertos",

	--mc_cmd = "mc",
	mc_name = "Subyugar mente",
	mc_desc = "Alerta cuando alguien tenga Subyugar mente.",

	--curse_cmd = "curse",
	curse_name = "Alerta de Maldición de Lucifrón",
	curse_desc = "Avisa para Maldición de Lucifrón",

	--doom_cmd = "doom",
	doom_name = "Alerta de Condena inminente",
	doom_desc = "Avisa para Condena inminente",

	--shock_cmd = "shock",
	shock_name = "Alerta de Choque de Sombras",
	shock_desc  = "Avisa para Choque de Sombras",
} end)

L:RegisterTranslations("deDE", function() return {
	curse_trigger = "von Lucifrons Fluch betroffen",
	doom_trigger = "von Drohende Verdammnis betroffen",
	shock_trigger = "Schattenschock trifft",
	shock_trigger2 = "Schattenschock(.+) widerstanden",
	curse_trigger2 = "Lucifrons Fluch wurde von(.+) widerstanden",
	doom_trigger2 = "Drohende Verdammnis wurde von(.+) widerstanden",

	curse_warn_soon = "5 Sekunden bis Lucifrons Fluch!",
	curse_warn_now = "Lucifrons Fluch - 20 Sekunden bis zum nächsten!",
	doom_warn_soon = "5 Sekunden bis Drohende Verdammnis!",
	doom_warn_now = "Drohende Verdammnis - 15 Sekunden bis zur nächsten!",
	mindcontrolyou_trigger = "Ihr seid von Gedanken beherrschen betroffen.",
	mindcontrolother_trigger = "(.*) ist von Gedanken beherrschen betroffen.",
	mindcontrolyouend_trigger = "Gedanken beherrschen\' schwindet von Euch.",
	mindcontrolotherend_trigger = "Gedanken beherrschen schwindet von (.*).",
	deathyou_trigger = "Ihr sterbt.",
	deathother_trigger = "(.*) stirbt.",
	deadaddtrigger = "Feuerschuppenbeschützer stirbt", --"Besch\195\188tzer der Flammensch\195\188rer stirbt.",
	add_name = "Feuerschuppenbeschützer",

	mindcontrol_message = "%s ist gedankenkontrolliert!",
	mindcontrol_message_you = "Du bist gedankenkontrolliert!",
	mindcontrol_bar = "GK: %s",
	addmsg = "%d/2 Feuerschuppenbeschützer tot!",

	curse_bar = "Lucifrons Fluch",
	doom_bar = "Drohende Verdammnis",
	shock_bar = "Schattenschock",

	--cmd = "Lucifron",

	--adds_cmd = "adds",
	adds_name = "Zähler für tote Adds",
	adds_desc = "Verkündet Feuerschuppenbeschützer Tod",

	--mc_cmd = "mc",
	mc_name = "Gedankenkontrolle",
	mc_desc = "Warnen, wenn jemand übernommen ist",

	--curse_cmd = "curse",
	curse_name = "Alarm für Lucifrons Fluch",
	curse_desc = "Warnen vor Lucifrons Fluch",

	--doom_cmd = "doom",
	doom_name = "Alarm für Drohende Verdammnis",
	doom_desc = "Warnen vor Drohender Verdammnis",

	--shock_cmd = "shock",
	shock_name = "Alarm für Schattenschock ",
	shock_desc  = "Warnen vor Schattenschock",
} end)

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-02-08
    curse_trigger = "afflicted by Lucifron",
    doom_trigger = "afflicted by Impending Doom",
    shock_trigger = "s Shadow Shock hits",
    shock_trigger2 = "s Shadow Shock was resisted",
    curse_trigger2 = " Lucifron(.*) Curse was resisted",
    doom_trigger2 = "s Impending Doom was resisted",
    curse_warn_soon = "鲁西弗隆的诅咒还有5秒到来！",
    curse_warn_now = "鲁西弗隆的诅咒 - 下一次诅咒20秒后出现！",
    doom_warn_soon = "厄运降临还有5秒到来！",
    doom_warn_now = "厄运降临 - 下一次厄运降临15秒后出现！",
    mindcontrolyou_trigger = "You are afflicted by Dominate Mind.",
    mindcontrolother_trigger = "(.*) is afflicted by Dominate Mind.",
    mindcontrolyouend_trigger = "Dominate Mind fades from you.",
    mindcontrolotherend_trigger = "Dominate Mind fades from (.*).",
    deathyou_trigger = "You die.",
    deathother_trigger = "(.*) dies.",
    deadaddtrigger = "Flamewaker Protector dies",
    add_name = "Flamewaker Protector",

    mindcontrol_message = "%s 被精神控制了！",
    mindcontrol_message_you = "你被精神控制了！",
    mindcontrol_bar = "精神控制：%s",
    addmsg = "%d/2 烈焰行者保卫者死亡！",

    curse_bar = "鲁西弗隆的诅咒",
    doom_bar = "厄运降临",
    shock_bar = "暗影震击",

    cmd = "Lucifron",

    adds_cmd = "adds",
    adds_name = "死亡增援计数器",
    adds_desc = "通报烈焰行者保卫者死亡",

    mc_cmd = "mc",
    mc_name = "统御意志",
    mc_desc = "当有人被精神控制时进行警告",

    curse_cmd = "curse",
    curse_name = "鲁西弗隆的诅咒警报",
    curse_desc = "鲁西弗隆的诅咒出现时进行警告",

    doom_cmd = "doom",
    doom_name = "厄运降临警报",
    doom_desc = "厄运降临出现时进行警告",

    shock_cmd = "shock",
    shock_name = "暗影震击警报",
    shock_desc  = "暗影震击出现时进行警告",
} end)

------------------------------
--      Initialization      --
------------------------------

module.wipemobs = { L["add_name"] }

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH", "Event")

	self:ThrottleSync(0.5, syncName.mc .. "(.*)")
	self:ThrottleSync(0.5, syncName.mcEnd .. "(.*)")
	self:ThrottleSync(5, syncName.curse)
	self:ThrottleSync(5, syncName.shock)
	self:ThrottleSync(5, syncName.doom)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	self.protector = 0

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.curse then
		self:DelayedMessage(timer.curse - 5, L["curse_warn_soon"], "Attention", nil, nil, true)
		self:Bar(L["curse_bar"], timer.curse, icon.curse, true, "Blue")
	end
	if self.db.profile.doom then
		self:DelayedMessage(timer.firstDoom - 5, L["doom_warn_soon"], "Attention", nil, nil, true)
		self:Bar(L["doom_bar"], timer.firstDoom, icon.doom, true, "Black")
	end
	self:Sync("LucifronShock")
end

-- called after boss is disengaged (wipe/retreat or victory)
function module:OnDisengage()
end

------------------------------
--      Event Handlers      --
------------------------------

function module:Event(msg)
	local _,_,mindcontrolother,_ = string.find(msg, L["mindcontrolother_trigger"])
	local _,_,mindcontrolotherend,_ = string.find(msg, L["mindcontrolotherend_trigger"])
	local _,_,mindcontrolotherdeath,_ = string.find(msg, L["deathother_trigger"])
	if ((string.find(msg, L["curse_trigger"])) or (string.find(msg, L["curse_trigger2"]))) then
		self:Sync(syncName.curse)
	elseif ((string.find(msg, L["doom_trigger"])) or (string.find(msg, L["doom_trigger2"]))) then
		self:Sync(syncName.doom)
	elseif ((string.find(msg, L["shock_trigger"])) or (string.find(msg, L["shock_trigger2"]))) then
		self:Sync(syncName.shock)
	elseif string.find(msg, L["mindcontrolyou_trigger"]) then
		self:Sync(syncName.mc .. UnitName("player"))
	elseif string.find(msg, L["mindcontrolyouend_trigger"]) then
		self:Sync(syncName.mcEnd .. UnitName("player"))
	elseif string.find(msg, L["deathyou_trigger"]) then
		self:Sync(syncName.mcEnd .. UnitName("player"))
	elseif mindcontrolother then
		self:Sync(syncName.mc .. mindcontrolother)
	elseif mindcontrolotherend then
		self:Sync(syncName.mcEnd .. mindcontrolotherend)
	elseif mindcontrolotherdeath then
		self:Sync(syncName.mcEnd .. mindcontrolotherdeath)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if string.find(msg, L["deadaddtrigger"]) then
		self:Sync(syncName.add .. " " .. tostring(self.protector + 1))
	else
		local _,_,mindcontrolotherdeath,_ = string.find(msg, L["deathother_trigger"])
		if mindcontrolotherdeath then
			self:Sync(syncName.mcEnd .. mindcontrolotherdeath)
		end
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.curse and self.db.profile.curse then
		self:DelayedMessage(timer.curse - 5, L["curse_warn_soon"], "Attention", nil, nil, true)
		self:Bar(L["curse_bar"], timer.curse, icon.curse, true, "Blue")
	elseif sync == syncName.doom and self.db.profile.doom then
		self:DelayedMessage(timer.doom - 5, L["doom_warn_soon"], "Attention", nil, nil, true)
		self:Bar(L["doom_bar"], timer.doom, icon.doom, true, "Black")
	elseif sync == syncName.shock and self.db.profile.shock then
	--self:Bar(L["shock_bar"], 6, "Spell_Shadow_Shadowbolt")
	elseif string.find(sync, syncName.mc) then
		if self.db.profile.mc then
			chosenone = string.sub(sync,17)
			if chosenone == UnitName("player") then
				self:Message(L["mindcontrol_message_you"], "Attention")
				self:Bar(string.format(L["mindcontrol_bar"], UnitName("player")), timer.mc, icon.mc, true, "Red")
			else
				self:Message(string.format(L["mindcontrol_message"], chosenone), "Urgent")
				self:Bar(string.format(L["mindcontrol_bar"], chosenone), timer.mc, icon.mc, true, "Red")
			end
		end
	elseif string.find(sync, syncName.mcEnd) then
		if self.db.profile.mc then
			luckyone = string.sub(sync,20)
			self:RemoveBar(string.format(L["mindcontrol_bar"], luckyone))
		end
	elseif sync == syncName.add and rest and rest ~= "" then
		rest = tonumber(rest)
		if rest <= 4 and self.protector < rest then
			self.protector = rest
			if self.db.profile.adds then
				self:Message(string.format(L["addmsg"], self.protector), "Positive")
			end
		end
	end
end
