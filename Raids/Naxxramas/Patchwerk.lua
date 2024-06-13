
local module, L = BigWigs:ModuleDeclaration("Patchwerk", "Naxxramas")

module.revision = 30012
module.enabletrigger = module.translatedName
module.toggleoptions = {"enrage", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Patchwerk",

    enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒时进行警告",
	
	trigger_start1 = "Patchwerk want to play!",
	trigger_start2 = "Kel'Thuzad make Patchwerk his Avatar of War!",
	
	trigger_enrage = "%s becomes enraged!",--CHAT_MSG_MONSTER_EMOTE
	
    bar_enrage = "激怒",
    msg_enrage60 = "60秒后激怒",
    msg_enrage10 = "10秒后激怒",
    msg_enrage = "激怒！",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Patchwerk",

	--enrage_cmd = "enrage",
	enrage_name = "Alerta de Enfurecer",
	enrage_desc = "Avisa para Enfurecer",

	enragetrigger = "%s goes into a berserker rage!",

	enragewarn = "¡Enfurecer!",
	starttrigger1 = "Patchwerk want to play!",
	starttrigger2 = "Kel'Thuzad make Patchwerk his Avatar of War!",
	startwarn = "¡Entrando en combate con Remendejo! Enfurecer en 7 minutos!",
	enragebartext = "Enfurecer",
	warn5m = "Enfurecer en 5 minutos",
	warn3m = "Enfurecer en 3 minutos",
	warn90 = "Enfurecer en 90 segundos",
	warn60 = "Enfurecer en 60 segundos",
	warn30 = "Enfurecer en 30 segundos",
	warn10 = "Enfurecer en 10 segundos",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-11
    cmd = "Patchwerk",

    enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒时进行警告",
	
	trigger_start1 = "Patchwerk want to play!",
	trigger_start2 = "Kel'Thuzad make Patchwerk his Avatar of War!",
	
	trigger_enrage = "%s becomes enraged!",--CHAT_MSG_MONSTER_EMOTE
	
    bar_enrage = "激怒",
    msg_enrage60 = "60秒后激怒",
    msg_enrage10 = "10秒后激怒",
    msg_enrage = "激怒！",
} end )

local timer = {
	enrage = 420,
}
local icon = {
	enrage = "Spell_Shadow_UnholyFrenzy",
}
local syncName = {
	enrage = "PatchwerkEnrage"..module.revision,
}

module:RegisterYellEngage(L["trigger_start1"])
module:RegisterYellEngage(L["trigger_start2"])

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Event")--enrage
	--self:RegisterEvent("CHAT_MSG_EMOTE", "Event")--test
	
	self:ThrottleSync(10, syncName.enrage)
end

function module:OnSetup()
	self.started = false
end

function module:OnEngage()
	if self.db.profile.enrage then
		self:Bar(L["bar_enrage"], timer.enrage, icon.enrage, true, "White")
		self:DelayedMessage(timer.enrage - 60, L["msg_enrage60"], "Urgent")
		self:DelayedMessage(timer.enrage - 10, L["msg_enrage10"], "Important")
	end
end

function module:OnDisengage()
end

function module:Event(msg)
	if msg == L["trigger_enrage"] then
		self:Sync(syncName.enrage)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.enrage and self.db.profile.enrage then
		self:Enrage()
	end
end

function module:Enrage()
	self:RemoveBar(L["bar_enrage"])
	self:CancelDelayedMessage(L["msg_enrage60"])
	self:CancelDelayedMessage(L["msg_enrage10"])
	
	self:Message(L["msg_enrage"], "Important", nil, "Beware")
	self:WarningSign(icon.enrage, 0.7)
end
