--[[

Gives timer bars to see when world buffs are going out.

--]]

assert( BigWigs, "BigWigs not found!")

------------------------------
--      Are you local?      --
------------------------------

local name = "World Buff Timers"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..name)

------------------------------
--      Localization        --
------------------------------

L:RegisterTranslations("enUS", function() return {
	--[[onyHeadHorde_trigger = "People of the Horde, citizens of Orgrimmar, come, gather round and celebrate a hero of the Horde. On this day",
	nefHeadHorde_trigger = "NEFARIAN IS SLAIN! People of Orgrimmar, bow down before the might of",

	onyHeadAlliance_trigger = "Citizens and allies of Stormwind, on this day, history has been made.",
	nefHeadAlliance_trigger = "Citizens of the Alliance, the Lord of Blackrock is slain! Nefarian has been subdued by the combined might of",

	zgHeart_trigger = "Now, only one step remains to rid us of the Soulflayer's threat...",
	rendHead_trigger = "Honor your heroes! On this day, they have dealt a great blow against one of our most hated enemies! The false Warchief, Rend Blackhand, has fallen!",

	dragonslayer = "Rallying Cry of the Dragonslayer",
	zandalar = "Spirit of Zandalar",
	blessing = "Warchief's Blessing",--]]

	["worldbuffs"] = true,
	["World Buff Timers"] = true,
	["Gives timer bars to see when world buffs are going out."] = true,

	["Enable"] = true,
	["Enable timers"] = true,

	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-02-08
	onyHeadHorde_trigger = "People of the Horde, citizens of Orgrimmar, come, gather round and celebrate a hero of the Horde. On this day",
	nefHeadHorde_trigger = "NEFARIAN IS SLAIN! People of Orgrimmar, bow down before the might of",

	onyHeadAlliance_trigger = "Citizens and allies of Stormwind, on this day, history has been made.",
	nefHeadAlliance_trigger = "Citizens of the Alliance, the Lord of Blackrock is slain! Nefarian has been subdued by the combined might of",

	zgHeart_trigger = "Now, only one step remains to rid us of the Soulflayer's threat...",
	rendHead_trigger = "Honor your heroes! On this day, they have dealt a great blow against one of our most hated enemies! The false Warchief, Rend Blackhand, has fallen!",

	dragonslayer = "Rallying Cry of the Dragonslayer",
	zandalar = "Spirit of Zandalar",
	blessing = "Warchief's Blessing",
	
	["worldbuffs"] = "worldbuffs",
	["World Buff Timers"] = "世界Buff计时条",
	["Gives timer bars to see when world buffs are going out."] = "用计时条查看世界buff什么时候消失.",
	
	["Enable"] = "开启",
	["Enable timers"] = "开启计时条",
} end )


L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-02-08
	onyHeadHorde_trigger = "部落的勇士，奥格瑞玛的人民，来吧，聚集在一起，为部落的英雄庆祝，在这一天！",
	nefHeadHorde_trigger = "奈法利安已被击败！奥格瑞玛的人民，向伟大的",

	onyHeadAlliance_trigger = "暴风城的市民和盟友们，今天，历史已经创造。",
	nefHeadAlliance_trigger = "联盟的市民们，黑石之王已被击倒！奈法利安已经被",

	zgHeart_trigger = "现在，我们只剩下一步就能摆脱屠魂者的威胁...",
	rendHead_trigger = "向你们的英雄致敬！在这一天，他们对我们最仇恨的敌人之一给予了沉重的打击！，虚伪的酋长雷德·黑手他已经倒下！",

	dragonslayer = "屠龙者的咆哮",
	zandalar = "赞达拉之魂",
	blessing = "酋长的祝福",

	["worldbuffs"] = "世界Buff",
	["World Buff Timers"] = "世界Buff计时条",
	["Gives timer bars to see when world buffs are going out."] = "用计时条查看世界Buff什么时候消失.",
	
	["Enable"] = "开启",
	["Enable timers"] = "开启计时条",
} end )


L:RegisterTranslations("esES", function() return {
	onyHeadHorde_trigger = "People of the Horde, citizens of Orgrimmar, come, gather round and celebrate a hero of the Horde. On this day",
	nefHeadHorde_trigger = "NEFARIAN IS SLAIN! People of Orgrimmar, bow down before the might of",

	onyHeadAlliance_trigger = "Citizens and allies of Stormwind, on this day, history has been made.",
	nefHeadAlliance_trigger = "Citizens of the Alliance, the Lord of Blackrock is slain! Nefarian has been subdued by the combined might of",

	zgHeart_trigger = "Now, only one step remains to rid us of the Soulflayer's threat...",
	rendHead_trigger = "Honor your heroes! On this day, they have dealt a great blow against one of our most hated enemies! The false Warchief, Rend Blackhand, has fallen!",

	dragonslayer = "Recobrar el llanto del cazadragones",
	zandalar = "Espíritu de Zandalar",
	blessing = "Bendición del Jefe de Guerra",

	--["worldbuffs"] = true,
	["World Buff Timers"] = "Temporizador de Buffs del Mundo",
	["Gives timer bars to see when world buffs are going out."] = "Muestra barras temporizadoras para mostrar cuando será un buff del mundo",

	["Enable"] = "Activar",
	["Enable timers"] = "Activa los temporizadores",
} end )


------------------------------
--      Module              --
------------------------------

BigWigsWorldBuffs = BigWigs:NewModule(name)
BigWigsWorldBuffs.defaultDB = {
	enabled = true,
}

BigWigsWorldBuffs.consoleCmd = L["worldbuffs"]
BigWigsWorldBuffs.consoleOptions = {
	type = "group",
	name = L["World Buff Timers"],
	desc = L["Gives timer bars to see when world buffs are going out."],
	args   = {
		["enable"] = {
			type = "toggle",
			name = L["Enable"],
			desc = L["Enable timers"],
			get = function() return BigWigsWorldBuffs.db.profile.enabled end,
			set = function(v) BigWigsWorldBuffs.db.profile.enabled = v end,
		},
	}
}
BigWigsWorldBuffs.revision = 20001
BigWigsWorldBuffs.external = true

------------------------------
--      Initialization      --
------------------------------
local timer = {
	onyHeadHorde = 15,
	nefHeadHorde = 17,
	onyHeadAlliance = 17,
	nefHeadAlliance = 17,
	zgHeart = 59,
	rendHead = 12,
}
local icon = {
	dragonslayer = "inv_misc_head_dragon_01",
	blessing = "spell_arcane_teleportorgrimmar",
	zandalar = "ability_creature_poison_05",
}


function BigWigsWorldBuffs:OnEnable()

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_MONSTER_SAY")

end

------------------------------
--      Events              --
------------------------------
function BigWigsWorldBuffs:CHAT_MSG_MONSTER_SAY(msg)
	if self.db.profile.enabled then
		if string.find(msg, L["zgHeart_trigger"]) then
			self:Bar(L["zandalar"], timer.zgHeart, icon.zandalar)
		end
	end
end

function BigWigsWorldBuffs:CHAT_MSG_MONSTER_YELL(msg)
	if self.db.profile.enabled then
		if string.find(msg, L["onyHeadHorde_trigger"]) then
			self:Bar(L["dragonslayer"], timer.onyHeadHorde, icon.dragonslayer)
		elseif string.find(msg, L["nefHeadHorde_trigger"]) then
			self:Bar(L["dragonslayer"], timer.nefHeadHorde, icon.dragonslayer)
		elseif string.find(msg, L["onyHeadAlliance_trigger"]) then
			self:Bar(L["dragonslayer"], timer.onyHeadAlliance, icon.dragonslayer)
		elseif string.find(msg, L["nefHeadAlliance_trigger"]) then
			self:Bar(L["dragonslayer"], timer.nefHeadAlliance, icon.dragonslayer)
		elseif string.find(msg, L["rendHead_trigger"]) then
			self:Bar(L["blessing"], timer.rendHead, icon.blessing)
		end
	end
end
