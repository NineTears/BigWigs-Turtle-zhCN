
local module, L = BigWigs:ModuleDeclaration("C'Thun", "Ahn'Qiraj")

module.revision = 30027
local eyeofcthun = AceLibrary("Babble-Boss-2.2")["Eye of C'Thun"]
local cthun = AceLibrary("Babble-Boss-2.2")["C'Thun"]
module.enabletrigger = {eyeofcthun, cthun}
module.toggleoptions = {"icon", "rape", -1, "tentacle", "glare", "group", -1, "giant", "acid", "weakened", -1, "proximity", "stomach", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Cthun",

	icon_cmd = "icon",
	icon_name = "目标使用眼棱标记",
	icon_desc = "在眼棱目标上放置图标警告",

	proximity_cmd = "proximity",
	proximity_name = "近距离警告",
	proximity_desc = "显示近距离警告框",

	stomach_cmd = "stomach",
	stomach_name = "胃里的玩家",
	stomach_desc = "显示胃里的玩家而不是过于靠近的玩家",

	tentacle_cmd = "tentacle",
	tentacle_name = "触手警报",
	tentacle_desc = "警告触手来袭",

	rape_cmd = "rape",
	rape_name = "强奸笑话很有趣",
	rape_desc = "有些人喜欢色情笑话。",

	glare_cmd = "glare",
	glare_name = "黑暗闪耀警报",
	glare_desc = "警告黑暗闪耀",

	group_cmd = "group",
	group_name = "黑暗闪耀团队警告",
	group_desc = "警告团队受到黑暗闪耀",

	giant_cmd = "giant",
	giant_name = "巨眼警报",
	giant_desc = "警告巨眼来袭",

	weakened_cmd = "weakened",
	weakened_name = "虚弱状态警报",
	weakened_desc = "警告虚弱状态",
	
	acid_cmd = "acid",
	acid_name = "消化酸液警报",
	acid_desc = "当你受到5层消化酸液效果时显示警报",

	startwarn = "克苏恩已激活！ - 45秒后施放黑暗闪耀和眼棱",
	barStartRandomBeams = "随机眼棱开始！",

	eye_beam_trigger = "Giant Eye Tentacle begins to cast Eye Beam.",
	eye_beam_trigger_cthun = "Eye of C'Thun begins to cast Eye Beam.",
	eyebeam = "%s遭到眼棱攻击",
	Unknown = "未知", -- 眼棱攻击未知目标

	tentacle = "触手派对 - 5秒",
	norape = "5秒后触手到来！",
	barTentacle = "触手派对！",
	barNoRape = "触手派对！",

	glare = "黑暗闪耀！",
	msgGlareEnds = "黑暗闪耀将在5秒后结束",
	barGlare = "下一次黑暗闪耀！",
	barGlareEnds = "黑暗闪耀结束",
	barGlareCasting = "正在施放黑暗闪耀",

	phase2starting = "巨眼已击败！即将进入本体阶段！",

	playersInStomach = "胃内玩家",

	barGiant = "巨眼触手！",
	barGiantC = "巨爪触手！",
	GiantEye = "5秒后巨眼触手到来！",
	gedownwarn = "巨眼触手已击败！",

	weakenedtrigger = "is weakened!",
	weakened = "克苏恩虚弱，持续45秒",
	invulnerable2 = "5秒后克苏恩将再次无敌",
	invulnerable1 = "派对结束 - 克苏恩无敌",
	barWeakened = "克苏恩虚弱！",

	digestiveAcidTrigger = "You are afflicted by Digestive Acid [%s%(]*([%d]*).",
	msgDigestiveAcid = "5层消化酸液",

	["Second TentacleHP"] = "第二触手血量%d%%",
	["First Tentacle dead"] = "第一触手已击败",
	["First Tentacle"] = "第一触手",
	["Second Tentacle"] = "第二触手",

	window_bar = "机会之窗",
	trigger_bigClawDies = "Giant Claw Tentacle dies.",
	trigger_bigEyeDies = "Giant Eye Tentacle dies.",
} end )

L:RegisterTranslations("zhCN", function() return {
	cmd = "Cthun",

	icon_cmd = "icon",
	icon_name = "目标使用眼棱标记",
	icon_desc = "在眼棱目标上放置图标警告",

	proximity_cmd = "proximity",
	proximity_name = "近距离警告",
	proximity_desc = "显示近距离警告框",

	stomach_cmd = "stomach",
	stomach_name = "胃里的玩家",
	stomach_desc = "显示胃里的玩家而不是过于靠近的玩家",

	tentacle_cmd = "tentacle",
	tentacle_name = "触手警报",
	tentacle_desc = "警告触手来袭",

	rape_cmd = "rape",
	rape_name = "强奸笑话很有趣",
	rape_desc = "有些人喜欢色情笑话。",

	glare_cmd = "glare",
	glare_name = "黑暗闪耀警报",
	glare_desc = "警告黑暗闪耀",

	group_cmd = "group",
	group_name = "黑暗闪耀团队警告",
	group_desc = "警告团队受到黑暗闪耀",

	giant_cmd = "giant",
	giant_name = "巨眼警报",
	giant_desc = "警告巨眼来袭",

	weakened_cmd = "weakened",
	weakened_name = "虚弱状态警报",
	weakened_desc = "警告虚弱状态",
	
	acid_cmd = "acid",
	acid_name = "消化酸液警报",
	acid_desc = "当你受到5层消化酸液效果时显示警报",

	startwarn = "克苏恩已激活！ - 45秒后施放黑暗闪耀和眼棱",
	barStartRandomBeams = "随机眼棱开始！",

	eye_beam_trigger = "Giant Eye Tentacle begins to cast Eye Beam.",
	eye_beam_trigger_cthun = "Eye of C'Thun begins to cast Eye Beam.",
	eyebeam = "%s遭到眼棱攻击",
	Unknown = "未知", -- 眼棱攻击未知目标

	tentacle = "触手派对 - 5秒",
	norape = "5秒后触手到来！",
	barTentacle = "触手派对！",
	barNoRape = "触手派对！",

	glare = "黑暗闪耀！",
	msgGlareEnds = "黑暗闪耀将在5秒后结束",
	barGlare = "下一次黑暗闪耀！",
	barGlareEnds = "黑暗闪耀结束",
	barGlareCasting = "正在施放黑暗闪耀",

	phase2starting = "巨眼已击败！即将进入本体阶段！",

	playersInStomach = "胃内玩家",

	barGiant = "巨眼触手！",
	barGiantC = "巨爪触手！",
	GiantEye = "5秒后巨眼触手到来！",
	gedownwarn = "巨眼触手已击败！",

	weakenedtrigger = "is weakened!",
	weakened = "克苏恩虚弱，持续45秒",
	invulnerable2 = "5秒后克苏恩将再次无敌",
	invulnerable1 = "派对结束 - 克苏恩无敌",
	barWeakened = "克苏恩虚弱！",

	digestiveAcidTrigger = "You are afflicted by Digestive Acid [%s%(]*([%d]*).",
	msgDigestiveAcid = "5层消化酸液",

	["Second TentacleHP"] = "第二触手血量%d%%",
	["First Tentacle dead"] = "第一触手已击败",
	["First Tentacle"] = "第一触手",
	["Second Tentacle"] = "第二触手",

	window_bar = "机会之窗",
	trigger_bigClawDies = "Giant Claw Tentacle dies.",
	trigger_bigEyeDies = "Giant Eye Tentacle dies.",
} end )

module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
module.proximitySilent = false

local timer = {
	nextspawn = 28,
	p1RandomEyeBeams = 6, -- how long does eye of c'thun target the same player at the beginning
	p1Tentacle = 45,      -- tentacle timers for phase 1
	p1TentacleStart = 45, -- delay for first tentacles from engage onwards
	p1GlareStart = 45,    -- delay for first dark glare from engage onwards
	p1Glare = 87,         -- interval for dark glare
	p1GlareCasting = 3,   -- time it takes from casting dark glare until the spell starts
	p1GlareDuration = 39, -- duration of dark glare

	p2Tentacle = 30,      -- tentacle timers for phase 2
	p2ETentacle = 60,     -- Eye tentacle timers for phase 2
	p2GiantClaw = 60,     -- Giant Claw timer for phase 2
	p2FirstGiantClaw = 12, -- first giant claw after eye of c'thun dies
	p2FirstGiantEye = 42, -- first giant eye after eye of c'thun dies
	p2FirstEyeTentacles = 42, -- first eye tentacles after eye of c'thun dies
	p2FirstGiantClawAfterWeaken = 8,
	p2FirstGiantEyeAfterWeaken = 38,
	p2FirstEyeAfterWeaken = 38,


	reschedule = 50,      -- delay from the moment of weakening for timers to restart
	target = 1,           -- delay for target change checking on Eye of C'Thun and Giant Eye Tentacle
	CheckTentacleHP = 0.5, -- delay for updating flesh tentacle hp
	weakened = 45,        -- duration of a weaken

	eyeBeam = 2,         -- Eye Beam Cast time
}
local icon = {
	window = "inv_misc_pocketwatch_01",
	giantEye = "inv_misc_eye_01", --"Interface\\Icons\\Ability_EyeOfTheOwl"
	giantClaw = "Spell_Nature_Earthquake",
	eyeTentacles = "spell_shadow_siphonmana", --"Interface\\Icons\\Spell_Nature_CallStorm"
	darkGlare = "Inv_misc_ahnqirajtrinket_04",
	weaken = "INV_ValentinesCandy",
	eyeBeamSelf = "Ability_creature_poison_05",
	digestiveAcid = "ability_creature_disease_02",
}
local syncName = {
	p2Start = "CThunP2Start"..module.revision,
	weaken = "CThunWeakened"..module.revision,
	weakenOver = "CThunWeakenedOver"..module.revision,
	tentacleSpawn = "TentacleSpawn"..module.revision,
	giantEyeDown = "CThunGEdown"..module.revision,
	giantClawSpawn = "GiantClawSpawn"..module.revision,
	giantEyeSpawn = "GiantEyeSpawn"..module.revision,
	eyeBeam = "CThunEyeBeam"..module.revision,
	fleshtentacledead2 = "CThunFleshTentacleDead2"..module.revision,
	window = "CThunWindow"..module.revision,
}

local gianteye = "Giant Eye Tentacle"
local fleshtentacle = "Flesh Tentacle"

local cthunstarted = nil
local phase2started = nil
local fleshtentacledead = nil
local secondTentacleLowWarn = nil
local firstGlare = nil
local firstWarning = nil
--local target = nil
local tentacletime = timer.p1Tentacle
local isWeakened = nil

local doCheckForWipe = false

local eyeTarget = nil

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY")--Debug
	
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Emote")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "Emote")

	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "CheckEyeBeam")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckDigestiveAcid")

	self:ThrottleSync(20, syncName.p2Start)
	self:ThrottleSync(50, syncName.weaken)
	self:ThrottleSync(3, syncName.giantEyeDown)
	self:ThrottleSync(600, syncName.weakenOver)
	self:ThrottleSync(2, syncName.fleshtentacledead2)
	self:ThrottleSync(25, syncName.giantClawSpawn)
	self:ThrottleSync(25, syncName.giantEyeSpawn)
	self:ThrottleSync(25, syncName.tentacleSpawn)
	self:ThrottleSync(5, syncName.window)
end

--[[
function module:CHAT_MSG_SAY(msg)
	if msg == "forceEngage" then
		self:SendEngageSync()
	elseif msg == "p2Start" then
		self:Sync(syncName.p2Start)
	elseif string.find(msg,"tentHp") then
		local hp = strsub(msg,8,strlen(msg))
		DEFAULT_CHAT_FRAME:AddMessage("HP: "..hp)
		DEFAULT_CHAT_FRAME:AddMessage("Length: "..strlen(hp))
		self:testTentacleHp(hp)
	elseif msg == "tentDies" then
		self:Sync(syncName.fleshtentacledead2)
	elseif msg == "weaken" then
		self:Sync(syncName.weaken)
	elseif msg == "weakenOver" then
		self:Sync(syncName.weakenOver)
	end
end

function module:testTentacleHp(hp)
	local health = tonumber(hp)
	
	if not fleshtentacledead then
		if health and health < self.firstTentacleHP then
			self.firstTentacleHP = health
			self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.firstTentacleHP)
			self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.secondTentacleHP)
		elseif health and health > self.firstTentacleHP and health < self.secondTentacleHP then
			self.secondTentacleHP = health
			self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.firstTentacleHP)
			self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.secondTentacleHP)
		end
	elseif fleshtentacledead then
		self.firstTentacleHP = 1
		if health and health < self.secondTentacleHP then
			self.secondTentacleHP = health
			self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.firstTentacleHP)
			self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.secondTentacleHP)
		end
		if self.secondTentacleHP < 20 and not secondTentacleLowWarn then
			self:Message("Second Tentacle at "..self.secondTentacleHP.."% HP")
			secondTentacleLowWarn = true
		end
	end
end
]]--

function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	self.started = nil
	self.firstTentacleHP = 100
	self.secondTentacleHP = 100
	self.warning = 100
	fleshtentacledead = nil
	secondTentacleLowWarn = nil
	eyeTarget = nil
	cthunstarted = nil
	firstGlare = nil
	firstWarning = nil
	phase2started = nil
	doCheckForWipe = false

	tentacletime = timer.p1Tentacle

	self:RemoveProximity()
	self:TriggerEvent("BigWigs_StopDebuffTrack")
end

function module:OnEngage()
	self:CThunStart()
end

function module:OnDisengage()
	self:RemoveProximity()
	self:TriggerEvent("BigWigs_StopDebuffTrack")
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if (msg == string.format(UNITDIESOTHER, eyeofcthun)) then
		self:Sync(syncName.p2Start)
	elseif (msg == string.format(UNITDIESOTHER, gianteye)) then
		self:Sync(syncName.giantEyeDown)
	elseif (msg == string.format(UNITDIESOTHER, fleshtentacle)) and not fleshtentacledead then
		self:Sync(syncName.fleshtentacledead2)
	end
	
	if msg == L["trigger_bigClawDies"] or msg == L["trigger_bigEyeDies"] then
		self:Sync(syncName.window)
	end
end

function module:CheckForWipe(event)
	if doCheckForWipe then
		BigWigs:DebugMessage("doCheckForWipe")
		BigWigs:CheckForWipe(self)
	end
end

function module:Emote(msg)
	if string.find(msg, L["weakenedtrigger"]) then
		self:Sync(syncName.weaken)
	end
end

function module:CheckEyeBeam(msg)
	if string.find(msg, L["eye_beam_trigger"]) then
		self:DebugMessage("Eye Beam trigger")
		self:Sync(syncName.eyeBeam)
	elseif string.find(msg, L["eye_beam_trigger_cthun"]) then
		self:DebugMessage("C'Thun Eye Beam trigger")
		self:Sync(syncName.eyeBeam)
		if not cthunstarted then
			self:SendEngageSync()
		end
	end
end

function module:CheckDigestiveAcid(msg)
	local _, _, stacks = string.find(msg, L["digestiveAcidTrigger"])

	if stacks then
		self:DebugMessage("Digestive Acid Stacks: " .. stacks)
		if tonumber(stacks) == 5 then
			self:DigestiveAcid()
		end
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.p2Start then
		self:CThunP2Start()
	elseif sync == syncName.weaken then
		self:CThunWeakened()
	elseif sync == syncName.weakenOver then
		self:CThunWeakenedOver()
	elseif sync == syncName.giantEyeDown then
		self:Message(L["gedownwarn"], "Positive")
	elseif sync == syncName.eyeBeam then
		self:EyeBeam()
	elseif sync == syncName.giantClawSpawn then
		lastspawn = GetTime()
		self:GCTentacleRape()
	elseif sync == syncName.giantEyeSpawn then
		lastspawn = GetTime()
		self:GTentacleRape()
	elseif sync == syncName.tentacleSpawn then
		self:TentacleRape()
	elseif sync == syncName.fleshtentacledead2 then
		self:FleshTentacle()
	elseif sync == syncName.window then
		self:Window()
	end
end


function module:FleshTentacle()
	
	if not fleshtentacledead then
		fleshtentacledead = true
		secondTentacleLowWarn = nil
		self.firstTentacleHP = 1
		self.secondTentacleHP = 100
		self:Message(L["First Tentacle dead"], "Important" )
		self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.firstTentacleHP)
		self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.secondTentacleHP)
	end
end

function module:Window()
	local window = (lastspawn + timer.nextspawn) - GetTime()
	if window > 0 then
		self:Bar(L["window_bar"], window, icon.window, true, "white")
	end
end

function module:CThunStart()
	self:DebugMessage("CThunStart: ")
	if not cthunstarted then
		cthunstarted = true
		doCheckForWipe = true
		fleshtentacledead = nil
		secondTentacleLowWarn = nil
		
		self:Message(L["startwarn"], "Attention", false, false)
		--self:Sound("Shakira")
		self:Bar(L["barStartRandomBeams"], timer.p1RandomEyeBeams, icon.giantEye, true, "Green")
		--self:Bar("Claw Tentacle", 8, icon.giantClaw)


		self:P1ClawTentacle()


		if self.db.profile.tentacle then
			self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timer.p1TentacleStart, icon.eyeTentacles, true, "Blue")
			self:DelayedMessage(timer.p1TentacleStart - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, "Alert")
		end

		firstGlare = true
		self:DarkGlare()

		firstWarning = true

		self:DelayedSync(timer.p1TentacleStart, syncName.tentacleSpawn)
		self:ScheduleRepeatingEvent("bwcthuntarget", self.CheckTarget, timer.target, self)

		self:Proximity()
	end
end

function module:CThunP2Start()
	if not phase2started then
		fleshtentacledead = nil
		secondTentacleLowWarn = nil
		phase2started = true
		doCheckForWipe = false -- disable wipe check since we get out of combat, enable it later again
		tentacletime = timer.p2Tentacle

		self:TriggerEvent("BigWigs_StartHPBar", self, L["First Tentacle"], 100)
		self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 0)
		self:TriggerEvent("BigWigs_StartHPBar", self, L["Second Tentacle"], 100)
		self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 0)
		self:ScheduleRepeatingEvent("bwcthunCheckTentacleHP", self.CheckTentacleHP, timer.CheckTentacleHP, self )

		self:Message(L["phase2starting"], "Bosskill")

		-- cancel dark glare
		self:RemoveBar(L["barGlare"] )
		self:RemoveBar(L["barGlareCasting"] )
		self:RemoveBar(L["barGlareEnds"] )
		self:CancelScheduledEvent("bwcthundarkglare") -- ok
		self:CancelDelayedBar(L["barGlareEnds"])
		self:CancelDelayedBar(L["barGlare"])
		self:RemoveWarningSign(icon.darkGlare)

		-- cancel eye tentacles

		self:RemoveBar(L["barTentacle"] )
		self:RemoveBar(L["barNoRape"] )
		self:CancelDelayedMessage(self.db.profile.rape and L["tentacle"] or L["norape"])
		self:CancelDelayedSync(syncName.tentacleSpawn)

		-- cancel p1 claw tentacle
		self:RemoveBar("Claw Tentacle")

		-- cancel dark glare group warning
		self:CancelScheduledEvent("bwcthuntarget") -- ok

		self:RemoveBar(L["barStartRandomBeams"] )

		-- start P2 events
		if self.db.profile.tentacle then
			-- first eye tentacles
			self:DelayedMessage(timer.p2FirstEyeTentacles - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, nil, true)
			self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timer.p2FirstEyeTentacles, icon.eyeTentacles, true, "Blue")
		end

		if self.db.profile.giant then
			self:Bar(L["barGiant"], timer.p2FirstGiantEye, icon.giantEye, true, "Green")
			self:DelayedMessage(timer.p2FirstGiantEye - 5, L["GiantEye"], "Urgent", false, nil, true)

			self:Bar(L["barGiantC"], timer.p2FirstGiantClaw, icon.giantClaw, true, "Black")
		end

		self:DelayedSync(timer.p2FirstEyeTentacles, syncName.tentacleSpawn)
		self:DelayedSync(timer.p2FirstGiantEye, syncName.giantEyeSpawn)
		self:DelayedSync(timer.p2FirstGiantClaw, syncName.giantClawSpawn)
		self:ScheduleRepeatingEvent("bwcthuntargetp2", self.CheckTarget, timer.target, self )

	end
	if self.db.profile.stomach then
		self:TriggerEvent("BigWigs_StartDebuffTrack", self:ToString(), "Interface\\Icons\\Ability_Creature_Disease_02", L["playersInStomach"])
	end
end

function module:CThunWeakened()
	isWeakened = true
	fleshtentacledead = nil
	secondTentacleLowWarn = nil
	self.firstTentacleHP = 100
	self.secondTentacleHP = 100
	self.warning = 100
	self:TriggerEvent("BigWigs_StopHPBar", self, L["First Tentacle"])
	self:TriggerEvent("BigWigs_StopHPBar", self, L["Second Tentacle"])
	self:ThrottleSync(0.1, syncName.weakenOver)

	if self.db.profile.weakened then
		self:Message(L["weakened"], "Positive" )
		self:Sound("Murloc")
		self:Bar(L["barWeakened"], timer.weakened, icon.weaken, true, "White")
		self:DelayedMessage(timer.weakened - 5, L["invulnerable2"], "Urgent")
	end

	-- cancel tentacle timers
	self:CancelDelayedMessage(self.db.profile.rape and L["tentacle"] or L["norape"])
	self:CancelDelayedMessage(L["GiantEye"])
	self:CancelDelayedSync(syncName.giantEyeSpawn)
	self:CancelDelayedSync(syncName.giantClawSpawn)
	self:CancelDelayedSync(syncName.tentacleSpawn)


	self:RemoveBar(L["barTentacle"])
	self:RemoveBar(L["barNoRape"])
	self:RemoveBar(L["barGiant"])
	self:RemoveBar(L["barGiantC"])

	self:DelayedSync(timer.weakened, syncName.weakenOver)
end

function module:CThunWeakenedOver()
	isWeakened = nil
	self:ThrottleSync(600, syncName.weakenOver)
	self.firstTentacleHP = 100
	self.secondTentacleHP = 100
	self:TriggerEvent("BigWigs_StartHPBar", self, L["First Tentacle"], 100)
	self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 0)
	self:TriggerEvent("BigWigs_StartHPBar", self, L["Second Tentacle"], 100)
	self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 0)
		
	self:CancelDelayedSync(syncName.weakenOver) -- ok

	if self.db.profile.weakened then
		self:RemoveBar(L["barWeakened"])
		self:CancelDelayedMessage(L["invulnerable2"])

		self:Message(L["invulnerable1"], "Important")
	end

	-- next giant claw 10s after weaken
	self:Bar(L["barGiantC"], timer.p2FirstGiantClawAfterWeaken, icon.giantClaw, true, "Black")
	self:DelayedSync(timer.p2FirstGiantClawAfterWeaken, syncName.giantClawSpawn)

	-- next giant eye 40s after weaken
	self:Bar(L["barGiant"], timer.p2FirstGiantEyeAfterWeaken, icon.giantEye, true, "Green")
	self:DelayedSync(timer.p2FirstGiantEyeAfterWeaken, syncName.giantEyeSpawn)
	self:DelayedMessage(timer.p2FirstGiantEyeAfterWeaken - 5, L["GiantEye"], "Urgent", false, nil, true)

	--next rape party
	self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], timer.p2FirstEyeAfterWeaken, icon.eyeTentacles, true, "Blue")
	self:DelayedSync(timer.p2FirstEyeAfterWeaken, syncName.tentacleSpawn)
	self:DelayedMessage(timer.p2FirstEyeAfterWeaken - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, nil, true)
end

function module:DelayedEyeBeamCheck()
	local name = L["Unknown"]
	self:CheckTarget()
	if eyeTarget then
		name = eyeTarget
			
		if self.db.profile.icon then
			for i=1,GetNumRaidMembers() do
				if UnitName("raid"..i) == name then
					SetRaidTarget("raid"..i, 8)
				end
			end
		end
		
		if name == UnitName("player") then
			self:WarningSign(icon.eyeBeamSelf, 2 - 0.1)
			SendChatMessage("Eye Beam On Me !", "SAY")
		else
			for i = 1, GetNumRaidMembers(), 1 do
				if name == UnitName('Raid' .. i) and CheckInteractDistance("Raid" .. i, 3) then
					self:Message("Eye Beam on " .. name .. " ! Move away !", "Important" )
				end
			end
		end
	end
	self:Bar(string.format(L["eyebeam"], name), timer.eyeBeam - 0.1, icon.giantEye, true, "green")
end

function module:EyeBeam()
	self:ScheduleEvent("CThunDelayedEyeBeamCheck", self.DelayedEyeBeamCheck, 0.1, self) -- has to be done delayed since the target change is delayed
end

function module:DigestiveAcid()
	if self.db.profile.acid then
		self:Message(L["msgDigestiveAcid"], "Red", true, "RunAway")
		self:WarningSign(icon.digestiveAcid, 5) --ability_creature_disease_02
	end
end

-----------------------
-- Utility Functions --
-----------------------
function module:CheckTentacleHP()
	local health
	if UnitName("target") == fleshtentacle then
		health = math.floor(UnitHealth("target")/UnitHealthMax("target")*100)
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == fleshtentacle then
				health = math.floor(UnitHealth("Raid"..i.."target")/UnitHealthMax("Raid"..i.."target")*100)
				break;
			end
		end
	end
	
	if not fleshtentacledead then
		if health and health < self.firstTentacleHP then
			self.firstTentacleHP = health
			self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.firstTentacleHP)
			self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.secondTentacleHP)
		elseif health and health > self.firstTentacleHP and health < self.secondTentacleHP then
			self.secondTentacleHP = health
			self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.firstTentacleHP)
			self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.secondTentacleHP)
		end
	elseif fleshtentacledead then
		self.firstTentacleHP = 1
		if health and health < self.secondTentacleHP then
			self.secondTentacleHP = health
			self:TriggerEvent("BigWigs_SetHPBar", self, L["First Tentacle"], 100-self.firstTentacleHP)
			self:TriggerEvent("BigWigs_SetHPBar", self, L["Second Tentacle"], 100-self.secondTentacleHP)
		end
		if self.secondTentacleHP < 20 and not secondTentacleLowWarn then
			self:Message("Second Tentacle at "..self.secondTentacleHP.."% HP")
			secondTentacleLowWarn = true
		end
	end
end

function module:CheckTarget()
	local i
	local newtarget = nil
	local enemy = eyeofcthun

	if phase2started then
		enemy = gianteye
	end
	if UnitName("target") == enemy then
		newtarget = UnitName("targettarget")
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == enemy then
				newtarget = UnitName("Raid"..i.."targettarget")
				break
			end
		end
	end
	if newtarget then
		eyeTarget = newtarget
	end
end

-- P1
function module:P1ClawTentacle()

	if phase2started then
		self:CancelScheduledEvent("bwcthunp1claw")
	else
		self:ScheduleEvent("bwcthunp1claw", self.P1ClawTentacle, 8, self )
		self:Bar("Claw Tentacle", 8, icon.giantClaw, true, "Black")
	end
end

function module:DarkGlare()
	if self.db.profile.glare then
		if firstGlare then
			self:ScheduleEvent("bwcthundarkglare", self.DarkGlare, timer.p1GlareStart, self )

			self:Bar(L["barGlare"], timer.p1GlareStart, icon.darkGlare, true, "Red")
			firstGlare = nil
		else
			self:ScheduleEvent("bwcthundarkglare", self.DarkGlare, timer.p1Glare, self )

			self:WarningSign(icon.darkGlare, timer.p1GlareCasting)
			self:Message(L["glare"], "Urgent", true, false)
			self:Bar(L["barGlareCasting"], timer.p1GlareCasting, icon.darkGlare, true, "Red")

			self:DelayedBar(timer.p1GlareCasting, L["barGlareEnds"], timer.p1GlareDuration, icon.darkGlare, true, "Red")
			self:DelayedMessage(timer.p1GlareCasting + timer.p1GlareDuration - 5, L["msgGlareEnds"], "Urgent", false, nil, true)
			self:DelayedBar(timer.p1GlareCasting + timer.p1GlareDuration, L["barGlare"], timer.p1Glare - timer.p1GlareCasting - timer.p1GlareDuration, icon.darkGlare, true, "Red")
		end
	end
end

-- P2
function module:GTentacleRape()
	self:DelayedSync(timer.p2ETentacle, syncName.giantEyeSpawn)
	if self.db.profile.giant then
		self:Bar(L["barGiant"], timer.p2ETentacle, icon.giantEye, true, "Green")
		self:DelayedMessage(timer.p2ETentacle - 5, L["GiantEye"], "Urgent", false, nil, true)
	end
end

function module:GCTentacleRape()
	doCheckForWipe = true
	self:DelayedSync(timer.p2GiantClaw, syncName.giantClawSpawn)
	if self.db.profile.giant then
		self:Bar(L["barGiantC"], timer.p2GiantClaw, icon.giantClaw, true, "Black")
	end
end

function module:TentacleRape()
	self:DelayedSync(tentacletime, syncName.tentacleSpawn)
	if self.db.profile.tentacle then
		self:Bar(self.db.profile.rape and L["barTentacle"] or L["barNoRape"], tentacletime, icon.eyeTentacles, true, "Blue")
		self:DelayedMessage(tentacletime - 5, self.db.profile.rape and L["tentacle"] or L["norape"], "Urgent", false, nil, true)
	end
end
