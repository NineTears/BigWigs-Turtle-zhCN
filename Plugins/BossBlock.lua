
----------------------------
--      Localization      --
----------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsBossBlock")

L:RegisterTranslations("enUS", function() return {
	["BossBlock"] = true,
	["Suppress bossmod chat from other players."] = true,

	["Suppress Raid Chat"] = true,
	["Suppress messages in the raid channel."] = true,

	["Suppress RaidWarn Chat"] = true,
	["Suppress RaidWarn messages in the chat frames."] = true,

	["Suppress RaidWarn"] = true,
	["Suppress RaidWarn popup messages."] = true,

	["Suppress RaidSay"] = true,
	["Suppress CTRA RaidSay popup messages."] = true,
	["Suppress oRA RaidSay popup messages."] = true,
	["Suppress oRA2 RaidSay popup messages."] = true,

	["Suppress Tells"] = true,
	["Suppress Tell messages."] = true,

	["Debugging"] = true,
	["Show debug messages."] = true,

	["Suppressing Chatframe"] = true,
	["Suppressing RaidWarningFrame"] = true,
	["Suppressing CT_RAMessageFrame"] = true,

	["Suppressed"] = true,
	["Shown"] = true,

	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	["BossBlock"] = "信息屏蔽",
	["Suppress bossmod chat from other players."] = "屏蔽来自其他玩家的首领插件发送的信息。",

	["Suppress Raid Chat"] = "屏蔽团队频道",
	["Suppress messages in the raid channel."] = "屏蔽来自于团队频道的信息.",

	["Suppress RaidWarn Chat"] = "屏蔽团队警告频道",
	["Suppress RaidWarn messages in the chat frames."] = "禁止在聊天框中显示团队警告信息",

	["Suppress RaidWarn"] = "屏蔽团队通知",
	["Suppress RaidWarn popup messages."] = "屏蔽团队通知的RW消息",

	["Suppress RaidSay"] = "屏蔽CTRA_RS消息",
	["Suppress CTRA RaidSay popup messages."] = "屏蔽团队助手(CTRA)的RS信息",
	["Suppress oRA RaidSay popup messages."] = "屏蔽oRA团队通告弹出消息.",
	["Suppress oRA2 RaidSay popup messages."] = "屏蔽oRA2团队通告弹出消息.",

	["Suppress Tells"] = "屏蔽密语",
	["Suppress Tell messages."] = "屏蔽密语中的信息",

	["Debugging"] = "调试",
	["Show debug messages."] = "显示调试信息",

	["Suppressing Chatframe"] = "正在屏蔽聊天框",
	["Suppressing RaidWarningFrame"] = "正在屏蔽团队警告框架",
	["Suppressing CT_RAMessageFrame"] = "正在屏蔽CT_RAMessageFrame",

	["Suppressed"] = "屏蔽",
	["Shown"] = "显示",
} end)

L:RegisterTranslations("esES", function() return {
	["BossBlock"] = "Bloque de Jefe",
	["Suppress bossmod chat from other players."] = "Bloquea el chat de los módulos de jefes de otro jugadores",

	["Suppress Raid Chat"] = "Bloquear Chat de la Banda",
	["Suppress messages in the raid channel."] = "Bloquea los mensajes en el chat de la banda",

	["Suppress RaidWarn Chat"] = "Bloquear Chat de Advertencia de la Banda",
	["Suppress RaidWarn messages in the chat frames."] = "Bloquea mensajes de Advertencia de la Banda en el chat",

	["Suppress RaidWarn"] = "Bloquear Advertencia de la Banda",
	["Suppress RaidWarn popup messages."] = "Bloquea mensajes de Adventencia de la Banda",

	["Suppress RaidSay"] = "Bloquear RaidSay",
	["Suppress CTRA RaidSay popup messages."] = "Bloquea mensajes de CTRA RaidSay",
	["Suppress oRA RaidSay popup messages."] = "Bloquea mensajes de oRA RaidSay",
	["Suppress oRA2 RaidSay popup messages."] = "Bloquea mensajes de oTRA2",

	["Suppress Tells"] = "Bloquear mensajes personales",
	["Suppress Tell messages."] = "Bloquea mensajes personales",

	["Debugging"] = "Depurar",
	["Show debug messages."] = "Mostrar mensajes de depura",

	["Suppressing Chatframe"] = "Bloquea el marco de chat",
	["Suppressing RaidWarningFrame"] = "Bloquea el marco de Advertencia de la Banda",
	["Suppressing CT_RAMessageFrame"] = "Bloquea CT_RAMessageFrame",

	["Suppressed"] = "Bloqueado",
	["Shown"] = "Mostrado",
} end)

L:RegisterTranslations("koKR", function() return {
	["BossBlock"] = "보스차단",
	["Suppress bossmod chat from other players."] = "타인의 보스모드 대화 차단.",

	["Suppress Raid Chat"] = "공격대 대화 차단",
	["Suppress messages in the raid channel."] = "공격대 채널에 메세지 차단.",

	["Suppress RaidWarn Chat"] = "공격대경고 대화 차단",
	["Suppress RaidWarn messages in the chat frames."] = "대화창에 공격대경고 메세지 차단",

	["Suppress RaidWarn"] = "공격대경고 차단",
	["Suppress RaidWarn popup messages."] = "공격대경고 알림 메세지 차단",

	["Suppress RaidSay"] = "RaidSay 차단",
	["Suppress CTRA RaidSay popup messages."] = "CTRA RaidSay 알림 메세지 차단",
	["Suppress oRA RaidSay popup messages."] = "oRA RaidSay 알림 메세지 차단",
	["Suppress oRA2 RaidSay popup messages."] = "oRA2 RaidSay 알림 메세지 차단",

	["Suppress Tells"] = "일반대화 차단",
	["Suppress Tell messages."] = "일반대화 메세지 차단",

	["Debugging"] = "디버깅",
	["Show debug messages."] = "디버그 메세지 표시",

	["Suppressing Chatframe"] = "대화창 차단됨",
	["Suppressing RaidWarningFrame"] = "공격대경고창 차단됨",
	["Suppressing CT_RAMessageFrame"] = "CR_RA메세지창 차단됨",

	["Suppressed"] = "차단됨",
	["Shown"] = "표시함",

} end)

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	["BossBlock"] = "信息屏蔽",
	["Suppress bossmod chat from other players."] = "屏蔽来自其他玩家的首领插件发送的信息。",

	["Suppress Raid Chat"] = "屏蔽团队频道",
	["Suppress messages in the raid channel."] = "屏蔽来自于团队频道的信息.",

	["Suppress RaidWarn Chat"] = "屏蔽团队警告频道",
	["Suppress RaidWarn messages in the chat frames."] = "禁止在聊天框中显示团队警告信息",

	["Suppress RaidWarn"] = "屏蔽团队通知",
	["Suppress RaidWarn popup messages."] = "屏蔽团队通知的RW消息",

	["Suppress RaidSay"] = "屏蔽CTRA_RS消息",
	["Suppress CTRA RaidSay popup messages."] = "屏蔽团队助手(CTRA)的RS信息",
	["Suppress oRA RaidSay popup messages."] = "屏蔽oRA团队通告弹出消息.",
	["Suppress oRA2 RaidSay popup messages."] = "屏蔽oRA2团队通告弹出消息.",

	["Suppress Tells"] = "屏蔽密语",
	["Suppress Tell messages."] = "屏蔽密语中的信息",

	["Debugging"] = "调试",
	["Show debug messages."] = "显示调试信息",

	["Suppressing Chatframe"] = "正在屏蔽聊天框",
	["Suppressing RaidWarningFrame"] = "正在屏蔽团队警告框架",
	["Suppressing CT_RAMessageFrame"] = "正在屏蔽CT_RAMessageFrame",

	["Suppressed"] = "屏蔽",
	["Shown"] = "显示",
} end)


L:RegisterTranslations("zhTW", function() return {
	["BossBlock"] = "訊息阻擋",
	["Suppress bossmod chat from other players."] = "阻擋其他玩家的首領插件發送的訊息。",

	["Suppress Raid Chat"] = "阻擋團隊頻道",
	["Suppress messages in the raid channel."] = "阻擋團隊頻道中的訊息",

	["Suppress RaidWarn Chat"] = "阻擋團隊警告聊天",
	["Suppress RaidWarn messages in the chat frames."] = "阻擋聊天窗體中的團隊警告訊息",

	["Suppress RaidWarn"] = "阻擋團隊警告",
	["Suppress RaidWarn popup messages."] = "阻擋團隊警告中的訊息",

	["Suppress RaidSay"] = "阻擋RS",
	["Suppress CTRA RaidSay popup messages."] = "阻擋團隊助手(CTRA)的RS訊息",

	["Suppress Tells"] = "阻擋密語",
	["Suppress Tell messages."] = "阻擋密語中的訊息",

	["Debugging"] = "除錯",
	["Show debug messages."] = "顯示除錯訊息",

	["Suppressing Chatframe"] = "正在阻擋Chatframe",
	["Suppressing RaidWarningFrame"] = "正在阻擋RaidWarningFrame",
	["Suppressing CT_RAMessageFrame"] = "正在阻擋CT_RAMessageFrame",

	["Suppressed"] = "阻擋",
	["Shown"] = "顯示",
} end)

L:RegisterTranslations("deDE", function() return {
	["BossBlock"] = "BossBlock",
	["Suppress bossmod chat from other players."] = "Bossmod Meldungen von anderen Spielern unterdrücken.",

	["Suppress Raid Chat"] = "Raid Chat unterdrücken",
	["Suppress messages in the raid channel."] = "Nachrichten im Raid Channel unterdrücken",

	["Suppress RaidWarn Chat"] = "RaidWarn Chat unterdrücken",
	["Suppress RaidWarn messages in the chat frames."] = "RaidWarn Nachrichten im Chat Fenster unterdrücken.",

	["Suppress RaidWarn"] = "RaidWarn unterdrücken",
	["Suppress RaidWarn popup messages."] = "RaidWarn Popup-Nachrichten unterdrücken.",

	["Suppress RaidSay"] = "RaidSay unterdrücken",
	["Suppress CTRA RaidSay popup messages."] = "CTRA RaidSay Popup Nachrichten unterdrücken.",
	["Suppress oRA RaidSay popup messages."] = "oRA RaidSay Popup Nachrichten unterdrücken.",
	["Suppress oRA2 RaidSay popup messages."] = "oRA2 RaidSay Popup Nachrichten unterdrücken.",

	["Suppress Tells"] = "Flüstern unterdrücken",
	["Suppress Tell messages."] = "Flüstern Nachrichten unterdrücken.",

	["Debugging"] = "Debugging",
	["Show debug messages."] = "Debug Nachrichten anzeigen.",

	["Suppressing Chatframe"] = "Chatframe unterdrückt",
	["Suppressing RaidWarningFrame"] = "RaidWarningFrame unterdrücket",
	["Suppressing CT_RAMessageFrame"] = "CT_RAMessageFrame unterdrückt",

	["Suppressed"] = "Unterdrückt",
	["Shown"] = "Angezeigt",
} end)

L:RegisterTranslations("frFR", function() return {
	["BossBlock"] = "BossBlock",
	["Suppress bossmod chat from other players."] = "Supprime les messages des BossMods des autres joueurs.",

	["Suppress Raid Chat"] = "Supprimer les messages du canal Raid",
	["Suppress messages in the raid channel."] = "Supprime les messages du canal Raid.",

	["Suppress RaidWarn Chat"] = "Supprimer les Avertissements Raid du chat",
	["Suppress RaidWarn messages in the chat frames."] = "Supprime les messages de l'Avertissement Raid de la fenêtre de discussion.",

	["Suppress RaidWarn"] = "Supprimer les Avertissements Raid",
	["Suppress RaidWarn popup messages."] = "Supprime les messages à l'écran de l'Avertissement Raid.",

	["Suppress RaidSay"] = "Supprimer les RaidSay",
	["Suppress CTRA RaidSay popup messages."] = "Supprime les messages à l'écran du RaidSay de CTRA.",
	["Suppress oRA RaidSay popup messages."] = "Supprime les messages à l'écran du RaidSay de oRA.",
	["Suppress oRA2 RaidSay popup messages."] = "Supprime les messages à l'écran du RaidSay de oRA2.",

	["Suppress Tells"] = "Supprimer les chuchotements",
	["Suppress Tell messages."] = "Supprime les messages chuchotés.",

	["Debugging"] = "Débogage",
	["Show debug messages."] = "Affiche les messages de débogage.",

	["Suppressing Chatframe"] = "Suppression de la fenêtre de discussion",
	["Suppressing RaidWarningFrame"] = "Suppression du cadre de l'Avertissement Raid",
	["Suppressing CT_RAMessageFrame"] = "Suppression du cadre du RaidSay de CTRA",

	["Suppressed"] = "Supprimé",
	["Shown"] = "Affiché",
} end)

------------------------------
--      Are you local?      --
------------------------------

local raidchans = {
	CHAT_MSG_WHISPER = "hidetells",
	CHAT_MSG_RAID = "hideraidchat",
	CHAT_MSG_RAID_WARNING = "hideraidwarnchat",
	CHAT_MSG_RAID_LEADER = "hideraidchat",
}
local map = {[true] = "|cffff0000"..L["Suppressed"].."|r", [false] = "|cff00ff00"..L["Shown"].."|r"}
local blockregexs = {
	"%*+ .+ %*+$",
}
local blockstrings = {
	-- enUS
	["YOU HAVE THE PLAGUE!"] = true,
	["YOU ARE THE BOMB!"] = true,
	["YOU ARE BEING WATCHED!"] = true,
	["YOU ARE CURSED!"] = true,
	["YOU ARE BURNING!"] = true,
	["YOU ARE AFFLICTED BY VOLATILE INFECTION!"] = true,
	["YOU ARE MARKED!"] = true,

	-- znCH
	["你中了瘟疫！离开人群！"] = true,
	["你是炸弹人！"] = true,
	["你被盯上了！"] = true,
	["你中了诅咒！"] = true,
	["你正在燃烧！"] = true,
	["你中了快速传染！"] = true,
	["你被标记了！"] = true,

	-- deDE
	["DU HAST DIE SEUCHE!"] = true,
	["DU BIST DIE BOMBE!"] = true,
	["DU WIRST BEOBACHTET!"] = true,
	["DU BIST VERFLUCHT!"] = true,
	["DU BRENNST!"] = true,
	-- ["YOU ARE AFFLICTED BY VOLATILE INFECTION!"] = true,
	["DU BIST MARKIERT!"] = true,

	-- frFR
	["TU AS LA PESTE !"] = true,
	["TU ES LA BOMBE !"] = true,
	["TU ES SURVEILLE !"] = true,
	["TU ES MAUDIT !"] = true,
	["TU BRULES !"] = true,
	["TU ES AFFLIGE PAR INFECTION VOLATILE !"] = true,
	["TU ES MARQUE !"] = true,

}


----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsBossBlock = BigWigs:NewModule("BossBlock", "AceHook-2.1")
BigWigsBossBlock.defaultDB = {
	hideraidwarnchat = true,
	hideraidwarn = true,
	hideraidsay = true,
	hideraidchat = true,
	hidetells = true,
}
BigWigsBossBlock.consoleCmd = "block"
BigWigsBossBlock.consoleOptions = {
	type = "group",
	name = L["BossBlock"],
	desc = L["Suppress bossmod chat from other players."],
	args   = {
		["chat"] = {
			type = "toggle",
			order = 101,
			name = L["Suppress Raid Chat"],
			desc = L["Suppress messages in the raid channel."],
			get = function() return BigWigsBossBlock.db.profile.hideraidchat end,
			set = function(v) BigWigsBossBlock.db.profile.hideraidchat = v end,
			map = map,
		},
		["rs"] = {
			type = "toggle",
			order = 102,
			name = L["Suppress RaidSay"],
			desc = L["Suppress CTRA RaidSay popup messages."],
			get = function() return BigWigsBossBlock.db.profile.hideraidsay end,
			set = function(v) BigWigsBossBlock.db.profile.hideraidsay = v end,
			map = map,
			hidden = function() return not CT_RAMessageFrame end,
		},
		["ora_rs"] = {
			type = "toggle",
			order = 103,
			name = L["Suppress RaidSay"],
			desc = L["Suppress oRA RaidSay popup messages."],
			get = function() return oRA_RaidSay:GetOpt("blockboss") end,
			set = function(v) oRA_RaidSay:TogOpt("blockboss") end,
			map = map,
			hidden = function() return not oRA_RaidSay end,
		},
		["ora2_rs"] = {
			type = "toggle",
			order = 104,
			name = L["Suppress RaidSay"],
			desc = L["Suppress oRA2 RaidSay popup messages."],
			get = function() return oRAPRaidWarn.db.profile.bossblock end,
			set = function(v) oRAPRaidWarn.db.profile.bossblock = v end,
			map = map,
			hidden = function() return not oRAPRaidWarn end,
		},
		["rw"] = {
			type = "toggle",
			order = 105,
			name = L["Suppress RaidWarn"],
			desc = L["Suppress RaidWarn popup messages."],
			get = function() return BigWigsBossBlock.db.profile.hideraidwarn end,
			set = function(v) BigWigsBossBlock.db.profile.hideraidwarn = v end,
			map = map,
		},
		["rwchat"] = {
			type = "toggle",
			order = 106,
			name = L["Suppress RaidWarn Chat"],
			desc = L["Suppress RaidWarn messages in the chat frames."],
			get = function() return BigWigsBossBlock.db.profile.hideraidwarnchat end,
			set = function(v) BigWigsBossBlock.db.profile.hideraidwarnchat = v end,
			map = map,
		},
		["tell"] = {
			type = "toggle",
			order = 107,
			name = L["Suppress Tells"],
			desc = L["Suppress Tell messages."],
			get = function() return BigWigsBossBlock.db.profile.hidetells end,
			set = function(v) BigWigsBossBlock.db.profile.hidetells = v end,
			map = map,
		},
		["debugspacer"] = {
			type = "header",
			order = 108,
			hidden = function() return not BigWigsBossBlock:IsDebugging() and not BigWigs:IsDebugging() end,
		},
		["debug"] = {
			type = "toggle",
			name = L["Debugging"],
			desc = L["Show debug messages."],
			order = 109,
			get = function() return BigWigsBossBlock:IsDebugging() end,
			set = function(v) BigWigsBossBlock:SetDebugging(v) end,
			hidden = function() return not BigWigsBossBlock:IsDebugging() and not BigWigs:IsDebugging() end,
		},
	},
}

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsBossBlock:OnEnable()
	if ChatFrame_MessageEventHandler ~= nil and type(ChatFrame_MessageEventHandler) == "function" then
		self:Hook("ChatFrame_MessageEventHandler", "ChatFrame_OnEvent", true)
	else
		self:Hook("ChatFrame_OnEvent", true)
	end

	self:Hook(RaidWarningFrame, "AddMessage", "RWAddMessage", true)
	if CT_RAMessageFrame then self:Hook(CT_RAMessageFrame, "AddMessage", "CTRA_AddMessage") end
end


function BigWigsBossBlock:ChatFrame_OnEvent(event)
	if self:IsChannelSuppressed(event) and self:IsSpam(arg1) then
		--self:Debug(L["Suppressing Chatframe"], event, arg1)
		return
	end
	if type(self.hooks["ChatFrame_OnEvent"]) == "function" and event then
		--BigWigs:DebugMessage("ChatFrame_OnEvent " .. event)
		self.hooks["ChatFrame_OnEvent"](event)
	else
		return self.hooks["ChatFrame_MessageEventHandler"](event)
	end
end


function BigWigsBossBlock:RWAddMessage(frame, message, r, g, b, a)
	if self.db.profile.hideraidwarn and self:IsSpam(message) then
		self:Debug(L["Suppressing RaidWarningFrame"], message)
		return
	end
	self.hooks[RaidWarningFrame].AddMessage(frame, message, r, g, b, a)
end


function BigWigsBossBlock:CTRA_AddMessage(obj, text, red, green, blue, alpha, holdTime)
	if self.db.profile.hideraidsay and self:IsSpam(text) then
		self:Debug(L["Suppressing CT_RAMessageFrame"], text)
		return
	end
	self.hooks[obj].AddMessage(obj, text, red, green, blue, alpha, holdTime)
end


function BigWigsBossBlock:IsSpam(text)
	if not text then return end
	if blockstrings[text] then return true end
	for _,regex in pairs(blockregexs) do if string.find(text, regex) then return true end end
end


function BigWigsBossBlock:IsChannelSuppressed(chan)
	if not raidchans[chan] then return end
	return self.db.profile[raidchans[chan]]
end


