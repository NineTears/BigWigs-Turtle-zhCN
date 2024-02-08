
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Gri'lek", "Zul'Gurub")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
    cmd = "Grilek",

    avatar_trigger = "Gri\'lek gains Avatar\.",
    preavatar_warn = "即将天神下凡！近战请远离！",
    avatar_bar = "天神下凡",
    avatar_message = "天神下凡了！远离Boss！",
    avatar_end = "Avatar fades from Gri\'lek\.",
    avatar_whisper_you = "格里雷克正在追你！快跑！",
    avatar_whisper = "格里雷克正在追你！快跑！",
    avatar_watch = "格里雷克正在追 %s！",

    avatar_cmd = "avatar",
    avatar_name = "天神下凡警报",
    avatar_desc = "当Boss进入天神下凡（激怒阶段）时通报。",

    melee_cmd = "melee",
    melee_name = "近战警告",
    melee_desc = "在天神下凡施放前警告，这样近战职业可以及时远离Boss。",

    announce_cmd = "announce",
    announce_name = "密语玩家",
    announce_desc = "让被格里雷克选中的玩家知道，这样他们可以及时跑开。",

    puticon_cmd = "puticon",
    puticon_name = "放置标记",
    puticon_desc = "在被标记的玩家身上放置团队图标。\n\n（需要助理或更高权限）",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Grilek",

	avatar_trigger = "Gri\'lek gana Avatar\.",
	preavatar_warn = "¡Avatar pronto! Retroceden los melee!",
	avatar_bar = "Avatar",
	avatar_message = "¡Avatar! Váyanse del jefe!",
	avatar_end = "Avatar desaparece de Gri\'lek\.",
	avatar_whisper_you = "¡Gri'lek está viniendo hacia ti! Váyate!",
	avatar_whisper = "¡Gri'lek está viniendo hacia ti! Váyate!",
	avatar_watch = "¡Gri'lek está viniendo hacia %s!",

	--avatar_cmd = "avatar",
	avatar_name = "Alerta de Avatar",
	avatar_desc = "Anuncia cuando el jefe tenga Avatar.",

	--melee_cmd = "melee",
	melee_name = "Alerta para melee",
	melee_desc = "Avisa antes de que el jefe lance Avatar para que los melee puedan retroceder del jefe.",

	--announce_cmd = "announce",
	announce_name = "Susurrar a los jugadores",
	announce_desc = "Susurra a los jugadores para que sepan que son el objetivo de Gril'ek.",

	--puticon_cmd = "puticon",
	puticon_name = "Marcar el objetivo de Gri'lek",
	puticon_desc = "Marca con un icono el objetivo de Gri'lek.\n\n(Require asistente o líder)",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Grilek",

	avatar_trigger = "Gri\'lek bekommt \'Avatar\'\.",
	preavatar_warn = "Avatar bald! Nahk\195\164mpfer raus!",
	avatar_bar = "Avatar",
	avatar_message = "Avatar! Geh weg vom Boss!",
	avatar_end = "Avatar schwindet von Gri\'lek\.",
	avatar_whisper_you = "Gri'lek kommt auf dich zu! Lauf weg!",
	avatar_whisper = "Gri'lek kommt auf dich zu! Lauf weg!",
	avatar_watch = "Gri'lek verfolgt %s!",

	avatar_cmd = "avatar",
	avatar_name = "Alarm f\195\188r Avatar",
	avatar_desc = "Ank\195\188ndingen wenn der Boss Avatar ist (Raserei Phase).",

	melee_cmd = "melee",
	melee_name = "Warnunken f\195\188r die Nahk\195\164mpfer",
	melee_desc = "Warnt bevor Avatar gewirkt wird, sodass die Nahk\195\164mpfe Zeit haben um sich vom Boss zu entfernen.",

	announce_cmd = "announce",
	announce_name = "Benachrichtigt Spieler",
	announce_desc = "Informiert Spieler, dass Gri\'lek sie verfolgt, sodass sie rechtzeitig weglaufen k\195\182nnen.",

	puticon_cmd = "puticon",
	puticon_name = "Setzt Schlachtzugssymbole",
	puticon_desc = "Setzt ein Schlachtzugssymbol auf den verfolgten Spieler.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-02-08
    cmd = "Grilek",

    avatar_trigger = "Gri\'lek gains Avatar\.",
    preavatar_warn = "即将天神下凡！近战请远离！",
    avatar_bar = "天神下凡",
    avatar_message = "天神下凡了！远离Boss！",
    avatar_end = "Avatar fades from Gri\'lek\.",
    avatar_whisper_you = "格里雷克正在追你！快跑！",
    avatar_whisper = "格里雷克正在追你！快跑！",
    avatar_watch = "格里雷克正在追 %s！",

    avatar_cmd = "avatar",
    avatar_name = "天神下凡警报",
    avatar_desc = "当Boss进入天神下凡（激怒阶段）时通报。",

    melee_cmd = "melee",
    melee_name = "近战警告",
    melee_desc = "在天神下凡施放前警告，这样近战职业可以及时远离Boss。",

    announce_cmd = "announce",
    announce_name = "密语玩家",
    announce_desc = "让被格里雷克选中的玩家知道，这样他们可以及时跑开。",

    puticon_cmd = "puticon",
    puticon_name = "放置标记",
    puticon_desc = "在被标记的玩家身上放置团队图标。\n\n（需要助理或更高权限）",
} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"avatar", "melee", "announce", "puticon", "bosskill"}

-- locals
local timer = {
	melee = 10,
	avatar = 15,
}
local icon = {
	avatar = "Ability_Creature_Cursed_05",
}
local syncName = {
	meleeIni = "GrilekMeleeIni"..module.revision,
	melee = "GrilekMelee"..module.revision,
	avatar = "GrilekAvatar"..module.revision,
	avatarOver = "GrilekAvatarStop"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")

	self:ThrottleSync(8, syncName.meleeIni)
	self:ThrottleSync(8, syncName.melee)
	self:ThrottleSync(10, syncName.avatar)
	self:ThrottleSync(10, syncName.avatarOver)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	firstwarn = 0
	nameoftarget = nil
	lasttarget = "randomshitthatwonthappen"
end

-- called after boss is engaged
function module:OnEngage()
	if firstwarn == 0 then
		self:Sync(syncName.meleeIni)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Events              --
------------------------------

function module:Event(msg)
	if msg == L["avatar_trigger"] then
		self:Sync(syncName.avatar)
	elseif msg == L["avatar_end"] then
		self:Sync(syncName.avatarOver)
		self:Sync(syncName.melee)
	end
end

function module:TargetChangedCheck()
	local num = GetNumRaidMembers()
	for i = 1, num do
		local raidUnit = string.format("raid%starget", i)
		if UnitExists(raidUnit) and UnitName(raidUnit) == "Gri'lek" and UnitExists(raidUnit.."target") then
			nameoftarget = UnitName(raidUnit.."target")
			if not lasttarget then
				lasttarget = nameoftarget
			end
		end
	end
	if nameoftarget ~= lasttarget then
		if self.db.profile.puticon then
			self:Icon(nameoftarget)
		end
		if self.db.profile.announce then
			if nameoftarget == UnitName("player") then
				self:Message(L["avatar_whisper_you"], "Attention", "Alarm")
			else
				self:Message(string.format(L["avatar_watch"], nameoftarget), "Personal")
				self:TriggerEvent("BigWigs_SendTell", nameoftarget, L["avatar_whisper"])
			end
		end
		lasttarget = nameoftarget
	end
end

function module:Avatar()
	self:ScheduleRepeatingEvent("grilektargetchangedcheck", self.TargetChangedCheck, 0.5, self)
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.meleeIni then
		firstwarn = 1
		if self.db.profile.melee then
			self:DelayedMessage(timer.melee, L["preavatar_warn"], "Attention", true, "Alarm")
		end
	elseif sync == syncName.melee then
		if self.db.profile.melee then
			self:DelayedMessage(timer.melee, L["preavatar_warn"], "Attention", true, "Alarm")
		end
	elseif sync == syncName.avatar then
		self:Avatar()
		if self.db.profile.avatar then
			self:Bar(L["avatar_bar"], timer.avatar, icon.avatar, true, "White")
			self:Message(L["avatar_message"], "Urgent")
		end
	elseif sync == syncName.avatarOver then
		self:CancelScheduledEvent("grilektargetchangedcheck")
		nameoftarget = nil
		if self.db.profile.avatar then
			self:RemoveBar(L["avatar_bar"])
		end
		if self.db.profile.puticon then
			self:RemoveIcon(lasttarget)
		end
		lasttarget = "randomshitthatwonthappen"
	end
end
