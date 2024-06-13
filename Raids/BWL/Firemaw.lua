
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Firemaw", "Blackwing Lair")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
    wingbuffet_trigger = "Firemaw begins to cast Wing Buffet.",
    shadowflame_trigger = "Firemaw begins to cast Shadow Flame.",
    flamebuffetafflicted_trigger = "afflicted by Flame Buffet",
    flamebuffetresisted_trigger = "Firemaw 's Flame Buffet was resisted",
    flamebuffetimmune_trigger = "Firemaw 's Flame Buffet fail(.+) immune\.",
    flamebuffetabsorb1_trigger = "You absorb Firemaw 's Flame Buffet",
    flamebuffetabsorb2_trigger = "Firemaw 's Flame Buffet is absorbed",

    wingbuffet_message = "龙翼攻击！下一次龙翼攻击将在30秒后到来！",
    wingbuffet_warning = "现在嘲讽！龙翼攻击即将到来！",
    shadowflame_warning = "暗影烈焰来袭！",

    wingbuffetcast_bar = "龙翼攻击施放",
    wingbuffet_bar = "下一次龙翼攻击",
    wingbuffet1_bar = "首次龙翼攻击",
    shadowflame_bar = "暗影烈焰",
    shadowflame_Nextbar = "下一次暗影烈焰",
    flamebuffet_bar = "烈焰打击",

    cmd = "Firemaw",

    flamebuffet_cmd = "flamebuffet",
    flamebuffet_name = "烈焰打击警报",
    flamebuffet_desc = "当弗莱格尔施放烈焰打击时进行警告",

    wingbuffet_cmd = "wingbuffet",
    wingbuffet_name = "龙翼攻击警报",
    wingbuffet_desc = "当弗莱格尔施放龙翼攻击时进行警告",

    shadowflame_cmd = "shadowflame",
    shadowflame_name = "暗影烈焰警报",
    shadowflame_desc = "当弗莱格尔施放暗影烈焰时进行警告", 
} end)

L:RegisterTranslations("esES", function() return {
	wingbuffet_trigger = "Faucefogo comienza a lanzar Festín de alas.",
	shadowflame_trigger = "Faucefogo comienza a lanzar Llama de las Sombras.",
	flamebuffetafflicted_trigger = "sufre de Sacudón de llamas",
	flamebuffetresisted_trigger = "Resistido Sacudón de llamas de Faucefogo",
	flamebuffetimmune_trigger = "Sacudón de llamas de Faucefogo falla(.+) inmune\.",
	flamebuffetabsorb1_trigger = "Absorbe Sacudón de llamas de Faucefogo",
	flamebuffetabsorb2_trigger = "Sacudón de llamas de Faucefogo es absorbido",

	wingbuffet_message = "¡Festín de alas! El Próximo en 30 segundos!",
	wingbuffet_warning = "¡IRRITA ahora! Festín de alas pronto!",
	shadowflame_warning = "¡Llama de las Sombras entrante!",

	wingbuffetcast_bar = "Festín de alas",
	wingbuffet_bar = "Próximo Festín de alas",
	wingbuffet1_bar = "Festín de alas Inicial",
	shadowflame_bar = "Llama de las Sombras",
	shadowflame_Nextbar = "Próxima Llama de las Sombras",
	flamebuffet_bar = "Sacudón de llamas",

	--cmd = "Firemaw",

	--flamebuffet_cmd = "flamebuffet",
	flamebuffet_name = "Alerta de Sacudón de llamas",
	flamebuffet_desc = "Avisa cuando Faucefogo lance Sacudón de llamas.",

	--wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Alerta de Festín de alas",
	wingbuffet_desc = "Avisa cuando Faucefogo lance Festín de alas.",

	--shadowflame_cmd = "shadowflame",
	shadowflame_name = "Alerta de Llama de las Sombras",
	shadowflame_desc = "Avisa cuando Faucefogo lance Llama de las Sombras.",
} end)

L:RegisterTranslations("deDE", function() return {
	wingbuffet_trigger = "Ebonroc beginnt Fl\195\188gelsto\195\159 zu wirken.",
	shadowflame_trigger = "Ebonroc beginnt Schattenflamme zu wirken.",
	flamebuffetafflicted_trigger = "von Flammenpuffer betroffen",
	flamebuffetresisted_trigger = "Flammenpuffer(.+) widerstanden",
	flamebuffetimmune_trigger = "Flammenpuffer(.+) immun",
	flamebuffetabsorb1_trigger = "Ihr absorbiert Firemaws Flammenpuffer",
	flamebuffetabsorb2_trigger = "Flammenpuffer von Firemaw wird absorbiert von",

	wingbuffet_message = "Fl\195\188gelsto\195\159! N\195\164chster in 30 Sekunden!",
	wingbuffet_warning = "Jetzt TAUNT! Fl\195\188gelsto\195\159 bald!",
	shadowflame_warning = "Schattenflamme bald!",

	wingbuffetcast_bar = "Fl\195\188gelsto\195\159",
	wingbuffet_bar = "N\195\164chster Fl\195\188gelsto\195\159",
	wingbuffet1_bar = "Erster Fl\195\188gelsto\195\159",
	shadowflame_bar = "Schattenflamme",
	shadowflame_Nextbar = "Nächste Schattenflamme",
	flamebuffet_bar = "Flammenpuffer",

	cmd = "Firemaw",

	flamebuffet_cmd = "flamebuffet",
	flamebuffet_name = "Alarm f\195\188r Flammenpuffer",
	flamebuffet_desc = "Warnung f\195\188r Flammenpuffer.",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Alarm f\195\188r Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Warnung, wenn Ebonroc Fl\195\188gelsto\195\159 wirkt.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "Alarm f\195\188r Schattenflamme",
	shadowflame_desc = "Warnung, wenn Ebonroc Schattenflamme wirkt.",
} end)

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-11
    wingbuffet_trigger = "Firemaw begins to cast Wing Buffet.",
    shadowflame_trigger = "Firemaw begins to cast Shadow Flame.",
    flamebuffetafflicted_trigger = "afflicted by Flame Buffet",
    flamebuffetresisted_trigger = "Firemaw 's Flame Buffet was resisted",
    flamebuffetimmune_trigger = "Firemaw 's Flame Buffet fail(.+) immune\.",
    flamebuffetabsorb1_trigger = "You absorb Firemaw 's Flame Buffet",
    flamebuffetabsorb2_trigger = "Firemaw 's Flame Buffet is absorbed",

    wingbuffet_message = "龙翼攻击！下一次龙翼攻击将在30秒后到来！",
    wingbuffet_warning = "现在嘲讽！龙翼攻击即将到来！",
    shadowflame_warning = "暗影烈焰来袭！",

    wingbuffetcast_bar = "龙翼攻击施放",
    wingbuffet_bar = "下一次龙翼攻击",
    wingbuffet1_bar = "首次龙翼攻击",
    shadowflame_bar = "暗影烈焰",
    shadowflame_Nextbar = "下一次暗影烈焰",
    flamebuffet_bar = "烈焰打击",

    cmd = "Firemaw",

    flamebuffet_cmd = "flamebuffet",
    flamebuffet_name = "烈焰打击警报",
    flamebuffet_desc = "当弗莱格尔施放烈焰打击时进行警告",

    wingbuffet_cmd = "wingbuffet",
    wingbuffet_name = "龙翼攻击警报",
    wingbuffet_desc = "当弗莱格尔施放龙翼攻击时进行警告",

    shadowflame_cmd = "shadowflame",
    shadowflame_name = "暗影烈焰警报",
    shadowflame_desc = "当弗莱格尔施放暗影烈焰时进行警告", 
} end)
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20007 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"wingbuffet", "shadowflame", "flamebuffet", "bosskill"}


-- locals
local timer = {
	firstWingbuffet = 30,
	wingbuffet = 30,
	wingbuffetCast = 1,
	shadowflame = 16,
	shadowflameCast = 2,
	firstFlameBuffet = 2,
	flameBuffet = 1.8,
}
local icon = {
	wingbuffet = "INV_Misc_MonsterScales_14",
	shadowflame = "Spell_Fire_Incinerate",
	flameBuffet = "Spell_Fire_Fireball"
}
local syncName = {
	wingbuffet = "FiremawWingBuffet"..module.revision,
	shadowflame = "FiremawShadowflame"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")

	self:ThrottleSync(10, syncName.wingbuffet)
	self:ThrottleSync(10, syncName.shadowflame)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.wingbuffet then
		self:DelayedMessage(timer.firstWingbuffet - 5, L["wingbuffet_warning"], "Attention", nil, nil, true)
		self:Bar(L["wingbuffet1_bar"], timer.firstWingbuffet, icon.wingbuffet, true, "yellow")
	end
	if self.db.profile.shadowflame then
		self:Bar(L["shadowflame_Nextbar"], timer.shadowflame, icon.shadowflame, true, "blue")
	end
	if self.db.profile.flamebuffet then
		self:Bar(L["flamebuffet_bar"], timer.firstFlameBuffet, icon.flameBuffet, true, "White")
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end

------------------------------
--      Event Handlers      --
------------------------------

function module:Event(msg)
	if msg == L["wingbuffet_trigger"] then
		self:Sync(syncName.wingbuffet)
	elseif msg == L["shadowflame_trigger"] then
		self:Sync(syncName.shadowflame)
		-- flamebuffet triggers too often on nefarian and therefor this warning doesn't make any sense
	elseif (string.find(msg, L["flamebuffetafflicted_trigger"]) or string.find(msg, L["flamebuffetresisted_trigger"]) or string.find(msg, L["flamebuffetimmune_trigger"]) or string.find(msg, L["flamebuffetabsorb1_trigger"]) or string.find(msg, L["flamebuffetabsorb2_trigger"])) and self.db.profile.flamebuffet then
		self:Bar(L["flamebuffet_bar"], timer.flameBuffet, icon.flameBuffet, true, "White")
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.wingbuffet and self.db.profile.wingbuffet then
		self:Message(L["wingbuffet_message"], "Important")
		self:RemoveBar(L["wingbuffet_bar"]) -- remove timer bar
		self:Bar(L["wingbuffetcast_bar"], timer.wingbuffetCast, icon.wingbuffet, true, "Black") -- show cast bar
		self:DelayedBar(timer.wingbuffetCast, L["wingbuffet_bar"], timer.wingbuffet, icon.wingbuffet, true, "yellow") -- delayed timer bar
		self:DelayedMessage(timer.wingbuffet - 5, L["wingbuffet_warning"], "Attention", nil, nil, true)
	elseif sync == syncName.shadowflame and self.db.profile.shadowflame then
		self:Message(L["shadowflame_warning"], "Important", true, "Alarm")
		self:RemoveBar(L["shadowflame_Nextbar"]) -- remove timer bar
		self:Bar(L["shadowflame_bar"], timer.shadowflameCast, icon.shadowflame, true, "red") -- show cast bar
		self:DelayedBar(timer.shadowflameCast, L["shadowflame_Nextbar"], timer.shadowflame-timer.shadowflameCast, icon.shadowflame, true, "blue") -- delayed timer bar
	end
end
