
local module, L = BigWigs:ModuleDeclaration("Hakkar", "Zul'Gurub")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30077
module.enabletrigger = module.translatedName
module.toggleoptions = {"mc", "siphon", "enrage", -1, "aspectjeklik", "aspectvenoxis", "aspectmarli", "aspectthekal", "aspectarlokk", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Hakkar",

	mc_cmd = "mc",
    mc_name = "心控警报",
    mc_desc = "心控出现时进行警告",

	siphon_cmd = "siphon",
    siphon_name = "吸血警报",
    siphon_desc = "吸血出现时进行警告",

	enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒出现时进行警告",

	aspectjeklik_cmd = "aspectjeklik",
    aspectjeklik_name = "耶克里克变形警报",
    aspectjeklik_desc = "耶克里克变形出现时进行警告",

	aspectvenoxis_cmd = "aspectvenoxis",
    aspectvenoxis_name = "温诺希斯变形警报",
    aspectvenoxis_desc = "温诺希斯变形出现时进行警告",

	aspectmarli_cmd = "aspectmarli",
    aspectmarli_name = "玛尔里变形警报",
    aspectmarli_desc = "玛尔里变形出现时进行警告",

	aspectthekal_cmd = "aspectthekal",
    aspectthekal_name = "塞卡尔变形警报",
    aspectthekal_desc = "塞卡尔变形出现时进行警告",

	aspectarlokk_cmd = "aspectarlokk",
    aspectarlokk_name = "娅尔罗变形警报",
    aspectarlokk_desc = "娅尔罗变形出现时进行警告",
	
	
	trigger_engage = "PRIDE HERALDS THE END OF YOUR WORLD. COME, MORTALS! FACE THE WRATH OF THE SOULFLAYER!", --CHAT_MSG_MONSTER_YELL
	
	trigger_enrage = "FACE THE WRATH OF THE SOULFLAYER!", --to be confirmed
    bar_enrage = "激怒",
    msg_enrage = "哈卡激怒了！",
    msg_enrage60 = "1分钟后激怒！",
    msg_enrage10 = "10秒后激怒！",
	
	trigger_causeInsanityYou = "You are afflicted by Cause Insanity.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_causeInsanityOther = "(.+) is afflicted by Cause Insanity.", --CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_causeInsanityFade = "Cause Insanity fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
	trigger_causeInsanityTotem = "Hakkar's Cause Insanity fails. Grounding Totem is immune.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE
    msg_causeInsanity = " 心控",
    bar_causeInsanity = " 心控",
    bar_causeInsanityCd = "心控冷却",
	
	trigger_bloodSiphon = "Hakkar gains Blood Siphon.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_bloodSiphon30 = "30秒后吸血！",
    bar_bloodSiphonDur = "吸血！",
    bar_bloodSiphonCd = "下一次吸血",
	
	--unreliable, as if someone dies this will trigger
	--trigger_bloodSiphonFade = "Blood Siphon fades from Hakkar.", --CHAT_MSG_SPELL_AURA_GONE_OTHER
	
	trigger_poisonousBloodYou = "You are afflicted by Poisonous Blood.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_poisonousBloodOther = "(.+) is afflicted by Poisonous Blood.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE //CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
	trigger_poisonousBloodFade = "Poisonous Blood fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_poisonousBlood = " 毒血",
	
	--1.5k dmg + silence 5sec, 45yard
	trigger_aspectOfJeklik = "afflicted by Aspect of Jeklik.", --guessing CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE //CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
	trigger_aspectOfJeklikResist = "Hakkar's Aspect of Jeklik", --guessing ???
    bar_aspectOfJeklikCd = "沉默冷却 - 耶克里克",
    bar_aspectOfJeklikDur = "沉默！ - 耶克里克",
	
	--30yard, poison volley, 10sec dot, 438dmg + 236 per 2sec, 1.6k dmg total
	trigger_aspectOfVenoxis = "Hakkar's Aspect of Venoxis hit", --guessing ???
	trigger_aspectOfVenoxisResist = "Hakkar's Aspect of Venoxis was resisted", --guessing ???
    bar_aspectOfVenoxisCd = "毒性冷却 - 温诺希斯",
	
	--6sec stun, single target
	trigger_aspectOfMarliYou = "You are afflicted by Aspect of Mar'li.", --guessing CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_aspectOfMarliOther = "(.+) is afflicted by Aspect of Mar'li.", --guessing CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE //CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
	trigger_aspectOfMarliResist = "Hakkar's Aspect of Mar'li", --guessing ???
	trigger_aspectOfMarliFade = "Aspect of Mar'li fades from (.+).", --guessing CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_aspectOfMarliCd = "昏迷和仇恨降低冷却 - 玛尔里",
    bar_aspectOfMarliDur = " 昏迷 - 玛尔里",
	
	--frenzy, 150% attack speed
	trigger_aspectOfThekal = "Hakkar gains Aspect of Thekal.", --guessing CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	trigger_aspectOfThekalFade = "Aspect of Thekal fades from Hakkar.", --guessing CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_aspectOfThekalCd = "狂暴冷却 - 塞卡尔",
    bar_aspectOfThekalDur = "狂暴！ - 塞卡尔",
    msg_aspectOfThekal = "狂暴 - 宁神射击！",

	--2sec stun, single target
	trigger_aspectOfArlokkYou = "You are afflicted by Aspect of Arlokk.", --guessing CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_aspectOfArlokkOther = "(.+) is afflicted by Aspect of Arlokk.", --guessing CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE //CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
	trigger_aspectOfArlokkResist = "Hakkar's Aspect of Arlokk", --guessing ???
	trigger_aspectOfArlokkFade = "Aspect of Arlokk fades from (.+).", --guessing CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_aspectOfArlokkCd = "昏迷和仇恨降低冷却 - 阿洛克",
    bar_aspectOfArlokkDur = " 昏迷 - 阿洛克",
    c_sonofhakkar = "Son of Hakkar",
    you = "you",
    clickme = " >点击我<",
} end)

L:RegisterTranslations("zhCN", function() return {
	cmd = "Hakkar",

	mc_cmd = "mc",
    mc_name = "心控警报",
    mc_desc = "心控出现时进行警告",

	siphon_cmd = "siphon",
    siphon_name = "吸血警报",
    siphon_desc = "吸血出现时进行警告",

	enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒出现时进行警告",

	aspectjeklik_cmd = "aspectjeklik",
    aspectjeklik_name = "耶克里克变形警报",
    aspectjeklik_desc = "耶克里克变形出现时进行警告",

	aspectvenoxis_cmd = "aspectvenoxis",
    aspectvenoxis_name = "温诺希斯变形警报",
    aspectvenoxis_desc = "温诺希斯变形出现时进行警告",

	aspectmarli_cmd = "aspectmarli",
    aspectmarli_name = "玛尔里变形警报",
    aspectmarli_desc = "玛尔里变形出现时进行警告",

	aspectthekal_cmd = "aspectthekal",
    aspectthekal_name = "塞卡尔变形警报",
    aspectthekal_desc = "塞卡尔变形出现时进行警告",

	aspectarlokk_cmd = "aspectarlokk",
    aspectarlokk_name = "娅尔罗变形警报",
    aspectarlokk_desc = "娅尔罗变形出现时进行警告",
	
	
	trigger_engage = "PRIDE HERALDS THE END OF YOUR WORLD. COME, MORTALS! FACE THE WRATH OF THE SOULFLAYER!", --CHAT_MSG_MONSTER_YELL
	
	trigger_enrage = "FACE THE WRATH OF THE SOULFLAYER!", --to be confirmed
    bar_enrage = "激怒",
    msg_enrage = "哈卡激怒了！",
    msg_enrage60 = "1分钟后激怒！",
    msg_enrage10 = "10秒后激怒！",
	
	trigger_causeInsanityYou = "You are afflicted by Cause Insanity.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_causeInsanityOther = "(.+) is afflicted by Cause Insanity.", --CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_causeInsanityFade = "Cause Insanity fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
	trigger_causeInsanityTotem = "Hakkar's Cause Insanity fails. Grounding Totem is immune.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE
    msg_causeInsanity = " 心控",
    bar_causeInsanity = " 心控",
    bar_causeInsanityCd = "心控冷却",
	
	trigger_bloodSiphon = "Hakkar gains Blood Siphon.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_bloodSiphon30 = "30秒后吸血！",
    bar_bloodSiphonDur = "吸血！",
    bar_bloodSiphonCd = "下一次吸血",
	
	--unreliable, as if someone dies this will trigger
	--trigger_bloodSiphonFade = "Blood Siphon fades from Hakkar.", --CHAT_MSG_SPELL_AURA_GONE_OTHER
	
	trigger_poisonousBloodYou = "You are afflicted by Poisonous Blood.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_poisonousBloodOther = "(.+) is afflicted by Poisonous Blood.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE //CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
	trigger_poisonousBloodFade = "Poisonous Blood fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_poisonousBlood = " 毒血",
	
	--1.5k dmg + silence 5sec, 45yard
	trigger_aspectOfJeklik = "afflicted by Aspect of Jeklik.", --guessing CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE //CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
	trigger_aspectOfJeklikResist = "Hakkar's Aspect of Jeklik", --guessing ???
    bar_aspectOfJeklikCd = "沉默冷却 - 耶克里克",
    bar_aspectOfJeklikDur = "沉默！ - 耶克里克",
	
	--30yard, poison volley, 10sec dot, 438dmg + 236 per 2sec, 1.6k dmg total
	trigger_aspectOfVenoxis = "Hakkar's Aspect of Venoxis hit", --guessing ???
	trigger_aspectOfVenoxisResist = "Hakkar's Aspect of Venoxis was resisted", --guessing ???
    bar_aspectOfVenoxisCd = "毒性冷却 - 温诺希斯",
	
	--6sec stun, single target
	trigger_aspectOfMarliYou = "You are afflicted by Aspect of Mar'li.", --guessing CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_aspectOfMarliOther = "(.+) is afflicted by Aspect of Mar'li.", --guessing CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE //CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
	trigger_aspectOfMarliResist = "Hakkar's Aspect of Mar'li", --guessing ???
	trigger_aspectOfMarliFade = "Aspect of Mar'li fades from (.+).", --guessing CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_aspectOfMarliCd = "昏迷和仇恨降低冷却 - 玛尔里",
    bar_aspectOfMarliDur = " 昏迷 - 玛尔里",
	
	--frenzy, 150% attack speed
	trigger_aspectOfThekal = "Hakkar gains Aspect of Thekal.", --guessing CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	trigger_aspectOfThekalFade = "Aspect of Thekal fades from Hakkar.", --guessing CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_aspectOfThekalCd = "狂暴冷却 - 塞卡尔",
    bar_aspectOfThekalDur = "狂暴！ - 塞卡尔",
    msg_aspectOfThekal = "狂暴 - 宁神射击！",

	--2sec stun, single target
	trigger_aspectOfArlokkYou = "You are afflicted by Aspect of Arlokk.", --guessing CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_aspectOfArlokkOther = "(.+) is afflicted by Aspect of Arlokk.", --guessing CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE //CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
	trigger_aspectOfArlokkResist = "Hakkar's Aspect of Arlokk", --guessing ???
	trigger_aspectOfArlokkFade = "Aspect of Arlokk fades from (.+).", --guessing CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_aspectOfArlokkCd = "昏迷和仇恨降低冷却 - 阿洛克",
    bar_aspectOfArlokkDur = " 昏迷 - 阿洛克",
    c_sonofhakkar = "哈卡之子",
    you = "you",
    clickme = " >点击我<",
} end)

local timer = {
	causeInsanityFirstCd = 17,
	causeInsanityDur = 10,
	causeInsanityCd = 11,
	
	bloodSiphonCd = 90,
	bloodSiphonDur = 8,
	
	enrage = 600,
	
	--aspects
	jeklikDur = 5,
	jeklikCd = 5,

	venoxisCd = 8,

	marliDur = 6,
	marliCd = 4,
	marliAvoid = 10,

	thekalDur = 8,
	thekalCd = 15,

	arlokkDur = 2,
	arlokkCd = 8,
	arlokkAvoid = 10,
}
local icon = {
	causeInsanity = "Spell_Shadow_ShadowWordDominate",
		priestDispel = "spell_holy_dispelmagic",
		paladinDispel = "spell_holy_renew",
	
	bloodSiphon = "Spell_Shadow_LifeDrain",
		serpent = "Ability_Hunter_Pet_WindSerpent",
	
	enrage = "Spell_Shadow_UnholyFrenzy",
	
	--aspects
	jeklik = "Spell_Shadow_Teleport",
	venoxis = "Spell_Nature_CorrosiveBreath",
	marli = "Ability_Smash",
	thekal = "Ability_Druid_ChallangingRoar",
	arlokk = "Ability_Vanish",
	
	poisonousBlood = "spell_nature_regenerate",
}
local color = {
	causeInsanityCd = "Black",
	causeInsanityDur = "Magenta",
	bloodSiphon = "White",
	enrage = "White",
	
	--aspects
	jeklikCd = "Blue",
	jeklikDur = "Blue",
	
	venoxis = "Green",
	
	marliCd = "Yellow",
	marliDur = "Yellow",
	
	thekalCd = "Orange",
	thekalDur = "Red",
	
	arlokkCd = "Yellow",
	arlokkDur = "Yellow",
	
	poisonousBlood = "Green",
}
local syncName = {
	causeInsanity = "HakkarMC"..module.revision,
	causeInsanityFade = "HakkarMcFade"..module.revision,
	bloodSiphon = "HakkarBloodSiphon"..module.revision,
	enrage = "HakkarEnrage"..module.revision,

	-- aspects
	jeklik = "HakkarAspectJeklik"..module.revision,
	venoxis = "HakkarAspectVenoxis"..module.revision,
	
	marli = "HakkarAspectMarli"..module.revision,
	marliFade = "HakkarAspectMarliFade"..module.revision,
	marliAvoid = "HakkarAspectMarliAvoid"..module.revision,
	
	thekalStart = "HakkarAspectThekalStart"..module.revision,
	thekalStop = "HakkarAspectThekalStop"..module.revision,
	
	arlokk = "HakkarAspectArlokk"..module.revision,
	arlokkFade = "HakkarAspectArlokkFade"..module.revision,
	arlokkAvoid = "HakkarAspectArlokkAvoid"..module.revision,
}


module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
module.proximitySilent = false

local thekalStart = 0
local thekalStop = 0
local thekalNext = 0
local sonDeathTracking = nil
local poisonned = 0
local numRaidMembers = 0
local updateBars = nil

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--debug
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL") --trigger_engage, trigger_enrage
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_causeInsanityYou, trigger_poisonousBloodYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_causeInsanityOther, trigger_poisonousBloodOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_causeInsanityOther, trigger_poisonousBloodOther
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Event") --trigger_causeInsanityOther, trigger_poisonousBloodOther
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_causeInsanityFade, trigger_poisonousBloodFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_causeInsanityFade, trigger_poisonousBloodFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_causeInsanityFade, trigger_poisonousBloodFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_causeInsanityTotem
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_causeInsanityTotem
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_bloodSiphon
	


	self:ThrottleSync(3, syncName.causeInsanity)
	self:ThrottleSync(3, syncName.causeInsanityFade)
	self:ThrottleSync(3, syncName.bloodSiphon)
	self:ThrottleSync(3, syncName.enrage)
	
	self:ThrottleSync(3, syncName.jeklik)
	self:ThrottleSync(3, syncName.venoxis)
	
	self:ThrottleSync(3, syncName.marli)
	self:ThrottleSync(3, syncName.marliFade)
	self:ThrottleSync(3, syncName.marliAvoid)
	
	self:ThrottleSync(3, syncName.thekalStart)
	self:ThrottleSync(1, syncName.thekalStop)
	
	self:ThrottleSync(3, syncName.arlokk)
	self:ThrottleSync(3, syncName.arlokkFade)
	self:ThrottleSync(3, syncName.arlokkAvoid)
end

function module:OnSetup()
	self.started = nil

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH") --snakeDies
end

function module:OnEngage()
	thekalStart = 0
	thekalStop = 0
	thekalNext = 0
	sonDeathTracking = nil
	poisonned = 0
	numRaidMembers = GetNumRaidMembers()
	updateBars = nil
	
	if self.db.profile.enrage then
		self:Bar(L["bar_enrage"], timer.enrage, icon.enrage, true, color.enrage)
		self:DelayedMessage(timer.enrage - 60, L["msg_enrage60"], "Urgent", false, nil, false)
		self:DelayedMessage(timer.enrage - 10, L["msg_enrage10"], "Attention", false, nil, false)
	end
	
	if self.db.profile.siphon then
		self:Bar(L["bar_bloodSiphonCd"], timer.bloodSiphonCd, icon.bloodSiphon, true, color.bloodSiphon)
		self:DelayedMessage(timer.bloodSiphonCd - 30, L["msg_bloodSiphon30"], "Urgent", false, nil, false)
		self:DelayedWarningSign(timer.bloodSiphonCd - 30, icon.serpent, 3)
		self:DelayedSound(timer.bloodSiphonCd - 30, "Beware")
		self:ScheduleEvent("EnableSonDeathTracking", self.EnableSonDeathTracking, timer.bloodSiphonCd - 30, self)
	end
	
	if self.db.profile.mc then
		self:Bar(L["bar_causeInsanityCd"], timer.causeInsanityFirstCd, icon.causeInsanity, true, color.causeInsanityCd)
	end
	
	self:TriggerEvent("BigWigs_ShowProximity")
end

function module:OnDisengage()
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if (msg == string.format(UNITDIESOTHER, L["c_sonofhakkar"])) and sonDeathTracking then
		self:SonDead()
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg, sender)
	if msg == L["trigger_engage"] then
		module:SendEngageSync()
	elseif msg == L["trigger_enrage"] then
		self:Sync(syncName.enrage)
	end
end

function module:Event(msg)
	if msg == L["trigger_causeInsanityYou"] then
		self:Sync(syncName.causeInsanity .. " "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_causeInsanityOther"]) then
		local _, _, causeInsanityPerson, _ = string.find(msg, L["trigger_causeInsanityOther"])
		self:Sync(syncName.causeInsanity .. " "..causeInsanityPerson)

	elseif msg == L["trigger_causeInsanityTotem"] then
		self:Sync(syncName.causeInsanity .. " ".."Grounded!")
	
	elseif string.find(msg, L["trigger_causeInsanityFade"]) then
		local _, _, causeInsanityFadePerson, _ = string.find(msg, L["trigger_causeInsanityFade"])
		if causeInsanityFadePerson == L["you"] then causeInsanityFadePerson = UnitName("Player") end
		self:Sync(syncName.causeInsanityFade .. " "..causeInsanityFadePerson)
	
		
	elseif msg == L["trigger_bloodSiphon"] then
		self:Sync(syncName.bloodSiphon)
	
	
	-- aspects
	elseif string.find(msg, L["trigger_aspectOfJeklik"]) or string.find(msg, L["trigger_aspectOfJeklikResist"]) then
		self:Sync(syncName.jeklik)
	
	elseif string.find(msg, L["trigger_aspectOfVenoxis"]) or string.find(msg, L["trigger_aspectOfVenoxisResist"]) then
		self:Sync(syncName.venoxis)
	
	
	elseif msg == L["trigger_aspectOfMarliYou"] then
		self:Sync(syncName.marli .. " "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_aspectOfMarliOther"]) then
		local _, _, marliPerson, _ = string.find(msg, L["trigger_aspectOfMarliOther"])
		self:Sync(syncName.marli .. " "..marliPerson)
	
	elseif string.find(msg, L["trigger_aspectOfMarliFade"]) then
		local _, _, marliFadePerson, _ = string.find(msg, L["trigger_aspectOfMarliFade"])
		if marliFadePerson == L["you"] then marliFadePerson = UnitName("Player") end
		self:Sync(syncName.marliFade .. " "..marliFadePerson)
		
	elseif string.find(msg, L["trigger_aspectOfMarliResist"])then
		self:Sync(syncName.marliAvoid)
		
		
	elseif msg == L["trigger_aspectOfThekal"] then
		self:Sync(syncName.thekalStart)
	elseif msg == L["trigger_aspectOfThekalFade"] then
		self:Sync(syncName.thekalStop)
		
		
	elseif msg == L["trigger_aspectOfArlokkYou"] then
		self:Sync(syncName.arlokk .. " "..UnitName("Player"))
		
	elseif string.find(msg, L["trigger_aspectOfArlokkOther"]) then
		local _, _, arlokkPerson, _ = string.find(msg, L["trigger_aspectOfArlokkOther"])
		self:Sync(syncName.arlokk .. " "..arlokkPerson)
	
	elseif string.find(msg, L["trigger_aspectOfArlokkFade"]) then
		local _, _, arlokkFadePerson, _ = string.find(msg, L["trigger_aspectOfArlokkFade"])
		if arlokkFadePerson == L["you"] then arlokkFadePerson = UnitName("Player") end
		self:Sync(syncName.arlokkFade .. " "..arlokkFadePerson)
		
	elseif string.find(msg, L["trigger_aspectOfArlokkResist"]) then
		self:Sync(syncName.arlokkAvoid)
		
		
		
	elseif msg == L["trigger_poisonousBloodYou"] and self.db.profile.siphon and updateBars then
		self:PoisonousBlood()
	elseif string.find(msg, L["trigger_poisonousBloodOther"]) and self.db.profile.siphon and updateBars then
		self:PoisonousBlood()
	elseif string.find(msg, L["trigger_poisonousBloodFade"]) and self.db.profile.siphon and updateBars then
		self:PoisonousBloodFade()
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.causeInsanity and rest and self.db.profile.mc then
		self:CauseInsanity(rest)
	elseif sync == syncName.causeInsanityFade and rest and self.db.profile.mc then
		self:CauseInsanityFade(rest)
	
	elseif sync == syncName.bloodSiphon then
		self:BloodSiphon()
	
	elseif sync == syncName.enrage and self.db.profile.enrage then
		self:Enrage()
		
		-- aspects
	elseif sync == syncName.jeklik and self.db.profile.aspectjeklik then
		self:AspectJeklik()
	
	elseif sync == syncName.venoxis and self.db.profile.aspectvenoxis then
		self:AspectVenoxis()
		
	elseif sync == syncName.marli and rest and self.db.profile.aspectmarli then
		self:AspectMarli(rest)
	elseif sync == syncName.marliFade and rest and self.db.profile.aspectmarli then
		self:AspectMarliFade(rest)
	elseif sync == syncName.marliAvoid and self.db.profile.aspectmarli then
		self:AspectMarliAvoid()
	
	elseif sync == syncName.thekalStart and self.db.profile.aspectthekal then
		self:AspectThekalStart()
	elseif sync == syncName.thekalStop and self.db.profile.aspectthekal then
		self:AspectThekalStop()
	
	elseif sync == syncName.arlokk and rest and self.db.profile.aspectarlokk then
		self:AspectArlokk(rest)
	elseif sync == syncName.arlokkFade and rest and self.db.profile.aspectarlokk then
		self:AspectArlokkFade(rest)
	elseif sync == syncName.arlokkAvoid and self.db.profile.aspectarlokk then
		self:AspectArlokkAvoid()
	end
end


function module:CauseInsanity(rest)
	self:RemoveBar(L["bar_causeInsanityCd"])
	
	if rest == "Grounded!" then
		self:Bar("Grounded -"..L["bar_causeInsanity"], timer.causeInsanityDur, icon.causeInsanity, true, color.causeInsanityDur)
		self:DelayedBar(timer.causeInsanityDur, L["bar_causeInsanityCd"], timer.causeInsanityCd, icon.causeInsanity, true, color.causeInsanityCd)
	else
		self:Bar(rest..L["bar_causeInsanity"].. L["clickme"], timer.causeInsanityDur, icon.causeInsanity, true, color.causeInsanityDur)
		self:SetCandyBarOnClick("BigWigsBar "..rest..L["bar_causeInsanity"].. L["clickme"], function(name, button, extra) TargetByName(extra, true) end, rest)
		
		if UnitClass("Player") == BC["Mage"] or UnitClass("Player") == BC["Warlock"] then
			self:Message(rest..L["msg_causeInsanity"], "Attention", false, nil, false)
			self:Sound("Info")
			self:WarningSign(icon.causeInsanity, 0.7)
		end
		
		if (IsRaidLeader() or IsRaidOfficer()) then
			for i=1,GetNumRaidMembers() do
				if UnitName("raid"..i) == rest then
					SetRaidTarget("raid"..i, 4)
				end
			end
		end
	end
end

function module:CauseInsanityFade(rest)
	self:RemoveBar(rest..L["bar_causeInsanity"].. L["clickme"])
		
	if (IsRaidLeader() or IsRaidOfficer()) then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 0)
			end
		end
	end
	
	self:Bar(L["bar_causeInsanityCd"], timer.causeInsanityCd, icon.causeInsanity, true, color.causeInsanityCd)
	
	if UnitClass("Player") == BC["Priest"] then
		self:WarningSign(icon.priestDispel, 0.7)
		self:Sound("Info")
	elseif UnitClass("Player") == BC["Paladin"] then
		self:WarningSign(icon.paladinDispel, 0.7)
		self:Sound("Info")
	end
end

function module:BloodSiphon()
	if self.db.profile.siphon then
		sonDeathTracking = nil
		self:Bar(L["bar_bloodSiphonDur"], timer.bloodSiphonDur, icon.bloodSiphon, true, color.bloodSiphon)
		self:DelayedBar(timer.bloodSiphonDur, L["bar_bloodSiphonCd"], timer.bloodSiphonCd - timer.bloodSiphonDur, icon.bloodSiphon, true, color.bloodSiphon)
		self:DelayedMessage(timer.bloodSiphonCd - 30, L["msg_bloodSiphon30"], "Urgent", false, nil, false)
		self:DelayedWarningSign(timer.bloodSiphonCd - 30, icon.serpent, 3)
		self:ScheduleEvent("RemovePoisonousBar", self.RemovePoisonousBar, 5, self)
		self:ScheduleEvent("EnableSonDeathTracking", self.EnableSonDeathTracking, timer.bloodSiphonCd - 30, self)
	end
	
	-- aspects
	if self.db.profile.aspectjeklik then
		self:RemoveBar(L["bar_aspectOfJeklikCd"])
	end
	if self.db.profile.aspectvenoxis then
		self:RemoveBar(L["bar_aspectOfVenoxisCd"])
	end
	if self.db.profile.aspectmarli then
		self:RemoveBar(L["bar_aspectOfMarliCd"])
	end
	if self.db.profile.aspectarlokk then
		self:RemoveBar(L["bar_aspectOfArlokkCd"])
	end
	if self.db.profile.aspectthekal then
		self:RemoveBar(L["bar_aspectOfThekalCd"])
	end
end

function module:Enrage()
	self:RemoveBar(L["bar_enrage"])
	
	self:Message(L["msg_enrage"], "Urgent", false, nil, false)
	self:Sound("Beware")
	self:WarningSign(icon.enrage, 1)
end

--aspects
function module:AspectJeklik()
	self:RemoveBar(L["bar_aspectOfJeklikCd"])
	
	self:Bar(L["bar_aspectOfJeklikDur"], timer.jeklikDur, icon.jeklik, true, color.jeklikDur)
	self:DelayedBar(timer.jeklikDur, L["bar_aspectOfJeklikCd"], timer.jeklikCd, icon.jeklik, true, color.jeklikCd)
	
	if UnitClass("Player") == BC["Priest"] or UnitClass("Player") == BC["Paladin"] then
		self:WarningSign(icon.jeklik, 0.7)
		self:Sound("Info")
	end
end

function module:AspectVenoxis()
	self:Bar(L["bar_aspectOfVenoxisCd"], timer.venoxisCd, icon.venoxis, true, color.venoxis)
end

function module:AspectMarli(rest)
	self:Bar(rest..L["bar_aspectOfMarliDur"], timer.marliDur, icon.marli, true, color.marliDur)
end
function module:AspectMarliFade(rest)
	self:RemoveBar(rest..L["bar_aspectOfMarliDur"])
	
	self:Bar(L["bar_aspectOfMarliCd"], timer.marliCd, icon.marli, true, color.marliCd)
end
function module:AspectMarliAvoid()
	self:Bar(L["bar_aspectOfMarliCd"], timer.marliAvoid, icon.marli, true, color.marliCd)
end

function module:AspectThekalStart()
	self:RemoveBar(L["bar_aspectOfThekalCd"])
	
	thekalStart = GetTime()
	
	self:Bar(L["bar_aspectOfThekalDur"], timer.thekalDur, icon.thekal, true, color.thekalDur)
	
	if UnitClass("Player") == "Hunter" then
		self:Message(L["msg_aspectOfThekal"], "Important", false, nil, false)
		self:Sound("Info")
		self:WarningSign(icon.thekal, 1)
	end
end
function module:AspectThekalStop()
	self:RemoveBar(L["bar_aspectOfThekalDur"])
	
	thekalStop = GetTime()
	thekalNext = timer.thekalCd - (thekalStop - thekalStart)
		
	self:Bar(L["bar_aspectOfThekalCd"], thekalNext, icon.thekal, true, color.thekalCd)
end


function module:AspectArlokk(rest)
	self:RemoveBar(L["bar_aspectOfArlokkCd"])
	
	self:Bar(rest..L["bar_aspectOfArlokkDur"], timer.arlokkDur, icon.arlokk, true, color.arlokkDur)
end
function module:AspectArlokkFade(rest)
	self:RemoveBar(rest..L["bar_aspectOfArlokkDur"])
	
	self:Bar(L["bar_aspectOfArlokkCd"], timer.arlokkCd, icon.arlokk, true, color.arlokkCd)
end
function module:AspectArlokkAvoid()
	self:Bar(L["bar_aspectOfArlokkCd"], timer.arlokkAvoid, icon.arlokk, true, color.arlokkCd)
end

function module:EnableSonDeathTracking()
	sonDeathTracking = true
end

function module:SonDead()
	sonDeathTracking = nil
	poisonned = 0
	
	self:TriggerEvent("BigWigs_StartCounterBar", self, "/"..numRaidMembers..L["bar_poisonousBlood"], numRaidMembers, "Interface\\Icons\\"..icon.poisonousBlood, true, color.poisonousBlood)
	self:TriggerEvent("BigWigs_SetCounterBar", self, "/"..numRaidMembers..L["bar_poisonousBlood"], (numRaidMembers - 0.1))
	
	updateBars = true
end

function module:PoisonousBlood()
	poisonned = poisonned + 1
	self:TriggerEvent("BigWigs_SetCounterBar", self, "/"..numRaidMembers..L["bar_poisonousBlood"], (numRaidMembers - poisonned))
end

function module:PoisonousBloodFade()
	poisonned = poisonned - 1
	self:TriggerEvent("BigWigs_SetCounterBar", self, "/"..numRaidMembers..L["bar_poisonousBlood"], (numRaidMembers - poisonned))
end

function module:RemovePoisonousBar()
	updateBars = nil
	poisonned = 0
	self:TriggerEvent("BigWigs_StopCounterBar", self, "/"..numRaidMembers..L["bar_poisonousBlood"])
end
