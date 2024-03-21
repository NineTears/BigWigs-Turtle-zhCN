
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Nefarian", "Blackwing Lair")
local victor = AceLibrary("Babble-Boss-2.2")["Lord Victor Nefarius"]

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
    engage_trigger = "Let the games begin!",
    landing_trigger = "Enough! Now you",
    landingNOW_trigger = "courage begins to wane",
    zerg_trigger = "Impossible! Rise my",
    fear_trigger = "Nefarian begins to cast Bellowing Roar",
    fear_over_trigger = "Bellowing Roar",
    shadowflame_trigger = "Nefarian begins to cast Shadow Flame",
    shadowcurseyou_trigger = "You are afflicted by Veil of Shadow\.",
    shadowcurseother_trigger = "(.+) is afflicted by Veil of Shadow\.",

    triggerfear = "by Panic.",
    land = "Estimated Landing",
    Mob_Spawn = "Mob Spawn",
    fear_warn = "现在恐惧！",

    triggershamans	= "Shamans, show me",
    triggerdruid	= "Druids and your silly",
    triggerwarlock	= "Warlocks, you shouldn't be playing",
    triggerpriest	= "Priests! If you're going to keep",
    triggerhunter	= "Hunters and your annoying",
    triggerwarrior	= "Warriors, I know you can hit harder",
    triggerrogue	= "Rogues%? Stop hiding",
    triggerpaladin	= "Paladins",
    triggermage		= "Mages too%?",

    landing_warning = "奈法利安即将落地！",
    zerg_warning = "骨肉傀儡来袭！",
    fear_warning = "2秒后恐惧！",
    fear_soon_warning = "大约5秒后可能恐惧",
    shadowflame_warning = "暗影烈焰来袭！",
    shadowflame_bar = "暗影烈焰",
    classcall_warning = "即将职业点名！",

    warnshaman	= "萨满 - 图腾已经出现！",
    warndruid	= "德鲁伊 - 卡在猎豹形态！",
    warnwarlock	= "术士 - 地狱火即将来临！",
    warnpriest	= "牧师 - 治疗会造成伤害！",
    warnhunter	= "猎人 - 弓/枪损坏！",
    warnwarrior	= "战士 - 卡在狂暴姿态！",
    warnrogue	= "潜行者 - 被传送和定住！",
    warnpaladin	= "圣骑士 - 保护祝福！",
    warnmage	= "法师 - 变形术来临！",

    classcall_bar = "职业点名",
    fear_bar = "可能恐惧",

    curse_bar = "暗影迷雾",

    cmd = "Nefarian",

    shadowflame_cmd = "shadowflame",
    shadowflame_name = "暗影烈焰警报",
    shadowflame_desc = "暗影烈焰进行警告",

    fear_cmd = "fear",
    fear_name = "恐惧警告",
    fear_desc = "奈法利安施放恐惧时进行警告",

    classcall_cmd = "classcall",
    classcall_name = "职业点名警报",
    classcall_desc = "职业点名进行警告",

    otherwarn_cmd = "otherwarn",
    otherwarn_name = "其他警报",
    otherwarn_desc = "落地和骨肉傀儡进行警告",

    curse_cmd = "curse",
    curse_name = "暗影迷雾",
    curse_desc = "显示暗影迷雾的计时条。",

    mc_cmd = "mc",
    mc_name = "精神控制警报",
    mc_desc = "精神控制警告",
    mcwarn = "正在施放精神控制！",
    mcplayer = "^([^%s]+) ([^%s]+) afflicted by Shadow Command.$",
    mcplayerwarn = " 被精神控制了！",
    mcyou = "you",
    mcare = "are",

    -- nef counter
    ["NefCounter_Trigger"] = "^([%w ]+) dies.",

    ["NefCounter_RED"] = "红色龙崽",
    ["NefCounter_GREEN"] = "绿色龙崽",
    ["NefCounter_BLUE"] = "蓝色龙崽",
    ["NefCounter_BRONZE"] = "青铜龙崽",
    ["NefCounter_BLACK"] = "黑色龙崽",
    ["NefCounter_CHROMATIC"] = "多彩龙崽",
    ["Drakonids dead"] = true,
    ["Drakonids dead"] = "龙崽已死亡",
} end)

L:RegisterTranslations("esES", function() return {
	engage_trigger = "Let the games begin!",
	landing_trigger = "Enough! Now you",
	landingNOW_trigger = "courage begins to wane",
	zerg_trigger = "Impossible! Rise my",
	fear_trigger = "Nefarian comienza a lanzar Clamor bramante",
	fear_over_trigger = "Clamor bramante",
	shadowflame_trigger = "Nefarian comienza a lanzar Llama de las Sombras",
	shadowcurseyou_trigger = "Sufres de Velo de Sombras\.",
	shadowcurseother_trigger = "(.+) sufre de Velo de Sombras\.",

	triggerfear = "por Pánico.",
	land = "Aterrizaje Estimado",
	Mob_Spawn = "Aparecen los Dracónidos",
	fear_warn = "¡Miedo AHORA!",

	triggershamans	= "Shamans, show me",
	triggerdruid	= "Druids and your silly",
	triggerwarlock	= "Warlocks, you shouldn't be playing",
	triggerpriest	= "Priests! If you're going to keep",
	triggerhunter	= "Hunters and your annoying",
	triggerwarrior	= "Warriors, I know you can hit harder",
	triggerrogue	= "Rogues%? Stop hiding",
	triggerpaladin	= "Paladins",
	triggermage	= "Mages too%?",

	landing_warning = "¡Nefarian está aterrizando!",
	zerg_warning = "¡Zerg entrante!",
	fear_warning = "¡Miedo en 2 segundos!",
	fear_soon_warning = "Miedo posible en ~5 segundos",
	shadowflame_warning = "¡Llama de las Sombras entrante!",
	shadowflame_bar = "Llama de las Sombras",
	classcall_warning = "¡Llamada de Clase entrante!",

	warnshaman	= "¡Chamanes - Aparecen los Tótems!",
	warndruid	= "¡Druidas -  No puedes cambiar de Forma felina!",
	warnwarlock	= "¡Brujos - Infernales entrantes!",
	warnpriest	= "¡Sacerdotes - Hace daño la curación!",
	warnhunter	= "¡Cazadores - Arco/Armas de fuego rotos!",
	warnwarrior	= "¡Guerreros - No puedes cambiar de Actitud rabiosa!",
	warnrogue	= "¡Pícaros - Teletransportado y arraigado!",
	warnpaladin	= "¡Paladines - Bendición de Protección!",
	warnmage	= "¡Magos - Polimorfia entrante!",

	classcall_bar = "Llamada de Clase",
	fear_bar = "Miedo posible",

	curse_bar = "Velo de Sombras",

	--cmd = "Nefarian",

	--shadowflame_cmd = "shadowflame",
	shadowflame_name = "Alerta de Llama de las Sombras",
	shadowflame_desc = "Avisa para Llama de las Sombras",

	--fear_cmd = "fear",
	fear_name = "Alerta para Miedo",
	fear_desc = "Avisa cuando Nefarian lance Clamor bramante",

	--classcall_cmd = "classcall",
	classcall_name = "Alerta de Llamada de Clase",
	classcall_desc = "Avisa para Llamada de Clase",

	--otherwarn_cmd = "otherwarn",
	otherwarn_name = "Otras alertas",
	otherwarn_desc = "Avisa para Aterrizaje y Zerg",

	--curse_cmd = "curse",
	curse_name = "Velo de Sombras",
	curse_desc = "Muestra una barra temporizadora para Velo de Sombras.",

	--mc_cmd = "mc",
	mc_name = "Alerta de Control mental",
	mc_desc = "Avisa para Control mental",
	mcwarn = "¡Se lanza Control mental!",
	mcplayer = "^([^%s]+) ([^%s]+) sufre de Orden de las Sombras.$",
	mcplayerwarn = " está controlado por mente!",
	mcyou = "Tu",
	mcare = "estás",

	-- nef counter
	["NefCounter_Trigger"] = "^([%w ]+) ha muerto.",

	["NefCounter_RED"] = "Dracónido rojo",
	["NefCounter_GREEN"] = "Dracónido verde",
	["NefCounter_BLUE"] = "Dracónido azul",
	["NefCounter_BRONZE"] = "Dracónido de bronce",
	["NefCounter_BLACK"] = "Dracónido negro",
	["NefCounter_CHROMATIC"] = "Dracónido cromático",
	["Drakonids dead"] = "Dracónidos muertos",
} end)

L:RegisterTranslations("deDE", function() return {
	engage_trigger = "Lasst die Spiele beginnen!",
	landing_trigger = "GENUG! Nun sollt ihr Ungeziefer",
	landingNOW_trigger = "Der Mut der Sterblichen scheint zu schwinden",
	zerg_trigger = "Unmöglich! Erhebt Euch, meine Diener!",
	fear_trigger = "Nefarian beginnt Dröhnendes Gebrüll zu wirken.",
	fear_over_trigger = "Dröhnendes Gebrüll",
	shadowflame_trigger = "Nefarian beginnt Schattenflamme zu wirken.",

	triggerfear = "von Panik",
	land = "Estimated Landing",
	Mob_Spawn = "Mob Spawn",
	fear_warn = "Furcht JETZT!",

	triggershamans	= "Schamane",
	triggerdruid	= "Druiden",
	triggerwarlock	= "Hexenmeister",
	triggerpriest	= "Priester",
	triggerhunter	= "Jäger",
	triggerwarrior	= "Krieger",
	triggerrogue	= "Schurken",
	triggerpaladin	= "Paladine",
	triggermage		= "Magier",

	landing_warning = "Nefarian landet!",
	zerg_warning = "Zerg kommt!",
	fear_warning = "Furcht in 2s!",
	fear_soon_warning = "Mögliche Furcht in 5s",
	shadowflame_warning = "Schattenflamme!",
	shadowflame_bar = "Schattenflamme",
	classcall_warning = "Classcall",

	warnshaman	= "Schamanen - Totems spawned!",
	warndruid	= "Druiden - stecken in Katzenform!",
	warnwarlock	= "Hexenmeister - Infernals!",
	warnpriest	= "Priester - Heilung schmerzt!",
	warnhunter	= "Jäger - Bogen/Gewehr kaputt!",
	warnwarrior	= "Krieger - stecken in Berserkerhaltung!",
	warnrogue	= "Schurken - teleportiert und gewurzelt!",
	warnpaladin	= "Paladine - Segen des Schutzes!",
	warnmage	= "Magier - polymorphs!",

	classcall_bar = "Classcall",
	fear_bar = "Mögliche Furcht",

	--cmd = "Nefarian",

	--shadowflame_cmd = "shadowflame",
	shadowflame_name = "Schattenflamme Warnung",
	shadowflame_desc = "Warnt vor Schattenflamme",

	--fear_cmd = "fear",
	fear_name = "Furcht Warnung",
	fear_desc = "Warnt wenn Nefarian die AoE Furcht zaubert",

	--classcall_cmd = "classcall",
	classcall_name = "Klassenruf Warnung",
	classcall_desc = "Warn for Class Calls",

	--otherwarn_cmd = "otherwarn",
	otherwarn_name = "Other alerts",
	otherwarn_desc = "Landing and Zerg warnings",

	--mc_cmd = "mc",
	mc_name = "Mind Control Alert",
	mc_desc = "Warn for Mind Control",
	mcwarn = "Gedankencontrolle!",
	mcplayer = "^([^%s]+) ([^%s]+) von Schattenbefehl betroffen.",
	mcplayerwarn = " ist gedankenkontrolliert.",
	mcyou = "Ihr",
	mcare = "seid",

	-- nef counter
	["NefCounter_Trigger"] = "^([%w ]+) stirbt.",

	["NefCounter_RED"] = "Roter Drakonid",
	["NefCounter_GREEN"] = "Grüner Drakonid",
	["NefCounter_BLUE"] = "Blauer Drakonid",
	["NefCounter_BRONZE"] = "Bronzener Drakonid",
	["NefCounter_BLACK"] = "Schwarzer Drakonid",
	["NefCounter_CHROMATIC"] = "Chromatischer Drakonid",
	["Drakonids dead"] = "Drakonide total",
} end)

L:RegisterTranslations("zhCN", function() return {
    engage_trigger = "Let the games begin!",
    landing_trigger = "Enough! Now you",
    landingNOW_trigger = "courage begins to wane",
    zerg_trigger = "Impossible! Rise my",
    fear_trigger = "Nefarian begins to cast Bellowing Roar",
    fear_over_trigger = "Bellowing Roar",
    shadowflame_trigger = "Nefarian begins to cast Shadow Flame",
    shadowcurseyou_trigger = "You are afflicted by Veil of Shadow\.",
    shadowcurseother_trigger = "(.+) is afflicted by Veil of Shadow\.",

    triggerfear = "by Panic.",
    land = "Estimated Landing",
    Mob_Spawn = "Mob Spawn",
    fear_warn = "现在恐惧！",

    triggershamans	= "Shamans, show me",
    triggerdruid	= "Druids and your silly",
    triggerwarlock	= "Warlocks, you shouldn't be playing",
    triggerpriest	= "Priests! If you're going to keep",
    triggerhunter	= "Hunters and your annoying",
    triggerwarrior	= "Warriors, I know you can hit harder",
    triggerrogue	= "Rogues%? Stop hiding",
    triggerpaladin	= "Paladins",
    triggermage		= "Mages too%?",

    landing_warning = "奈法利安即将落地！",
    zerg_warning = "骨肉傀儡来袭！",
    fear_warning = "2秒后恐惧！",
    fear_soon_warning = "大约5秒后可能恐惧",
    shadowflame_warning = "暗影烈焰来袭！",
    shadowflame_bar = "暗影烈焰",
    classcall_warning = "即将职业点名！",

    warnshaman	= "萨满 - 图腾已经出现！",
    warndruid	= "德鲁伊 - 卡在猎豹形态！",
    warnwarlock	= "术士 - 地狱火即将来临！",
    warnpriest	= "牧师 - 治疗会造成伤害！",
    warnhunter	= "猎人 - 弓/枪损坏！",
    warnwarrior	= "战士 - 卡在狂暴姿态！",
    warnrogue	= "潜行者 - 被传送和定住！",
    warnpaladin	= "圣骑士 - 保护祝福！",
    warnmage	= "法师 - 变形术来临！",

    classcall_bar = "职业点名",
    fear_bar = "可能恐惧",

    curse_bar = "暗影迷雾",

    cmd = "Nefarian",

    shadowflame_cmd = "shadowflame",
    shadowflame_name = "暗影烈焰警报",
    shadowflame_desc = "暗影烈焰进行警告",

    fear_cmd = "fear",
    fear_name = "恐惧警告",
    fear_desc = "奈法利安施放恐惧时进行警告",

    classcall_cmd = "classcall",
    classcall_name = "职业点名警报",
    classcall_desc = "职业点名进行警告",

    otherwarn_cmd = "otherwarn",
    otherwarn_name = "其他警报",
    otherwarn_desc = "落地和骨肉傀儡进行警告",

    curse_cmd = "curse",
    curse_name = "暗影迷雾",
    curse_desc = "显示暗影迷雾的计时条。",

    mc_cmd = "mc",
    mc_name = "精神控制警报",
    mc_desc = "精神控制警告",
    mcwarn = "正在施放精神控制！",
    mcplayer = "^([^%s]+) ([^%s]+) afflicted by Shadow Command.$",
    mcplayerwarn = " 被精神控制了！",
    mcyou = "你",
    mcare = "受到了",

    -- nef counter
    ["NefCounter_Trigger"] = "^([%w ]+) dies.",

    ["NefCounter_RED"] = "红色龙崽",
    ["NefCounter_GREEN"] = "绿色龙崽",
    ["NefCounter_BLUE"] = "蓝色龙崽",
    ["NefCounter_BRONZE"] = "青铜龙崽",
    ["NefCounter_BLACK"] = "黑色龙崽",
    ["NefCounter_CHROMATIC"] = "多彩龙崽",
    ["Drakonids dead"] = "龙崽已死亡",
} end)

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20005 -- To be overridden by the module!
module.enabletrigger = {boss, victor} -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"curse", "mc", "shadowflame", "fear", "classcall", "otherwarn", "bosskill"}


-- locals
local timer = {
	mobspawn = 10,
	earliestClasscall = 25,
	latestClasscall = 35,
	mc = 15,
	shadowflame = 18,
	shadowflameCast = 2,
	earliestFear = 25,
	latestFear = 30,
	fearCast = 1.5,
	landing = 13,
	firstClasscall = 25,
	--firstFear = 25,
	firstCurse = 15,
	earliestCurse = 10,
	latestCurse = 15,
}
local icon = {
	mobspawn = "Spell_Holy_PrayerOfHealing",
	classcall = "Spell_Shadow_Charm",
	mc = "Spell_Shadow_Charm",
	fear = "Spell_Shadow_Possession",
	shadowflame = "Spell_Fire_Incinerate",
	landing = "INV_Misc_Head_Dragon_Black",
	curse = "Spell_Shadow_GatherShadows"
}
local syncName = {
	shadowflame = "NefarianShadowflame"..module.revision,
	fear = "NefarianFear"..module.revision,
	landing = "NefarianLandingNOW"..module.revision,
	addDead = "NefCounter"..module.revision,
	curse = "NefarianCurse"..module.revision
}


local warnpairs = nil
local nefCounter = nil
local nefCounterMax = 42 -- how many adds have to be killed to trigger phase 2?


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["engage_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")

	if not warnpairs then
		warnpairs = {
			[L["triggershamans"]] = {L["warnshaman"], true},
			[L["triggerdruid"]] = {L["warndruid"], true},
			[L["triggerwarlock"]] = {L["warnwarlock"], true},
			[L["triggerpriest"]] = {L["warnpriest"], true},
			[L["triggerhunter"]] = {L["warnhunter"], true},
			[L["triggerwarrior"]] = {L["warnwarrior"], true},
			[L["triggerrogue"]] = {L["warnrogue"], true},
			[L["triggerpaladin"]] = {L["warnpaladin"], true},
			[L["triggermage"]] = {L["warnmage"], true},
			[L["landing_trigger"]] = {L["landing_warning"]},
			[L["zerg_trigger"]] = {L["zerg_warning"]},
		}
	end

	self:ThrottleSync(10, syncName.shadowflame)
	self:ThrottleSync(15, syncName.fear)
	self:ThrottleSync(0, syncName.addDead)
	self:ThrottleSync(5, syncName.curse)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	self.phase2 = nil
	nefCounter = 0

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

-- called after boss is engaged
function module:OnEngage()
	self:Bar(L["Mob_Spawn"], timer.mobspawn, icon.mobspawn)

	self:TriggerEvent("BigWigs_StartCounterBar", self, L["Drakonids dead"], nefCounterMax, "Interface\\Icons\\inv_egg_01", true, "Cyan")
	self:TriggerEvent("BigWigs_SetCounterBar", self, L["Drakonids dead"], (nefCounterMax - 0.1))
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------
function module:Event(msg)
	local _,_,shadowcurseother,_ = string.find(msg, L["shadowcurseother_trigger"])
	if string.find(msg, L["shadowcurseyou_trigger"]) then
		self:Sync(syncName.curse)
	elseif shadowcurseother then
		self:Sync(syncName.curse)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	local _, _, drakonid = string.find(msg, L["NefCounter_Trigger"])
	if drakonid and L:HasReverseTranslation(drakonid) then
		--self:OnKill(L:GetReverseTranslation(drakonid))
		--nefCounter = nefCounter + 1
		self:DebugMessage("Drakonids dead: " .. tostring(nefCounter + 1) .. " Name: " .. drakonid)
		self:Sync(syncName.addDead .. " " .. tostring(nefCounter + 1))
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["engage_trigger"]) and not self.engaged then
		self:DebugMessage("SendEngageSync")
		self:SendEngageSync()
	end
	if string.find(msg, L["landingNOW_trigger"]) then
		self:Sync(syncName.landing)
	end

	for i,v in pairs(warnpairs) do
		if string.find(msg, i) then
			if v[2] then
				if self.db.profile.classcall then
					for k,w in pairs(warnpairs) do
						self:RemoveBar(w[1])
					end
					self:RemoveBar(L["classcall_bar"])
					local localizedClass, englishClass = UnitClass("player");
					if string.find(msg, localizedClass) then
						self:Message(v[1], "Core", nil, "Beware")
						self:WarningSign(icon.classcall, 3)
					else
						self:Message(v[1], "Core", nil, "Long")
					end

					self:IntervalBar(v[1], timer.earliestClasscall, timer.latestClasscall, icon.classcall)
					self:DelayedMessage(timer.earliestClasscall - 3, L["classcall_warning"], "Important")
					self:DelayedSound(timer.earliestClasscall - 3, "Three")
					self:DelayedSound(timer.earliestClasscall - 2, "Two")
					self:DelayedSound(timer.earliestClasscall - 1, "One")
				end
			else
				if self.db.profile.otherwarn and string.find(msg, L["landing_trigger"]) then
				--self:Message(v[1], "Important", true, "Long")  --- threw this when boss was 5%
				elseif self.db.profile.otherwarn and string.find(msg, L["zerg_trigger"]) then
					self:Message(v[1], "Important", true, "Long")
				end
			end
			return
		end
	end
end

-- mind control
function module:CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE(arg1)
	local _,_, player, type = string.find(arg1, L["mcplayer"])
	if player and type then
		if player == L["mcyou"] and type == L["mcare"] then
			player = UnitName("player")
		end
		if self.db.profile.mc then
			self:Message(player .. L["mcplayerwarn"], "Important")
			self:Bar(player .. L["mcplayerwarn"], timer.mc, icon.mc, "Orange")
		end
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if string.find(msg, L["fear_trigger"]) then
		self:Sync(syncName.fear)
	elseif string.find(msg, L["shadowflame_trigger"]) then
		self:Sync(syncName.shadowflame)
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if string.find(msg, L["fear_over_trigger"]) then
	--self:RemoveWarningSign(icon.fear)
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.shadowflame then
		self:Shadowflame()
	elseif sync == syncName.fear then
		self:Fear()
	elseif sync == syncName.landing then
		self:Landing()
	elseif sync == syncName.addDead and rest then
		self:NefCounter(rest)
	elseif sync == syncName.curse then
		self:Curse()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------
function module:Curse()
	if self.db.profile.curse then
		self:IntervalBar(L["curse_bar"], timer.earliestCurse, timer.latestCurse, icon.curse, true, "yellow")
	end
end

function module:Shadowflame()
	if self.db.profile.shadowflame then
		self:Bar(L["shadowflame_bar"], timer.shadowflameCast, icon.shadowflame, true, "Red") -- show cast bar
		self:Message(L["shadowflame_warning"], "Important", true, "Alarm")
		self:DelayedBar(timer.shadowflameCast, L["shadowflame_bar"], timer.shadowflame-timer.shadowflameCast, icon.shadowflame, true, "Blue") -- delayed timer bar
	end
end

function module:Fear()
	if self.db.profile.fear then
		self:RemoveBar(L["fear_bar"]) -- remove timer bar
		self:Message(L["fear_warning"], "Important", true, "Alert")
		self:Bar(L["fear_warn"], timer.fearCast, icon.fear, true, "Black") -- show cast bar
		self:DelayedIntervalBar(timer.fearCast, L["fear_bar"], timer.earliestFear, timer.latestFear, icon.fear, true, "Black") -- delayed timer bar
		--self:WarningSign(icon.fear, 5)
	end
end

function module:Landing()
	if not self.phase2 then
		self.phase2 = true
		self:RemoveBar(L["land"])
		self:TriggerEvent("BigWigs_StopCounterBar", self, L["Drakonids dead"])

		self:Bar(L["landing_warning"], timer.landing, icon.landing, true, "White")
		self:Message(L["landing_warning"], "Important", nil, "Beware")

		-- landing in 15s
		self:DelayedIntervalBar(timer.landing, L["classcall_bar"], timer.earliestClasscall, timer.latestClasscall, icon.classcall, true, "White")
		self:DelayedIntervalBar(timer.landing, L["fear_bar"], timer.earliestFear, timer.latestFear, icon.fear, true, "Black")
		self:DelayedBar(timer.landing, L["curse_bar"], timer.firstCurse, icon.curse, true, "yellow")

	end
end

function module:NefCounter(n)
	n = tonumber(n)
	if not self.phase2 and n == (nefCounter + 1) and nefCounter <= nefCounterMax then
		nefCounter = nefCounter + 1
		--[[if self.db.profile.adds then
		self:Message(string.format(L["add_message"], nefCounter), "Positive")
		end]]
		self:TriggerEvent("BigWigs_SetCounterBar", self, L["Drakonids dead"], (nefCounterMax - nefCounter), true, "cyan")
	end
end
