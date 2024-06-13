
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Ebonroc", "Blackwing Lair")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
    wingbuffet_trigger = "Ebonroc begins to cast Wing Buffet.",
    shadowflame_trigger = "Ebonroc begins to cast Shadow Flame.",
    shadowcurseyou_trigger = "You are afflicted by Shadow of Ebonroc\.",
    shadowcurseother_trigger = "(.+) is afflicted by Shadow of Ebonroc\.",
    wingbuffet_message = "龙翼攻击！下一次龙翼攻击将在30秒后到来！",
    wingbuffet_warning = "现在嘲讽！龙翼攻击即将到来！",
    shadowflame_warning = "暗影烈焰来袭！",
    shadowfcurse_message_you = "你受到了埃博诺克的暗影烈焰攻击！",
    shadowfcurse_message_taunt = "%s 受到了埃博诺克的暗影烈焰！立刻嘲讽！",

    wingbuffetcast_bar = "龙翼攻击施放",
    wingbuffet_bar = "下一次龙翼攻击",
    wingbuffet1_bar = "首次龙翼攻击",
    shadowflame_bar = "暗影烈焰",
    shadowflame_Nextbar = "下一次暗影烈焰",
    shadowcurse_bar = "%s - 埃博诺克的暗影烈焰",
    shadowcurse_Firstbar = "首次埃博诺克的暗影烈焰攻击",

    cmd = "Ebonroc",

    wingbuffet_cmd = "wingbuffet",
    wingbuffet_name = "龙翼攻击警报",
    wingbuffet_desc = "埃博诺克施放龙翼攻击时进行警告",

    shadowflame_cmd = "shadowflame",
    shadowflame_name = "暗影烈焰警报",
    shadowflame_desc = "埃博诺克施放暗影烈焰时进行警告",

    curse_cmd = "curse",
    curse_name = "埃博诺克的暗影警告",
    curse_desc = "显示计时条并通报谁受到了埃博诺克的暗影烈焰攻击。", 
} end)

L:RegisterTranslations("esES", function() return {
	wingbuffet_trigger = "Ebanorroca comienza a lanzar Festín de alas.",
	shadowflame_trigger = "Ebanorroca comienza a lanzar Llama de las Sombras.",
	shadowcurseyou_trigger = "sufres de Llama de las Sombras\.",
	shadowcurseother_trigger = "(.+) sufre de Sombra de Ebanorroca\.",
	wingbuffet_message = "¡Festín de alas! El Próximo en 30 segundos!",
	wingbuffet_warning = "¡IRRITA ahora! Festín de alas pronto!",
	shadowflame_warning = "¡Llama de las Sombras entrante!",
	shadowfcurse_message_you = "¡Tienes Sombra de Ebanorroca!",
	shadowfcurse_message_taunt = "¡%s tiene Sombra de Ebanorroca! IRRITA!",

	wingbuffetcast_bar = "Festín de alas",
	wingbuffet_bar = "Próximo Festín de alas",
	wingbuffet1_bar = "Festín de alas Inicial",
	shadowflame_bar = "Llama de las Sombras",
	shadowflame_Nextbar = "Próxima Llama de las Sombras",
	shadowcurse_bar = "%s - Sombra de Ebanorroca",
	shadowcurse_Firstbar = "Sombra de Ebanorroca Inicial",

	--cmd = "Ebonroc",

	--wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Alerta de Festín de alas",
	wingbuffet_desc = "Avisa cuando Ebanorroca lance Festín de alas.",

	--shadowflame_cmd = "shadowflame",
	shadowflame_name = "Alerta de Llama de las Sombras",
	shadowflame_desc = "Avisa cuando Ebanorroca lance Llama de las Sombras.",

	--curse_cmd = "curse",
	curse_name = "Alerta de Sombra de Ebanorroca",
	curse_desc = "Muestra una barra temporizadora y anuncia quién tiene Sombra de Ebanorroca.",
} end)

L:RegisterTranslations("deDE", function() return {
	wingbuffet_trigger = "Schattenschwinge beginnt Fl\195\188gelsto\195\159 zu wirken.",
	shadowflame_trigger = "Schattenschwinge beginnt Schattenflamme zu wirken.",
	shadowcurseyou_trigger = "Ihr seid von Schattenschwinges Schatten betroffen.",
	shadowcurseother_trigger = "(.+) ist von Schattenschwinges Schatten betroffen.",
	wingbuffet_message = "Fl\195\188gelsto\195\159! N\195\164chster in 30 Sekunden!",
	wingbuffet_warning = "SPOTT jetzt! Fl\195\188gelsto\195\159 bald!",
	shadowflame_warning = "Schattenflamme bald!",
	shadowfcurse_message_you = "Du hast Schattenschwinges Schatten!",
	shadowfcurse_message_taunt = "%s hat Schattenschwinges Schatten! SPOTT!",

	wingbuffetcast_bar = "Fl\195\188gelsto\195\159",
	wingbuffet_bar = "N\195\164chster Fl\195\188gelsto\195\159",
	wingbuffet1_bar = "Erster Fl\195\188gelsto\195\159",
	shadowflame_bar = "Schattenflamme",
	shadowflame_Nextbar = "Nächste Schattenflamme",
	shadowcurse_bar = "%s - Schattenschwinges Schatten",
	shadowcurse_Firstbar = "Erster Schattenschwinges Schatten",

	cmd = "Ebonroc",

	wingbuffet_cmd = "wingbuffet",
	wingbuffet_name = "Alarm f\195\188r Fl\195\188gelsto\195\159",
	wingbuffet_desc = "Warnung, wenn Ebonroc Fl\195\188gelsto\195\159 wirkt.",

	shadowflame_cmd = "shadowflame",
	shadowflame_name = "Alarm f\195\188r Schattenflamme",
	shadowflame_desc = "Warnung, wenn Ebonroc Schattenflamme wirkt.",

	curse_cmd = "curse",
	curse_name = "Schattenschwinges Schatten Warnungen",
	curse_desc = "Zeigt eine Zeitleiste und k\195\188ndigt an wer Schattenschwinges Schatten bekommt.",
} end)

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-11
    wingbuffet_trigger = "Ebonroc begins to cast Wing Buffet.",
    shadowflame_trigger = "Ebonroc begins to cast Shadow Flame.",
    shadowcurseyou_trigger = "You are afflicted by Shadow of Ebonroc\.",
    shadowcurseother_trigger = "(.+) is afflicted by Shadow of Ebonroc\.",
    wingbuffet_message = "龙翼攻击！下一次龙翼攻击将在30秒后到来！",
    wingbuffet_warning = "现在嘲讽！龙翼攻击即将到来！",
    shadowflame_warning = "暗影烈焰来袭！",
    shadowfcurse_message_you = "你受到了埃博诺克的暗影烈焰攻击！",
    shadowfcurse_message_taunt = "%s 受到了埃博诺克的暗影烈焰！立刻嘲讽！",

    wingbuffetcast_bar = "龙翼攻击施放",
    wingbuffet_bar = "下一次龙翼攻击",
    wingbuffet1_bar = "首次龙翼攻击",
    shadowflame_bar = "暗影烈焰",
    shadowflame_Nextbar = "下一次暗影烈焰",
    shadowcurse_bar = "%s - 埃博诺克的暗影烈焰",
    shadowcurse_Firstbar = "首次埃博诺克的暗影烈焰攻击",

    cmd = "Ebonroc",

    wingbuffet_cmd = "wingbuffet",
    wingbuffet_name = "龙翼攻击警报",
    wingbuffet_desc = "埃博诺克施放龙翼攻击时进行警告",

    shadowflame_cmd = "shadowflame",
    shadowflame_name = "暗影烈焰警报",
    shadowflame_desc = "埃博诺克施放暗影烈焰时进行警告",

    curse_cmd = "curse",
    curse_name = "埃博诺克的暗影警告",
    curse_desc = "显示计时条并通报谁受到了埃博诺克的暗影烈焰攻击。", 
} end)

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20007 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"curse", "wingbuffet", "shadowflame", "bosskill"}


-- locals
local timer = {
	wingbuffet = 30,
	wingbuffetCast = 1,
	curse = 8,
	shadowflame = 16,
	shadowflameCast = 2,
}
local icon = {
	wingbuffet = "INV_Misc_MonsterScales_14",
	curse = "Spell_Shadow_GatherShadows",
	shadowflame = "Spell_Fire_Incinerate",
}
local syncName = {
	wingbuffet = "EbonrocWingBuffet"..module.revision,
	shadowflame = "EbonrocShadowflame"..module.revision,
	curse = "EbonrocShadow"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")

	self:ThrottleSync(10, syncName.wingbuffet)
	self:ThrottleSync(5, syncName.shadowflame)
	self:ThrottleSync(5, syncName.curse)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.wingbuffet then
		self:Bar(L["wingbuffet1_bar"], timer.wingbuffet, icon.wingbuffet, true, "yellow")
		self:DelayedMessage(timer.wingbuffet - 5, L["wingbuffet_warning"], "Attention", nil, nil, true)
	end
	if self.db.profile.curse then
		self:Bar(L["shadowcurse_Firstbar"], timer.curse, icon.curse, true, "white")
	end
	if self.db.profile.shadowflame then
		self:Bar(L["shadowflame_Nextbar"], timer.shadowflame, icon.shadowflame, true, "blue")
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if msg == L["shadowflame_trigger"] then
		self:Sync(syncName.shadowflame)
	elseif msg == L["wingbuffet_trigger"] then
		self:Sync(syncName.wingbuffet)
	end
end

function module:Event(msg)
	local _,_,shadowcurseother,_ = string.find(msg, L["shadowcurseother_trigger"])
	if string.find(msg, L["shadowcurseyou_trigger"]) then
		self:Sync(syncName.curse .. " " .. UnitName("player"))
		if self.db.profile.curse then
			self:Message(L["shadowfcurse_message_you"], "Attention")
			self:WarningSign(icon.curse, timer.curse)
		end
	elseif shadowcurseother then
		self:Sync(syncName.curse .. " " .. shadowcurseother)
		if self.db.profile.curse then
			self:Message(string.format(L["shadowfcurse_message_taunt"], shadowcurseother), "Attention")
		end
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.wingbuffet then
		self:WingBuffet()
	elseif sync == syncName.shadowflame then
		self:ShadowFlame()
	elseif sync == syncName.curse and self.db.profile.curse then
		self:Bar(string.format(L["shadowcurse_bar"], rest), timer.curse, icon.curse, true, "white")
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:WingBuffet()
	if self.db.profile.wingbuffet then
		self:Message(L["wingbuffet_message"], "Important")
		self:RemoveBar(L["wingbuffet_bar"]) -- remove timer bar
		self:Bar(L["wingbuffetcast_bar"], timer.wingbuffetCast, icon.wingbuffet, true, "black") -- show cast bar
		self:DelayedBar(timer.wingbuffetCast, L["wingbuffet_bar"], timer.wingbuffet, icon.wingbuffet, true, "yellow") -- delayed timer bar
		self:DelayedMessage(timer.wingbuffet - 5, L["wingbuffet_warning"], "Attention", nil, nil, true)
	end
end

function module:ShadowFlame()
	if self.db.profile.shadowflame then
		self:Message(L["shadowflame_warning"], "Important", true, "Alarm")
		self:RemoveBar(L["shadowflame_Nextbar"]) -- remove timer bar
		self:Bar(L["shadowflame_bar"], timer.shadowflameCast, icon.shadowflame, true, "red") -- show cast bar
		self:DelayedBar(timer.shadowflameCast, L["shadowflame_Nextbar"], timer.shadowflame-timer.shadowflameCast, icon.shadowflame, true, "blue") -- delayed timer bar
	end
end
