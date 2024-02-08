
local module, L = BigWigs:ModuleDeclaration("Anubisath Guardian", "Ruins of Ahn'Qiraj")

module.revision = 30039
module.enabletrigger = module.translatedName 
module.toggleoptions = {"reflect", "plagueyou", "plagueother", "icon", "thunderclap", "shadowstorm", "meteor", -1, "explode", "enrage"}
module.trashMod = true

L:RegisterTranslations("enUS", function() return {
	cmd = "Guardian",
	
	reflect_cmd = "reflect",
	reflect_name = "法术反射警报",
	reflect_desc = "显示守护者的反射计时条",
	
	plagueyou_cmd = "plagueyou",
	plagueyou_name = "你中了瘟疫警报",
	plagueyou_desc = "警告你中了瘟疫",
	
	plagueother_cmd = "plagueother",
	plagueother_name = "其他人中了瘟疫警报",
	plagueother_desc = "警告其他人中了瘟疫",
	
	icon_cmd = "icon",
	icon_name = "放置标记",
	icon_desc = "在最后一个中了瘟疫的人身上放置团队标记（需要助理或更高权限）",
	
	thunderclap_cmd = "thunderclap",
	thunderclap_name = "雷霆一击警报",
	thunderclap_desc = "雷霆一击出现时进行警告",
	
	shadowstorm_cmd = "shadowstorm",
	shadowstorm_name = "暗影风暴警报",
	shadowstorm_desc = "暗影风暴出现时进行警告",
	
	meteor_cmd = "meteor",
	meteor_name = "流星警报",
	meteor_desc = "流星出现时进行警告",
	
	explode_cmd = "explode",
	explode_name = "爆炸警报",
	explode_desc = "警告即将到来的爆炸",
	
	enrage_cmd = "enrage",
	enrage_name = "狂怒警报",
	enrage_desc = "狂怒状态出现时进行警告",
	
	
	trigger_arcaneFireReflect1 = "Moonfire is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_arcaneFireReflect2 = "Scorch is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_arcaneFireReflect3 = "Flame Shock is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_arcaneFireReflect4 = "Firebolt is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_arcaneFireReflect5 = "Flame Lash is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_arcaneFireReflect6 = "Detect Magic is reflected",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	arcrefwarn = "火焰和奥术反射",
	
	trigger_shadowFrostReflect1 = "Shadow Word: Pain is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_shadowFrostReflect2 = "Corruption is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_shadowFrostReflect3 = "Frostbolt is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_shadowFrostReflect4 = "Frost Shock is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_shadowFrostReflect5 = "Anubisath Guardian is afflicted by Detect Magic.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE
	sharefwarn = "暗影和冰霜反射",
		
	thunderclaptrigger = "Anubisath Guardian's Thunderclap hits",
	thunderclap_split = "雷霆一击 -- 分成两组！！",
	
	shadowstormtrigger = "Anubisath Guardian's Shadow Storm hits",
	shadowstorm_stay = "！！站在近战范围内！！",

	meteortrigger = "Anubisath Guardian's Meteor",
	meteorbar = "流星冷却",
	meteorwarn = "流星来袭！",
	
	explodetrigger = "Anubisath Guardian gains Explode.",
	explodewarn = "即将爆炸！",
	
	enragetrigger = "Anubisath Guardian gains Enrage.",
	enragewarn = "进入狂怒状态！",
	
	plaguetrigger = "^([^%s]+) ([^%s]+) afflicted by Plague%.$",
	plaguewarn = "感染了瘟疫！快跑出人群！",
	plagueyouwarn = "你感染了瘟疫！快跑出人群！",
	plagueyou = "你",
	plagueare = "是",
	plague_onme = "瘟疫目标为",
	
	trigger_selfReflect = "Your (.*) is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_SELF_DAMAGE
	msg_selfReflect = "别自己打自己！",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-02-08
	cmd = "Guardian",
	
	reflect_cmd = "reflect",
	reflect_name = "法术反射警报",
	reflect_desc = "显示守护者的反射计时条",
	
	plagueyou_cmd = "plagueyou",
	plagueyou_name = "你中了瘟疫警报",
	plagueyou_desc = "警告你中了瘟疫",
	
	plagueother_cmd = "plagueother",
	plagueother_name = "其他人中了瘟疫警报",
	plagueother_desc = "警告其他人中了瘟疫",
	
	icon_cmd = "icon",
	icon_name = "放置标记",
	icon_desc = "在最后一个中了瘟疫的人身上放置团队标记（需要助理或更高权限）",
	
	thunderclap_cmd = "thunderclap",
	thunderclap_name = "雷霆一击警报",
	thunderclap_desc = "雷霆一击出现时进行警告",
	
	shadowstorm_cmd = "shadowstorm",
	shadowstorm_name = "暗影风暴警报",
	shadowstorm_desc = "暗影风暴出现时进行警告",
	
	meteor_cmd = "meteor",
	meteor_name = "流星警报",
	meteor_desc = "流星出现时进行警告",
	
	explode_cmd = "explode",
	explode_name = "爆炸警报",
	explode_desc = "警告即将到来的爆炸",
	
	enrage_cmd = "enrage",
	enrage_name = "狂怒警报",
	enrage_desc = "狂怒状态出现时进行警告",
	
	
	trigger_arcaneFireReflect1 = "Moonfire is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_arcaneFireReflect2 = "Scorch is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_arcaneFireReflect3 = "Flame Shock is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_arcaneFireReflect4 = "Firebolt is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_arcaneFireReflect5 = "Flame Lash is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_arcaneFireReflect6 = "Detect Magic is reflected",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	arcrefwarn = "火焰和奥术反射",
	
	trigger_shadowFrostReflect1 = "Shadow Word: Pain is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_shadowFrostReflect2 = "Corruption is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_shadowFrostReflect3 = "Frostbolt is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_shadowFrostReflect4 = "Frost Shock is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_SELF_DAMAGE
	trigger_shadowFrostReflect5 = "Anubisath Guardian is afflicted by Detect Magic.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE
	sharefwarn = "暗影和冰霜反射",
		
	thunderclaptrigger = "Anubisath Guardian's Thunderclap hits",
	thunderclap_split = "雷霆一击 -- 分成两组！！",
	
	shadowstormtrigger = "Anubisath Guardian's Shadow Storm hits",
	shadowstorm_stay = "！！站在近战范围内！！",

	meteortrigger = "Anubisath Guardian's Meteor",
	meteorbar = "流星冷却",
	meteorwarn = "流星来袭！",
	
	explodetrigger = "Anubisath Guardian gains Explode.",
	explodewarn = "即将爆炸！",
	
	enragetrigger = "Anubisath Guardian gains Enrage.",
	enragewarn = "进入狂怒状态！",
	
	plaguetrigger = "^([^%s]+) ([^%s]+) afflicted by Plague%.$",
	plaguewarn = "感染了瘟疫！快跑出人群！",
	plagueyouwarn = "你感染了瘟疫！快跑出人群！",
	plagueyou = "你",
	plagueare = "是",
	plague_onme = "瘟疫目标为",
	
	trigger_selfReflect = "Your (.*) is reflected back by Anubisath Guardian.",--CHAT_MSG_SPELL_SELF_DAMAGE
	msg_selfReflect = "别自己打自己！",
} end )

module.defaultDB = {
	bosskill = false,
	enrage = false,
}

local timer = {
	meteor = {8,13},
	explode = 6,
	arcref = 600,
	sharef = 600,
}

local icon = {
	plague = "Spell_Shadow_CurseOfTounges",
	meteor = "Spell_Fire_Fireball02",
	explode = "spell_fire_selfdestruct",
	arcref = "spell_arcane_portaldarnassus",
	sharef = "spell_arcane_portalundercity",
}

local syncName = {
	enrage = "GuardianEnrage"..module.revision,
	explode = "GuardianExplode"..module.revision,
	thunderclap = "GuardianThunderclap"..module.revision,
	shadowstorm = "GuardianShadowstorm"..module.revision,
	meteor = "GuardianMeteor"..module.revision,
	arcref = "GuardianArcaneReflect"..module.revision,
	sharef = "GuardianShadowReflect"..module.revision,
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")--Explosion and Enrage
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--Plague
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--Plague
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--Plague
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--Thunderclap and Shadowstorm
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--Thunderclap and Shadowstorm
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--Thunderclap and Shadowstorm
	
	self:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "Event")--arcaneFireReflect, shadowFrostReflect
	self:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE", "Event")--arcaneFireReflect, shadowFrostReflect
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE","Event")--arcaneFireReflect, shadowFrostReflect
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE","Event")--Anubisath Guardian is afflicted by Detect Magic

	self:ThrottleSync(10, syncName.enrage)
	self:ThrottleSync(10, syncName.explode)
	self:ThrottleSync(6, syncName.thunderclap)
	self:ThrottleSync(6, syncName.shadowstorm)
	self:ThrottleSync(10, syncName.sharef)
	self:ThrottleSync(10, syncName.arcref)
end

function module:OnSetup()
end

function module:OnEngage()
	bwGuardiansFirst = true
	bwGuardiansFirstArcRef = true
	bwGuardiansFirstShaRef = true
	self:RemoveBar(L["arcrefwarn"])
	self:RemoveBar(L["sharefwarn"])
end

function module:OnDisengage()
	bwGuardiansFirst = true
	bwGuardiansFirstArcRef = true
	bwGuardiansFirstShaRef = true
end

function module:Event(msg)
	if string.find(msg, L["plaguetrigger"]) then
		local _,_, pplayer, ptype = string.find(msg, L["plaguetrigger"])
		if pplayer then
			if self.db.profile.plagueyou and pplayer == L["plagueyou"] then
				SendChatMessage("Plague on "..UnitName("player").."!","SAY")
				self:Message(L["plagueyouwarn"], "Personal")
				self:Message(UnitName("player") .. L["plaguewarn"])
				self:WarningSign(icon.plague, 5)
				self:Sound("RunAway")
			elseif self.db.profile.plagueother then
				self:Message(pplayer .. L["plaguewarn"], "Attention")
				self:TriggerEvent("BigWigs_SendTell", pplayer, L["plagueyouwarn"])
			end
			if self.db.profile.icon then
				self:TriggerEvent("BigWigs_SetRaidIcon", pplayer)
			end
		end
	end
	
	if string.find(msg, L["meteortrigger"]) then
		self:Sync(syncName.meteor)
	end
	
	if string.find(msg, L["thunderclaptrigger"]) then
		self:Sync(syncName.thunderclap)
	end	
	if string.find(msg, L["shadowstormtrigger"]) then
		self:Sync(syncName.shadowstorm)
	end
	
	if msg == L["explodetrigger"] then
		self:Sync(syncName.explode)
	end
	if msg == L["enragetrigger"] then
		self:Sync(syncName.enrage)
	end
	
	if string.find(msg, L["trigger_arcaneFireReflect1"]) or string.find(msg, L["trigger_arcaneFireReflect2"]) or string.find(msg, L["trigger_arcaneFireReflect3"]) or string.find(msg, L["trigger_arcaneFireReflect4"]) or string.find(msg, L["trigger_arcaneFireReflect5"]) or string.find(msg, L["trigger_arcaneFireReflect6"]) then
		self:Sync(syncName.arcref)
	end
	
	if string.find(msg, L["trigger_shadowFrostReflect1"]) or string.find(msg, L["trigger_shadowFrostReflect2"]) or string.find(msg, L["trigger_shadowFrostReflect3"]) or string.find(msg, L["trigger_shadowFrostReflect4"]) or string.find(msg, L["trigger_shadowFrostReflect5"]) then
		self:Sync(syncName.sharef)		
	end
	
	if string.find(msg, L["trigger_selfReflect"]) then
		self:SelfReflect()
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.explode and self.db.profile.explode then
		self:Explode()
	elseif sync == syncName.enrage and self.db.profile.enrage then
		self:Enrage()
	elseif sync == syncName.meteor and self.db.profile.meteor then
		self:Meteor()
	elseif sync == syncName.thunderclap and self.db.profile.thunderclap then
		self:Thunderclap()
	elseif sync == syncName.shadowstorm and self.db.profile.shadowstorm then
		self:ShadowStorm()
	elseif sync == syncName.arcref and self.db.profile.reflect then
		self:ArcaneReflect()
	elseif sync == syncName.sharef and self.db.profile.reflect then
		self:ShadowReflect()
	end
end

function module:Explode()
	self:Message(L["explodewarn"], "Important")
	self:Bar(L["explodewarn"], timer.explode, icon.explode, true, "Black")
	self:WarningSign(icon.explode, timer.explode)
	self:Sound("RunAway")
end

function module:Enrage()
	self:Message(L["enragewarn"], "Important")
end

function module:Thunderclap()
	if bwGuardiansFirst == true then
		self:Message(L["thunderclap_split"], "Attention")
		bwGuardiansFirst = false
	end
end

function module:ShadowStorm()
	if bwGuardiansFirst == true then
		self:Message(L["shadowstorm_stay"], "Attention")
		bwGuardiansFirst = false
	end
end

function module:ArcaneReflect()
	if bwGuardiansFirstArcRef == true then
		self:Bar(L["arcrefwarn"], timer.arcref, icon.arcref, true, "red")
		bwGuardiansFirstArcRef = false
	end
end

function module:ShadowReflect()
	if bwGuardiansFirstShaRef == true then 
		self:Bar(L["sharefwarn"], timer.sharef, icon.sharef, true, "blue")
		bwGuardiansFirstShaRef = false
	end
end

function module:Meteor()
	self:IntervalBar(L["meteorbar"], timer.meteor[1], timer.meteor[2], icon.meteor, true, "cyan")
	self:Message(L["meteorwarn"], "Important")
end

function module:SelfReflect()
	self:Message(L["msg_selfReflect"], "Personal", false, nil, false)
	self:Sound("Beware")
end
