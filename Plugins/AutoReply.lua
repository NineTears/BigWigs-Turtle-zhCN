--[[
by LYQ(Virose / MOUZU)
https://github.com/MOUZU/BigWigs

This is a small plugin which is inspired by later Bossmod versions which included a module to reply
to whispers incoming during encounters.
It can be used to inform that the player can not reply at the moment or to get a status of the
current fight.
--]]

------------------------------
--      Are you local?      --
------------------------------
local L = AceLibrary("AceLocale-2.2"):new("BigWigsAutoReply")
local c = {
	replied = {
	-- this is a list of players which we've already informed once to prevent spam
	}
}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {

		statusRequest_cmd = "statusRequest",
		statusRequest_name = "状态请求",
		statusRequest_desc = "允许查询Boss状态",

		healthStatus_cmd = "healthStatus",
		healthStatus_name = "生命值状态",
		healthStatus_desc = "允许玩家了解当前Boss的生命值",

		playersAlive_cmd = "playersAlive",
		playersAlive_name = "存活的玩家",
		playersAlive_desc = "允许玩家了解有多少团队成员存活",

} end )

L:RegisterTranslations("esES", function() return {

		--statusRequest_cmd = "statusRequest",
		statusRequest_name = "Solicita del Estado",
		statusRequest_desc = "Permitir que inquiere el Estado del Jefe",

		--healthStatus_cmd = "healthStatus",
		healthStatus_name = "Estado de la Salud",
		healthStatus_desc = "Permitir a los jugadores saber la Salud actual del Jefe",

		--playersAlive_cmd = "playersAlive",
		playersAlive_name = "Jugadores Vivos",
		playersAlive_desc = "Permitir a los jugadores saber cuantos miembros de la banda están vivos",

} end )

L:RegisterTranslations("zhCN", function() return {

		statusRequest_cmd = "statusRequest",
		statusRequest_name = "状态请求",
		statusRequest_desc = "允许查询Boss状态",

		healthStatus_cmd = "healthStatus",
		healthStatus_name = "生命值状态",
		healthStatus_desc = "允许玩家了解当前Boss的生命值",

		playersAlive_cmd = "playersAlive",
		playersAlive_name = "存活的玩家",
		playersAlive_desc = "允许玩家了解有多少团队成员存活",

} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsAutoReply = BigWigs:NewModule("AutoReply")
BigWigsAutoReply.toggleoptions = { "statusRequest", "healthStatus", "playersAlive" }

------------------------------
--      Initialization      --
------------------------------

function BigWigsAutoReply:OnEnable()
	self:RegisterEvent("CHAT_MSG_WHISPER")
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsAutoReply:CHAT_MSG_WHISPER()
	-- arg1 = msg / arg2 = unitName
	if arg1 == "status" and self.db.profile.statusRequest then
	-- if we allow others to request our status

	-- send whisper
	else
		for i=1, table.getn(c.replied) do
			if c.replied[i] == arg2 then return end
		end

		-- send whisper
		tinsert(c.replied, arg2)
	end
end

function BigWigsAutoReply:EndBossfight()
	-- send whisper that the fight ended to c.replied and then reset c.replied

	-- reset replied list
	for i=1, table.getn(c.replied) do
		c.replied[i] = nil  -- if I make this, does tinsert overwrite those again?
	end
end
