
local module, L = BigWigs:ModuleDeclaration("Bloodlord Mandokir", "Zul'Gurub")

module.revision = 30012
module.enabletrigger = module.translatedName
module.toggleoptions = {"sounds", "bigicon", "sunder", "charge", "gaze", "announce", "puticon", "whirlwind", "enraged", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    ohgan = "Ohgan",
    cmd = "Mandokir",

    engage_trigger = "feed your souls to Hakkar himself",
    watch_trigger = "(.+)! I'm watching you!",
    gaze_trigger = "Bloodlord Mandokir begins to cast Threatening Gaze.",
    gazeafflictyou = "You are afflicted by Threatening Gaze.",
    gazeafflictother = "(.+) is afflicted by Threatening Gaze.",
    gazeendyou = "Threatening Gaze fades from you.",
    gazeendother = "Threatening Gaze fades from (.+).",
    gazecast = "即将威慑凝视！",
    gazewatchedbar = "威慑凝视：%s",
    enragegain = "Bloodlord Mandokir gains Enrage.",
    enragefade = "Enrage fades from Bloodlord Mandokir.",
    enragebar = "激怒",
    wwgain = "Bloodlord Mandokir gains Whirlwind.",
    wwloss = "Whirlwind fades from Bloodlord Mandokir.",
    ww = "旋风斩",
    deathyou = "You die.",
    deathother = "(.+) dies.",
    you = "you",
    gaze_warn = "凝视目标 ",

    sunder_trigger = "Sunder Armor %(5%)",
    sunder_warn = "破甲堆叠过多，寻求帮助！",

    watched_warning = "你正在被观察！停止一切动作！",
    watched_warning_tell = "你正在被观察！停止一切动作！",
    watched_warning_other = "%s 正在被观察！",
    enraged_message = "奥根倒下！曼多基尔激怒！",

    charge_trigger = "Bloodlord Mandokir's Charge",
    chargecd_bar = "冲锋冷却",

    announce_cmd = "whispers",
    announce_name = "密语被观察玩家",
    announce_desc = "当Boss使用威慑凝视时进行警告。\n\n(需要助理或更高权限)",

    bigicon_cmd = "bigicon",
    bigicon_name = "旋风斩和凝视大图标警告",
    bigicon_desc = "当旋风斩发生和凝视定位在你身上时显示大图标",

    sounds_cmd = "sounds",
    sounds_name = "凝视、5层破甲和旋风斩声音警告",
    sounds_desc = "声音警告凝视定位在你身上、你身上有5层破甲效果时以及旋风斩发生时。",

    puticon_cmd = "puticon",
    puticon_name = "标记被观察玩家",
    puticon_desc = "在被观察的人身上放置团队标志。\n\n(需要助理或更高权限)",

    charge_cmd = "charge",
    charge_name = "冲锋警报",
    charge_desc = "显示冲锋计时条",

    gaze_cmd = "gaze",
    gaze_name = "威慑凝视警报",
    gaze_desc = "显示威慑凝视计时条",

    whirlwind_cmd = "whirlwind",
    whirlwind_name = "旋风斩警报",
    whirlwind_desc = "显示旋风斩计时条",

    sunder_cmd = "sunder",
    sunder_name = "5层破甲效果警报",
    sunder_desc = "如果奥根的坦克身上有5层破甲效果，则发出警报。",

    enraged_cmd = "enraged",
    enraged_name = "激怒警报",
    enraged_desc = "通报Boss激怒",

    ["Possible Gaze"] = true,
    ["Charge"] = true,
    ["Next Whirlwind"] = true,
    ["Possible Gaze"] = "可能的凝视",
    ["Charge"] = "冲锋",
    ["Next Whirlwind"] = "下一次旋风斩",
} end )

L:RegisterTranslations("deDE", function() return {
	ohgan = "Ohgan",
	cmd = "Mandokir",

	engage_trigger = "feed your souls to Hakkar himself",
	watch_trigger = "(.+)! I'm watching you!",
	gaze_trigger = "Bloodlord Mandokir beginnt Bedrohlicher Blick zu wirken.",
	gazeafflictyou = "Ihr seid von Bedrohlicher Blick betroffen.",
	gazeafflictother = "(.+) ist von Bedrohlicher Blick betroffen.",
	gazeendyou = "'Bedrohlicher Blick' schwindet von Euch.",
	gazeendother = "Bedrohlicher Blick schwindet von (.+).",
	gazecast = "Bedrohlicher Blick kommt!",
	gazewatchedbar = "Bedrohlicher Blick: %s",
	enragegain = "Bloodlord Mandokir bekommt 'Wutanfall'.",
	enragefade = "Wutanfall schwindet von Bloodlord Mandokir.",
	enragebar = "Wutanfall",
	wwgain = "Bloodlord Mandokir bekommt 'Wirbelwind'.",
	wwloss = "Wirbelwind schwindet von Bloodlord Mandokir\.",
	ww = "Wirbelwind",
	deathyou = "Du stirbst.",
	deathother = "(.+) stirbt.",
	you = "Euch",

	watched_warning = "Du wirst beobachtet! Stoppen Sie alles!",
	watched_warning_tell = "You are being watched! Stop everything!",
	watched_warning_other = "%s wird beobachtet!",
	enraged_message = "Ohgan ist tot! Mandokir wütend!",

	announce_cmd = "whispers",
	announce_name = "Warnung, wenn Spieler beobachtet werden",
	announce_desc = "Warnen, wenn Bloodlord Mandokir wirft Bedrohlicher Blick\n\n(Benötigt Schlachtzugleiter oder Assistent)",

	puticon_cmd = "puticon",
	puticon_name = "Schlachtzugsymbol auf die beobachtet Spieler",
	puticon_desc = "Versetzt eine Schlachtzugsymbol auf der beobachteten Spieler.\n\n(Benötigt Schlachtzugleiter oder Assistent)",

	gaze_cmd = "gaze",
	gaze_name = "Alarm für Bedrohlicher Blick",
	gaze_desc = "Zeigt Balken für Bedrohlicher Blick",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Alarm für Wirbelwind",
	whirlwind_desc = "Zeigt Balken für Wirbelwind",

	enraged_cmd = "enraged",
	enraged_name = "Verkündet Boss' Raserei",
	enraged_desc = "Lässt dich wissen, wenn Boss härter zuschlägt",

	["Possible Gaze"] = "Mögliches Starren",
	["Charge"] = "Sturmangriff",
	["Next Whirlwind"] = "Wirbelwind",
} end )

L:RegisterTranslations("esES", function() return {
	ohgan = "Ohgan",
	--	cmd = "Mandokir",

	engage_trigger = "feed your souls to Hakkar himself",
	watch_trigger = "(.+)! I'm watching you!",
	gaze_trigger = "Señor sangriento Mandokir comienza a lanzar Mirada amenazante.",
	gazeafflictyou = "Sufres de Mirada amenazante.",
	gazeafflictother = "(.+) sufre de Mirada amenazante.",
	gazeendyou = "Mirada amenazante desaparece de ti.",
	gazeendother = "Mirada amenazante desaparece de (.+).",
	gazecast = "¡Mirada amenazante entrante!",
	gazewatchedbar = "Mirada amenazante: %s",
	enragegain = "Señor sangriento Mandokir gana Enfurecer.",
	enragefade = "Enfurecer desaparece de Señor sangriento Mandokir.",
	enragebar = "Enfurecer",
	wwgain = "Señor sangriento Mandokir gana Torbellino.",
	wwloss = "Torbellino desaparece de Señor sangriento Mandokir.",
	ww = "Torbellino",
	deathyou = "Has muerto.",
	deathother = "(.+) ha muerto.",
	you = "tu",

	watched_warning = "¡Estás siendo mirado! Detén todos!",
	watched_warning_tell = "¡Estás siendo mirado! Detén todos!",
	watched_warning_other = "¡%s está siendo mirado!",
	enraged_message = "¡Acabado con Ohgan! Mandokir enfurecido!",

	--announce_cmd = "whispers",
	announce_name = "Susurrar a los jugadores mirados",
	announce_desc = "Avisa cuando el jefe use Mirada amenazante.\n\n(Require asistente o líder)",

	--puticon_cmd = "puticon",
	puticon_name = "Marcar a los jugadores con Mirada amenazante",
	puticon_desc = "Marca con un icono el jugador con Mirada amenazante.\n\n(Require asistente o líder)",

	--gaze_cmd = "gaze",
	gaze_name = "Alerta de Mirada amenazante",
	gaze_desc = "Muestra una barra para Mirada amenazante",

	--whirlwind_cmd = "whirlwind",
	whirlwind_name = "Alerta de Torbellino",
	whirlwind_desc = "Muestra barras para Torbellino",

	--enraged_cmd = "enraged",
	enraged_name = "Alerta de Enfurecer",
	enraged_desc = "Anuncia cuando tenga Enfurecer el jefe",

	["Possible Gaze"] = "Mirada amenazante Posible",
	["Charge"] = "Embestir",
	["Next Whirlwind"] = "Próximo Torbellino",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-02-08
    ohgan = "奥根",
    cmd = "Mandokir",

    engage_trigger = "feed your souls to Hakkar himself",
    watch_trigger = "(.+)! I'm watching you!",
    gaze_trigger = "Bloodlord Mandokir begins to cast Threatening Gaze.",
    gazeafflictyou = "You are afflicted by Threatening Gaze.",
    gazeafflictother = "(.+) is afflicted by Threatening Gaze.",
    gazeendyou = "Threatening Gaze fades from you.",
    gazeendother = "Threatening Gaze fades from (.+).",
    gazecast = "即将威慑凝视！",
    gazewatchedbar = "威慑凝视：%s",
    enragegain = "Bloodlord Mandokir gains Enrage.",
    enragefade = "Enrage fades from Bloodlord Mandokir.",
    enragebar = "激怒",
    wwgain = "Bloodlord Mandokir gains Whirlwind.",
    wwloss = "Whirlwind fades from Bloodlord Mandokir.",
    ww = "旋风斩",
    deathyou = "You die.",
    deathother = "(.+) dies.",
    you = "你",
    gaze_warn = "凝视目标 ",

    sunder_trigger = "Sunder Armor %(5%)",
    sunder_warn = "破甲堆叠过多，寻求帮助！",

    watched_warning = "你正在被观察！停止一切动作！",
    watched_warning_tell = "你正在被观察！停止一切动作！",
    watched_warning_other = "%s 正在被观察！",
    enraged_message = "奥根倒下！曼多基尔激怒！",

    charge_trigger = "Bloodlord Mandokir's Charge",
    chargecd_bar = "冲锋冷却",

    announce_cmd = "whispers",
    announce_name = "密语被观察玩家",
    announce_desc = "当Boss使用威慑凝视时进行警告。\n\n(需要助理或更高权限)",

    bigicon_cmd = "bigicon",
    bigicon_name = "旋风斩和凝视大图标警告",
    bigicon_desc = "当旋风斩发生和凝视定位在你身上时显示大图标",

    sounds_cmd = "sounds",
    sounds_name = "凝视、5层破甲和旋风斩声音警告",
    sounds_desc = "声音警告凝视定位在你身上、你身上有5层破甲效果时以及旋风斩发生时。",

    puticon_cmd = "puticon",
    puticon_name = "标记被观察玩家",
    puticon_desc = "在被观察的人身上放置团队标志。\n\n(需要助理或更高权限)",

    charge_cmd = "charge",
    charge_name = "冲锋警报",
    charge_desc = "显示冲锋计时条",

    gaze_cmd = "gaze",
    gaze_name = "威慑凝视警报",
    gaze_desc = "显示威慑凝视计时条",

    whirlwind_cmd = "whirlwind",
    whirlwind_name = "旋风斩警报",
    whirlwind_desc = "显示旋风斩计时条",

    sunder_cmd = "sunder",
    sunder_name = "5层破甲效果警报",
    sunder_desc = "如果奥根的坦克身上有5层破甲效果，则发出警报。",

    enraged_cmd = "enraged",
    enraged_name = "激怒警报",
    enraged_desc = "通报Boss激怒",

    ["Possible Gaze"] = "可能的凝视",
    ["Charge"] = "冲锋",
    ["Next Whirlwind"] = "下一次旋风斩",
} end )

module.wipemobs = { L["ohgan"] }

local timer = {
	firstCharge = 15,
	charge = 34,
	firstWhirlwind = 20,
	firstGaze = 33,

	gaze = 20,
}
local icon = {
	charge = "Ability_Warrior_Charge",
	whirlwind = "Ability_Whirlwind",
	gaze = "Spell_Shadow_Charm",
}
local syncName = {
	whirlwind = "MandokirWWStart"..module.revision,
	whirlwindOver = "MandokirWWStop"..module.revision,
	enrage = "MandokirEnrageStart"..module.revision,
	enrageOver = "MandokirEnrageEnd"..module.revision,
	gazeCast = "MandokirGazeCast"..module.revision,
	gazeAfflicted = "MandokirGazeAfflict"..module.revision,
	gazeOver = "MandokirGazeEnd"..module.revision,
	charge = "MandokirCharge"..module.revision,
}

module:RegisterYellEngage(L["engage_trigger"])

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	
	self:ThrottleSync(5, syncName.whirlwind)
	self:ThrottleSync(5, syncName.whirlwindOver)
	self:ThrottleSync(5, syncName.enrage)
	self:ThrottleSync(5, syncName.enrageOver)
	self:ThrottleSync(5, syncName.gazeCast)
	self:ThrottleSync(5, syncName.gazeAfflicted)
	self:ThrottleSync(5, syncName.gazeOver)
	self:ThrottleSync(5, syncName.charge)
end

function module:OnSetup()
end

function module:OnEngage()
	self:Bar(L["chargecd_bar"], timer.firstCharge, icon.charge, true, "yellow")
	-- todo check combat log regarding CHARGE to trigger the ones following the first
	self:Bar(L["Next Whirlwind"], timer.firstWhirlwind, icon.whirlwind, true, "blue")
	self:Bar(L["Possible Gaze"], timer.firstGaze, icon.gaze, true, "red")
end

function module:OnDisengage()
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	local gazetime
	local _,_,watchedplayer,_ = string.find(msg, L["watch_trigger"])
	if watchedplayer then
		if self.db.profile.announce then
			if watchedplayer == UnitName("player") then
				self:Message(L["watched_warning"], "Personal", true, "Alarm", nil, "Beware")
			else
				self:Message(string.format(L["watched_warning_other"], watchedplayer), "Attention")
				self:TriggerEvent("BigWigs_SendTell", watchedplayer, L["watched_warning_tell"])
			end
		end
		if self.db.profile.puticon then
			self:Icon(watchedplayer)
		end
		if watchedplayer == UnitName("player") and self.db.profile.gaze then
			self:WarningSign(icon.gaze, 7)
		end
	end
end

function module:Event(msg)
	local _,_,gazedplayer,_ = string.find(msg, L["gazeafflictother"])
	local _,_,gazedplayerend,_ = string.find(msg, L["gazeendother"])
	--local _,_,gazeddeathend,_ = string.find(msg, L["deathother"])
	if msg == L["wwgain"] then
		self:Sync(syncName.whirlwind)
	elseif msg == L["wwloss"] then
		self:Sync(syncName.whirlwindOver)
	elseif string.find(msg, L["sunder_trigger"]) and self.db.profile.sunder then
		self:Sunder()
	elseif string.find(msg, L["charge_trigger"]) then
		self:Sync(syncName.charge)
	elseif msg == L["enragegain"] then
		self:Sync(syncName.enrage)
	elseif msg == L["enragefade"] then
		self:Sync(syncName.enrageOver)
	elseif msg == L["gaze_trigger"] then
		self:Sync(syncName.gazeCast)
	elseif msg == L["gazeafflictyou"] then
		self:Message(L["gaze_warn"].."you! STOP ALL ACTION!", "Urgent")
		if self.db.profile.sounds then
			self:Sound("Beware")
		end
		if self.db.profile.bigicon then
			self:WarningSign(icon.gaze, 7)
		end
		gazetime = GetTime()
		self:Sync(syncName.gazeAfflicted .. " " .. UnitName("player"))
	elseif gazedplayer then
		gazetime = GetTime()
		self:Sync(syncName.gazeAfflicted .. " " .. gazedplayer)
	elseif msg == L["gazeendyou"] then
		self:Sync(syncName.gazeOver .. " " .. UnitName("player"))
	elseif gazedplayerend and gazedplayerend ~= L["you"] then
		self:Sync(syncName.gazeOver .. " " .. gazedplayerend)
		--elseif msg == L["deathyou"] then
		--	self:Sync("MandokirGazeEnd "..UnitName("player"))
		--elseif gazeddeathend then
		--	self:Sync("MandokirGazeEnd "..gazeddeathend)
	end
end

function module:Sunder()
	self:Message(L["sunder_warn"], "Attention")
	if self.db.profile.sounds then
		self:Sound("stacks")
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.whirlwind and self.db.profile.whirlwind then
		self:Bar(L["ww"], 2, icon.whirlwind, true, "blue")
		--self:ScheduleEvent("BigWigs_StartBar", 2, self, "Next Whirlwind", 18, icon.whirlwind)
	elseif sync == syncName.whirlwindOver and self.db.profile.whirlwind then
		self:RemoveBar(L["ww"])
		self:Bar(L["Next Whirlwind"], 18, icon.whirlwind, true, "blue")
	elseif sync == syncName.enrage and self.db.profile.enraged then
		self:Message(L["enraged_message"], "Urgent")
		self:Bar(L["enragebar"], 90, "Spell_Shadow_UnholyFrenzy", true, "white")
	elseif sync == syncName.enrageOver and self.db.profile.enraged then
		self:RemoveBar(L["enragebar"])
	elseif sync == syncName.charge and self.db.profile.charge then
		self:Charge()
	elseif sync == syncName.gazeCast and self.db.profile.gaze then
		self:Bar(L["gazecast"], 2, icon.gaze, true, "red")
		self:RemoveBar(L["Possible Gaze"])
	elseif sync == syncName.gazeAfflicted and self.db.profile.gaze then
		self:Bar(string.format(L["gazewatchedbar"], rest), 6, icon.gaze, true, "red")
	elseif sync == syncName.gazeOver then
		if self.db.profile.gaze then
			self:RemoveBar(string.format(L["gazewatchedbar"], rest))
		end
		if self.db.profile.puticon then
			self:RemoveIcon(rest)
		end
		self:Bar(L["Possible Gaze"], timer.gaze-8, icon.gaze, true, "red")
	end
end

function module:Charge()
	self:RemoveBar(L["chargecd_bar"])
	self:Bar(L["chargecd_bar"], timer.charge, icon.charge, true, "yellow")
end
