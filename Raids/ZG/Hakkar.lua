
local module, L = BigWigs:ModuleDeclaration("Hakkar", "Zul'Gurub")

module.revision = 30046
module.enabletrigger = module.translatedName
module.toggleoptions = {"mc", "siphon", "enrage", -1, "aspectjeklik", "aspectvenoxis", "aspectmarli", "aspectthekal", "aspectarlokk", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Hakkar",

    siphon_cmd = "siphon",
    siphon_name = "血液虹吸",
    siphon_desc = "显示哈卡血液虹吸的计时条、警告和计时器。",

    enrage_cmd = "enrage",
    enrage_name = "激怒",
    enrage_desc = "当10分钟时间到了之后通知你！",

    mc_cmd = "mc",
    mc_name = "精神控制",
    mc_desc = "当玩家被精神控制时进行警告",

    aspectjeklik_cmd = "aspectjeklik",
    aspectjeklik_name = "耶克里克的守护",
    aspectjeklik_desc = "当高阶祭司耶克里克在场时，哈卡获得额外能力时提醒。",

    aspectvenoxis_cmd = "aspectvenoxis",
    aspectvenoxis_name = "温诺希斯的守护",
    aspectvenoxis_desc = "当高阶祭司温诺希斯在场时，哈卡获得额外能力时提醒。",

    aspectmarli_cmd = "aspectmarli",
    aspectmarli_name = "玛尔里的守护",
    aspectmarli_desc = "当高阶祭司玛尔里在场时，哈卡获得额外能力时提醒。",

    aspectthekal_cmd = "aspectthekal",
    aspectthekal_name = "塞卡尔的守护",
    aspectthekal_desc = "当高阶祭司塞卡尔在场时，哈卡获得额外能力时提醒。",

    aspectarlokk_cmd = "aspectarlokk",
    aspectarlokk_name = "娅尔罗的守护",
    aspectarlokk_desc = "当高阶祭司娅尔罗在场时，哈卡获得额外能力时提醒。",



    engage_trigger = "FACE THE WRATH OF THE SOULFLAYER!",

    enrage1minute_message = "1分钟后激怒！",
    enrageseconds_message = "%d秒后激怒！",
    enrage_bar = "激怒",

    mindcontrolyou_trigger = "You are afflicted by Cause Insanity.",
    mindcontrolother_trigger = "(.+) is afflicted by Cause Insanity.",
    trigger_mindcontrolTotem = "Hakkar's Cause Insanity fails. Grounding Totem is immune.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE
    mindcontrol_message = "%s 被精神控制了！",
    mindcontrol_message_you = "你被精神控制了！",
    mindcontrol_bar = "精神控制：%s",
    firstmc_bar = "首次精神控制",
    nextmc_bar = "下一次精神控制",

    siphon_trigger = "Hakkar gains Blood Siphon.",
    siphon_warning = "%d秒后血液虹吸！",
    siphon_bar = "血液虹吸",
    siphon_message = "血液虹吸 - 下一次在90秒后！",

    --poisonousblood_trigger = "You are afflicted by Poisonous Blood.",

    aspectofthekal_trigger = "Hakkar gains Aspect of Thekal.",
    aspectofthekalend_trigger = "Aspect of Thekal fades from Hakkar.",
    aspectthekalnext_bar = "下一次狂乱",
    aspectthekal_bar = "狂乱 - 塞卡尔的守护",
    aspectthekal_ann = "狂乱了！现在使用宁神射击！",

    aspectofmarliyou_trigger = "You are afflicted by Aspect of Mar'li.",
    aspectofmarliother_trigger = "(.+) is afflicted by Aspect of Mar'li.",
    trigger_aspectOfMarliFail = "Hakkar's Aspect of Mar'li",
    aspectmarli_bar = "下一次昏迷",
    aspectmarlidebuff_bar = "昏迷：%s - 玛尔里的守护",

    trigger_aspectOfJeklik = "afflicted by Aspect of Jeklik.",
    trigger_aspectOfJeklikFail = "Hakkar's Aspect of Jeklik",
    aspectjeklik_bar = "下一次沉默",
    aspectjeklikdebuff_bar = "沉默 - 耶克里克的守护",

    aspectofarlokkyou_trigger = "You are afflicted by Aspect of Arlokk.",
    aspectofarlokkother_trigger = "(.+) is afflicted by Aspect of Arlokk.",
    trigger_aspectOfArlokkFail = "Hakkar's Aspect of Arlokk",
    aspectarlokk_bar = "下一次消失",
    aspectarlokkdebuff_bar = "消失：%s - 娅尔罗的守护",

    trigger_aspectOfVenoxis = "Hakkar's Aspect of Venoxis hit",
    trigger_aspectOfVenoxisFail = "Hakkar's Aspect of Venoxis was resisted",
    aspectvenoxis_bar = "下一次毒液 - 温诺希斯的守护",
    --aspectvenoxisdebuff_bar = "毒液 - 温诺希斯的守护",
    grounded = "Grounded!",
} end)

L:RegisterTranslations("esES", function() return {
	engage_trigger = "FACE THE WRATH OF THE SOULFLAYER!",
	siphon_trigger = "Hakkar gana Succión de sangre.",
	poisonousblood_trigger = "Sufres de Sangre envenenada.",
	mindcontrolyou_trigger = "Sufres de Provocar locura.",
	mindcontrolother_trigger = "(.+) sufre de Provocar locura.",
	flee_trigger = "Fleeing will do you no good, mortals!",
	aspectofthekal_trigger = "Hakkar gana Aspecto de Thekal.",
	aspectofthekalend_trigger = "Aspecto de Thekal desaparece de Hakkar.",
	aspectofmarliyou_trigger = "Sufres de Aspecto de Mar'li.",
	aspectofmarliyouimmune_trigger = "Aspecto de Mar'li de Hakkar ha fallado. Eres inmune.",
	aspectofmarliother_trigger = "(.+) sufre de Aspecto de Mar'li.",
	aspectofmarliotherimmune_trigger = "Aspecto de Mar'li de Hakkar ha fallado. (.+) es inmune.",
	aspectofmarligeneralavoid_trigger = "Aspecto de Mar'li de Hakkar",
	aspectofjeklikyou_trigger = "Sufres de Aspecto de Jeklik.",
	aspectofjeklikyouimmune_trigger = "Aspecto de Jeklik de Hakkar ha fallado. Eres inmune.",
	aspectofjeklikother_trigger = "(.+) sufre de Aspecto de Jeklik.",
	aspectofjeklikotherimmune_trigger = "Aspecto de Jeklik de Hakkar ha fallado. (.+) es inmune.",
	aspectofjeklikgeneralavoid_trigger = "Aspecto de Jeklik de Hakkar",
	aspectofarlokkyou_trigger = "Sufres de Aspecto de Arlokk.",
	aspectofarlokkyouimmune_trigger = "Aspecto de Arlokk de Hakkar ha fallado. Eres inmune.",
	aspectofarlokkother_trigger = "(.+) sufre de Aspecto de Arlokk.",
	aspectofarlokkotherimmune_trigger = "Aspecto de Arlokk de Hakkar ha fallado. (.+) es inmune.",
	aspectofarlokkgeneralavoid_trigger = "Aspecto de Arlokk de Hakkar",
	aspectofvenoxisyou_trigger = "Aspecto de Venoxis te lanza Hakkar y te inflige",
	aspectofvenoxisyouresist_trigger = "Resistido Aspecto de Venoxis de Hakkar.",
	aspectofvenoxisother_trigger = "Aspecto de Venoxis de Hakkar impacta",
	aspectofvenoxisotherresist_trigger = "Ha resistido Aspecto de Venoxis de Hakkar",

	siphon_warning = "¡Succión de sangre en %d segundos!",
	siphon_message = "¡Succión de sangre - la próxima en 90 segundos!",
	enrage5minutes_message = "¡Enfurecer en 5 minutos!",
	enrage1minute_message = "¡Enfurecer en 1 minuto!",
	enrageseconds_message = "¡Enfurecer en %d segundos!",

	mindcontrol_message = "¡%s está controlado por mente!",
	mindcontrol_message_you = "¡Estás controlado por mente!",
	mindcontrol_bar = "Provocar locura: %s",
	firstmc_bar = "Primer Provocar locura",
	nextmc_bar = "Próximo Provocar locura",
	enrage_bar = "Enfurecer",
	siphon_bar = "Succión de sangre",
	aspectthekalnext_bar = "Próximo Frenesí",
	aspectthekal_bar = "Frenesí - Aspecto de Thekal",
	aspectthekal_ann = "¡Frenesí! Disparo tranquilizante ahora!",
	aspectmarli_bar = "Próxima Aturde",
	aspectmarlidebuff_bar = "Aturde: %s - Aspecto de Mar'li",
	aspectjeklik_bar = "Próximo silencio",
	aspectjeklikdebuff_bar = "Silencio - Aspecto de Jeklik",
	aspectarlokk_bar = "Próximo Esfumar",
	aspectarlokkdebuff_bar = "Esfumar: %s - Aspecto de Arlokk",
	aspectvenoxis_bar = "Próximo Veneno",
	aspectvenoxisdebuff_bar = "Veneno - Aspecto de Venoxis",

	--cmd = "Hakkar",

	--siphon_cmd = "siphon",
	siphon_name = "Succión de sangre",
	siphon_desc = "Muestra barras, advertencias y temporizadores para Succión de sangre de Hakkar.",

	--enrage_cmd = "enrage",
	enrage_name = "Enfurecer",
	enrage_desc = "Avisa cuando ha pasado 10 minutos",

	--mc_cmd = "mc",
	mc_name = "Provocar locura",
	mc_desc = "Avisa cuando los jugadores tengan Provocar locura.",

	--aspectjeklik_cmd = "aspectjeklik",
	aspectjeklik_name = "Aspecto de Jeklik",
	aspectjeklik_desc = "Avisa para la habilidad que gane Hakkar cuando esté viva Suma sacerdotisa Jeklik.",

	--aspectvenoxis_cmd = "aspectvenoxis",
	aspectvenoxis_name = "Aspecto de Venoxis",
	aspectvenoxis_desc = "Avisa para la habilidad que gane Hakkar cuando esté vivo Sumo sacerdote Venoxis.",

	--aspectmarli_cmd = "aspectmarli",
	aspectmarli_name = "Aspecto de Mar'li",
	aspectmarli_desc = "Avisa para la habilidad que gane Hakkar cuando esté viva Suma sacerdotisa Mar'li.",

	--aspectthekal_cmd = "aspectthekal",
	aspectthekal_name = "Aspecto de Thekal",
	aspectthekal_desc = "Avisa para la habilidad que gane Hakkar cuando esté vivo Sumo sacerdote Thekal.",

	--aspectarlokk_cmd = "aspectarlokk",
	aspectarlokk_name = "Aspecto de Arlokk",
	aspectarlokk_desc = "Avisa para la habilidad que gane Hakkar cuando esté viva Suma sacerdotisa Arlokk.",
} end)

L:RegisterTranslations("deDE", function() return {
	engage_trigger = "FACE THE WRATH OF THE SOULFLAYER!",
	siphon_trigger = "Hakkar gains Blood Siphon.",
	poisonousblood_trigger = "You are afflicted by Poisonous Blood.",
	mindcontrolyou_trigger = "You are afflicted by Cause Insanity.",
	mindcontrolother_trigger = "(.+) is afflicted by Cause Insanity.",
	flee_trigger = "Fleeing will do you no good, mortals!",
	aspectofthekal_trigger = "Hakkar gains Aspect of Thekal.",
	aspectofthekalend_trigger = "Aspect of Thekal fades from Hakkar.",
	aspectofmarliyou_trigger = "You are afflicted by Aspect of Mar'li.",
	aspectofmarliyouimmune_trigger = "Hakkar 's Aspect of Mar'li failed. You are immune.",
	aspectofmarliother_trigger = "(.+) is afflicted by Aspect of Mar'li.",
	aspectofmarliotherimmune_trigger = "Hakkar 's Aspect of Mar'li fails. (.+) is immune.",
	aspectofmarligeneralavoid_trigger = "Hakkar 's Aspect of Mar'li",
	aspectofjeklikyou_trigger = "You are afflicted by Aspect of Jeklik.",
	aspectofjeklikyouimmune_trigger = "Hakkar 's Aspect of Jeklik failed. You are immune.",
	aspectofjeklikother_trigger = "(.+) is afflicted by Aspect of Jeklik.",
	aspectofjeklikotherimmune_trigger = "Hakkar 's Aspect of Jeklik fails. (.+) is immune.",
	aspectofjeklikgeneralavoid_trigger = "Hakkar 's Aspect of Jeklik",
	aspectofarlokkyou_trigger = "You are afflicted by Aspect of Arlokk.",
	aspectofarlokkyouimmune_trigger = "Hakkar 's Aspect of Arlokk failed. You are immune.",
	aspectofarlokkother_trigger = "(.+) is afflicted by Aspect of Arlokk.",
	aspectofarlokkotherimmune_trigger = "Hakkar 's Aspect of Arlokk fails. (.+) is immune.",
	aspectofarlokkgeneralavoid_trigger = "Hakkar 's Aspect of Arlokk",
	aspectofvenoxisyou_trigger = "Hakkar 's Aspect of Venoxis hits you for",
	aspectofvenoxisyouresist_trigger = "Hakkar 's Aspect of Venoxis was resisted.",
	aspectofvenoxisother_trigger = "Hakkar 's Aspect of Venoxis hits",
	aspectofvenoxisotherresist_trigger = "Hakkar 's Aspect of Venoxis was resisted by",

	siphon_warning = "Blood Siphon in %d seconds!",
	siphon_message = "Blood Siphon - next one in 90 seconds!",
	enrage5minutes_message = "Enrage in 5 minutes!",
	enrage1minute_message = "Enrage in 1 minute!",
	enrageseconds_message = "Enrage in %d seconds!",

	mindcontrol_message = "%s is mindcontrolled!",
	mindcontrol_message_you = "You are mindcontrolled!",
	mindcontrol_bar = "MC: %s",
	firstmc_bar = "First MC",
	nextmc_bar = "Next MC",
	enrage_bar = "Enrage",
	siphon_bar = "Blood Siphon",
	aspectthekalnext_bar = "Next Frenzy",
	aspectthekal_bar = "Frenzy - Aspect of Thekal",
	aspectthekal_ann = "Frenzy! Tranq now!",
	aspectmarli_bar = "Next Stun",
	aspectmarlidebuff_bar = "Stun: %s - Aspect of Mar'li",
	aspectjeklik_bar = "Next Silence",
	aspectjeklikdebuff_bar = "Silence - Aspect of Jeklik",
	aspectarlokk_bar = "Next Vanish",
	aspectarlokkdebuff_bar = "Vanish: %s - Aspect of Arlokk",
	aspectvenoxis_bar = "Next Poison",
	aspectvenoxisdebuff_bar = "Poison - Aspect of Venoxis",

	cmd = "Hakkar",

	siphon_cmd = "siphon",
	siphon_name = "Blood Siphon",
	siphon_desc = "Shows bars, warnings and timers for Hakkar's Blood Siphon.",

	enrage_cmd = "enrage",
	enrage_name = "Enrage",
	enrage_desc = "Lets you know when the 10 minutes are up!",

	mc_cmd = "mc",
	mc_name = "Mind Control",
	mc_desc = "Alert when players have Cause Insanity.",

	aspectjeklik_cmd = "aspectjeklik",
	aspectjeklik_name = "Aspect of Jeklik",
	aspectjeklik_desc = "Warnings for the extra ability Hakkar gains when High Priestess Jeklik is still alive.",

	aspectvenoxis_cmd = "aspectvenoxis",
	aspectvenoxis_name = "Aspect of Venoxis",
	aspectvenoxis_desc = "Warnings for the extra ability Hakkar gains when High Priest Venoxis is still alive.",

	aspectmarli_cmd = "aspectmarli",
	aspectmarli_name = "Aspect of Mar'li",
	aspectmarli_desc = "Warnings for the extra ability Hakkar gains when High Priestess Mar'li is still alive.",

	aspectthekal_cmd = "aspectthekal",
	aspectthekal_name = "Aspect of Thekal",
	aspectthekal_desc = "Warnings for the extra ability Hakkar gains when High Priest Thekal is still alive.",

	aspectarlokk_cmd = "aspectarlokk",
	aspectarlokk_name = "Aspect of Arlokk",
	aspectarlokk_desc = "Warnings for the extra ability Hakkar gains when High Priestess Arlokk is still alive.",
} end)

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-11
    cmd = "Hakkar",

    siphon_cmd = "siphon",
    siphon_name = "血液虹吸",
    siphon_desc = "显示哈卡血液虹吸的计时条、警告和计时器。",

    enrage_cmd = "enrage",
    enrage_name = "激怒",
    enrage_desc = "当10分钟时间到了之后通知你！",

    mc_cmd = "mc",
    mc_name = "精神控制",
    mc_desc = "当玩家被精神控制时进行警告",

    aspectjeklik_cmd = "aspectjeklik",
    aspectjeklik_name = "耶克里克的守护",
    aspectjeklik_desc = "当高阶祭司耶克里克在场时，哈卡获得额外能力时提醒。",

    aspectvenoxis_cmd = "aspectvenoxis",
    aspectvenoxis_name = "温诺希斯的守护",
    aspectvenoxis_desc = "当高阶祭司温诺希斯在场时，哈卡获得额外能力时提醒。",

    aspectmarli_cmd = "aspectmarli",
    aspectmarli_name = "玛尔里的守护",
    aspectmarli_desc = "当高阶祭司玛尔里在场时，哈卡获得额外能力时提醒。",

    aspectthekal_cmd = "aspectthekal",
    aspectthekal_name = "塞卡尔的守护",
    aspectthekal_desc = "当高阶祭司塞卡尔在场时，哈卡获得额外能力时提醒。",

    aspectarlokk_cmd = "aspectarlokk",
    aspectarlokk_name = "娅尔罗的守护",
    aspectarlokk_desc = "当高阶祭司娅尔罗在场时，哈卡获得额外能力时提醒。",



    engage_trigger = "FACE THE WRATH OF THE SOULFLAYER!",

    enrage1minute_message = "1分钟后激怒！",
    enrageseconds_message = "%d秒后激怒！",
    enrage_bar = "激怒",

    mindcontrolyou_trigger = "You are afflicted by Cause Insanity.",
    mindcontrolother_trigger = "(.+) is afflicted by Cause Insanity.",
    trigger_mindcontrolTotem = "Hakkar's Cause Insanity fails. Grounding Totem is immune.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE
    mindcontrol_message = "%s 被精神控制了！",
    mindcontrol_message_you = "你被精神控制了！",
    mindcontrol_bar = "精神控制：%s",
    firstmc_bar = "首次精神控制",
    nextmc_bar = "下一次精神控制",

    siphon_trigger = "Hakkar gains Blood Siphon.",
    siphon_warning = "%d秒后血液虹吸！",
    siphon_bar = "血液虹吸",
    siphon_message = "血液虹吸 - 下一次在90秒后！",

    --poisonousblood_trigger = "You are afflicted by Poisonous Blood.",

    aspectofthekal_trigger = "Hakkar gains Aspect of Thekal.",
    aspectofthekalend_trigger = "Aspect of Thekal fades from Hakkar.",
    aspectthekalnext_bar = "下一次狂乱",
    aspectthekal_bar = "狂乱 - 塞卡尔的守护",
    aspectthekal_ann = "狂乱了！现在使用宁神射击！",

    aspectofmarliyou_trigger = "You are afflicted by Aspect of Mar'li.",
    aspectofmarliother_trigger = "(.+) is afflicted by Aspect of Mar'li.",
    trigger_aspectOfMarliFail = "Hakkar's Aspect of Mar'li",
    aspectmarli_bar = "下一次昏迷",
    aspectmarlidebuff_bar = "昏迷：%s - 玛尔里的守护",

    trigger_aspectOfJeklik = "afflicted by Aspect of Jeklik.",
    trigger_aspectOfJeklikFail = "Hakkar's Aspect of Jeklik",
    aspectjeklik_bar = "下一次沉默",
    aspectjeklikdebuff_bar = "沉默 - 耶克里克的守护",

    aspectofarlokkyou_trigger = "You are afflicted by Aspect of Arlokk.",
    aspectofarlokkother_trigger = "(.+) is afflicted by Aspect of Arlokk.",
    trigger_aspectOfArlokkFail = "Hakkar's Aspect of Arlokk",
    aspectarlokk_bar = "下一次消失",
    aspectarlokkdebuff_bar = "消失：%s - 娅尔罗的守护",

    trigger_aspectOfVenoxis = "Hakkar's Aspect of Venoxis hit",
    trigger_aspectOfVenoxisFail = "Hakkar's Aspect of Venoxis was resisted",
    aspectvenoxis_bar = "下一次毒液 - 温诺希斯的守护",
    --aspectvenoxisdebuff_bar = "毒液 - 温诺希斯的守护",
    grounded = "被钉在地上！",
} end)

local timer = {
	enrage = 600,
	bloodSiphon = 90,
	firstMindcontrol = 17,
}
local icon = {
	enrage = "Spell_Shadow_UnholyFrenzy",
	bloodSiphon = "Spell_Shadow_LifeDrain",
	serpent = "Ability_Hunter_Pet_WindSerpent",
	mindcontrol = "Spell_Shadow_ShadowWordDominate",
	
	-- aspects
	jeklik = "Spell_Shadow_Teleport",
	arlokk = "Ability_Vanish",
	venoxis = "Spell_Nature_CorrosiveBreath",
	marli = "Ability_Smash",
	thekal = "Ability_Druid_ChallangingRoar",
}
local syncName = {
	bloodSiphon = "HakkarBloodSiphon"..module.revision,
	mindcontrol = "HakkarMC"..module.revision,

	-- aspects
	jeklik = "HakkarAspectJeklik"..module.revision,
	arlokk = "HakkarAspectArlokk"..module.revision,
	arlokkAvoid = "HakkarAspectArlokkAvoid"..module.revision,
	venoxis = "HakkarAspectVenoxis"..module.revision,
	marli = "HakkarAspectMarli"..module.revision,
	marliAvoid = "HakkarAspectMarliAvoid"..module.revision,
	thekalStart = "HakkarAspectThekalStart"..module.revision,
	thekalStop = "HakkarAspectThekalStop"..module.revision,
}

module:RegisterYellEngage(L["engage_trigger"])

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--debug
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Event")

	self:ThrottleSync(5, syncName.bloodSiphon)
	self:ThrottleSync(5, syncName.mindcontrol)

	self:ThrottleSync(5, syncName.jeklik)
	self:ThrottleSync(5, syncName.arlokk)
	self:ThrottleSync(5, syncName.arlokkAvoid)
	self:ThrottleSync(5, syncName.venoxis)
	self:ThrottleSync(5, syncName.marli)
	self:ThrottleSync(5, syncName.marliAvoid)
	self:ThrottleSync(5, syncName.thekalStart)
	self:ThrottleSync(5, syncName.thekalStop)
end

function module:OnSetup()
end

function module:OnEngage()
	if self.db.profile.enrage then
		self:Bar(L["enrage_bar"], timer.enrage, icon.enrage)
		self:DelayedMessage(timer.enrage - 60, L["enrage1minute_message"], "Urgent", nil, nil, true)
		self:DelayedMessage(timer.enrage - 10, string.format(L["enrageseconds_message"], 10), "Attention", nil, nil, true)
	end
	if self.db.profile.siphon then
		self:Bar(L["siphon_bar"], timer.bloodSiphon, icon.bloodSiphon, true, "Red")
		self:DelayedMessage(timer.bloodSiphon - 30, string.format(L["siphon_warning"], 30), "Urgent")
		self:DelayedWarningSign(timer.bloodSiphon - 30, icon.serpent, 3)
		self:DelayedMessage(timer.bloodSiphon - 10, string.format(L["siphon_warning"], 10), "Attention", nil, nil, true)
	end
	if self.db.profile.mc then
		self:Bar(L["firstmc_bar"], timer.firstMindcontrol, icon.mindcontrol, true, "Black")
	end
end

function module:OnDisengage()
end

function module:Event(msg)
	if msg == "forceEngage" then
		module:SendEngageSync()
	end
	
	
	
	
	if string.find(msg, L["mindcontrolother_trigger"]) then
		local _, _, mindcontrolother, _ = string.find(msg, L["mindcontrolother_trigger"])
		self:Sync(syncName.mindcontrol .. " "..mindcontrolother)
	elseif msg == L["mindcontrolyou_trigger"] then
		self:Sync(syncName.mindcontrol .. " "..UnitName("player"))
	elseif msg == L["trigger_mindcontrolTotem"] then
		self:Sync(syncName.mindcontrol .. " "..grounded)
	
	
	elseif msg == L["siphon_trigger"] then
		self:Sync(syncName.bloodSiphon)
	
	
	
	-- aspects
	elseif string.find(msg, L["aspectofmarliother_trigger"]) then
		local _, _, aspectofmarliother, _ = string.find(msg, L["aspectofmarliother_trigger"])
		self:Sync(syncName.marli .. " "..aspectofmarliother)
	elseif msg == L["aspectofmarliyou_trigger"] then
		self:Sync(syncName.marli .. " "..UnitName("player"))
		
	elseif string.find(msg, L["trigger_aspectOfMarliFail"])then
		self:Sync(syncName.marliAvoid)
		
	elseif string.find(msg, L["trigger_aspectOfJeklik"]) or string.find(msg, L["trigger_aspectOfJeklikFail"]) then
		self:Sync(syncName.jeklik)
		
	elseif string.find(msg, L["aspectofarlokkother_trigger"]) then
		local _, _, aspectofarlokkother, _ = string.find(msg, L["aspectofarlokkother_trigger"])
		self:Sync(syncName.arlokk .. " "..aspectofarlokkother)
	elseif msg == L["aspectofarlokkyou_trigger"] then
		self:Sync(syncName.arlokk .. " "..UnitName("player"))
		
	elseif string.find(msg, L["trigger_aspectOfArlokkFail"]) then
		self:Sync(syncName.arlokkAvoid)

	elseif string.find(msg, L["trigger_aspectOfVenoxis"]) or string.find(msg, L["trigger_aspectOfVenoxisFail"]) then
		self:Sync(syncName.venoxis)
		
	elseif string.find(msg, L["aspectofthekal_trigger"]) then
		self:Sync(syncName.thekalStart)
	elseif msg == L["aspectofthekalend_trigger"] then
		self:Sync(syncName.thekalStop)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.bloodSiphon then
		self:BloodSiphon()
	elseif sync == syncName.mindcontrol and rest and self.db.profile.mc then
		self:MindControl(rest)

		-- aspects
	elseif sync == syncName.jeklik and self.db.profile.aspectjeklik then
		self:AspectJeklik()
	elseif sync == syncName.arlokk and rest and self.db.profile.aspectarlokk then
		self:AspectArlokk(rest)
	elseif sync == syncName.arlokkAvoid and self.db.profile.aspectarlokk then
		self:AspectArlokkAvoid()
	elseif sync == syncName.venoxis and self.db.profile.aspectvenoxis then
		self:AspectVenoxis()
	elseif sync == syncName.marli and rest and self.db.profile.aspectmarli then
		self:AspectMarli(rest)
	elseif sync == syncName.marliAvoid and self.db.profile.aspectmarli then
		self:AspectMarliAvoid()
	elseif sync == syncName.thekalStart and self.db.profile.aspectthekal then
		self:AspectThekalStart()
	elseif sync == syncName.thekalStop and self.db.profile.aspectthekal then
		self:AspectThekalStop()
	end
end


function module:BloodSiphon()
	if self.db.profile.siphon then
		self:Bar(L["siphon_bar"], timer.bloodSiphon, icon.bloodSiphon, true, "Red")
		self:DelayedMessage(timer.bloodSiphon - 30, string.format(L["siphon_warning"], 30), "Urgent")
		self:DelayedWarningSign(timer.bloodSiphon - 30, icon.serpent, 3)
		self:DelayedMessage(timer.bloodSiphon - 10, string.format(L["siphon_warning"], 10), "Attention", nil, nil, true)
	end

	-- aspects
	if self.db.profile.aspectjeklik then
		self:RemoveBar(L["aspectjeklik_bar"])
	end
	if self.db.profile.aspectvenoxis then
		self:RemoveBar(L["aspectvenoxis_bar"])
	end
	if self.db.profile.aspectmarli then
		self:RemoveBar(L["aspectmarli_bar"])
	end
	if self.db.profile.aspectarlokk then
		self:RemoveBar(L["aspectarlokk_bar"])
	end
	if self.db.profile.aspectthekal then
		self:RemoveBar(L["aspectthekalnext_bar"])
	end
end

function module:MindControl(rest)
	self:DelayedBar(10, L["nextmc_bar"], 11, icon.mindcontrol, true, "Black")
	self:Bar(string.format(L["mindcontrol_bar"], rest), 10, icon.mindcontrol, true, "White")
	
	if rest ~= grounded then
		self:Message(string.format(L["mindcontrol_message"], rest), "Attention")
		
		if (IsRaidLeader() or IsRaidOfficer()) then
			for i=1,GetNumRaidMembers() do
				if UnitName("raid"..i) == rest then
					SetRaidTarget("raid"..i, 4)
				end
			end
		end
	end
end

--aspects
function module:AspectJeklik()
	self:Bar(L["aspectjeklikdebuff_bar"], 5, icon.jeklik, true, "Orange")
	self:DelayedBar(5, L["aspectjeklik_bar"], 5, icon.jeklik, true, "Orange")
end

function module:AspectArlokk(rest)
	self:Bar(string.format(L["aspectarlokkdebuff_bar"], rest), 2, icon.arlokk, true, "Blue")
	self:DelayedBar(2, L["aspectarlokk_bar"], 8, icon.arlokk, true, "Blue")
end

function module:AspectArlokkAvoid()
	self:Bar(L["aspectarlokk_bar"], 10, icon.arlokk, true, "Blue")
end

function module:AspectVenoxis()
	--self:Bar(L["aspectvenoxisdebuff_bar"], 10, icon.venoxis, true, "Green")
	self:Bar(L["aspectvenoxis_bar"], 8, icon.venoxis, true, "Green")
end

function module:AspectMarli(rest)
	if UnitName("Player") == "Relar" then DEFAULT_CHAT_FRAME:AddMessage("AspectMarli: "..rest) end
	self:Bar(string.format(L["aspectmarlidebuff_bar"], rest), 6, icon.marli, true, "Yellow")
	self:DelayedBar(6, L["aspectmarli_bar"], 4, icon.marli, true, "Yellow")
end

function module:AspectMarliAvoid()
	if UnitName("Player") == "Relar" then DEFAULT_CHAT_FRAME:AddMessage("AspectMarliAvoid") end
	self:Bar(L["aspectmarli_bar"], 10, icon.marli, true, "Yellow")
end

function module:AspectThekalStart()
	hakkarThekalStart = GetTime()
	self:Bar(L["aspectthekal_bar"], 8, icon.thekal, true, "Black")
	self:Message(L["aspectthekal_ann"], "Important", true, "Alarm")
end

function module:AspectThekalStop()
	hakkarThekalStop = GetTime()
	hakkarThekalNext = 15 - (hakkarThekalStop - hakkarThekalStart)
	
	self:Bar(L["aspectthekalnext_bar"], hakkarThekalNext, icon.thekal, true, "Black")
	self:RemoveBar(L["aspectthekal_bar"])
end
