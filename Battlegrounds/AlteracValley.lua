
local module, L = BigWigs:ModuleDeclaration("Alterac Valley", "Alterac Valley")
local bbkorrakthebloodrager = AceLibrary("Babble-Boss-2.2")["Korrak the Bloodrager"]
local bbdrekthar = AceLibrary("Babble-Boss-2.2")["Drek'Thar"]
local bbvanndarstormpike = AceLibrary("Babble-Boss-2.2")["Vanndar Stormpike"]
local bbcaptaingalvangar = AceLibrary("Babble-Boss-2.2")["Captain Galvangar"]
local bbcaptainbalindastonehearth = AceLibrary("Babble-Boss-2.2")["Captain Balinda Stonehearth"]

module.revision = 30062
module.enabletrigger = {}
module.toggleoptions = {"towers", "gy", "mine", "rez", "start", "captain", "korrak", "gameend", "lord", "boss"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Alterac",
    
    towers_cmd = "towers",
    towers_name = "塔楼警报",
    towers_desc = "对塔楼情况进行警告",

    gy_cmd = "gy",
    gy_name = "墓地警报",
    gy_desc = "对墓地情况进行警告",
    
    mine_cmd = "mine",
    mine_name = "矿洞警报",
    mine_desc = "对矿洞情况进行警告",
    
    rez_cmd = "rez",
    rez_name = "复活计时器",
    rez_desc = "显示灵魂复活的计时器。",
    
    start_cmd = "start",
    start_name = "游戏开始计时器",
    start_desc = "游戏开始前的倒计时。",
    
    captain_cmd = "captain",
    captain_name = "队长死亡警报",
    captain_desc = "对队长的死亡进行警告",
    
    korrak_cmd = "korrak",
    korrak_name = "科拉克死亡警报",
    korrak_desc = "对科拉克死亡情况进行警告",
    
    gameend_cmd = "gameend",
    gameend_name = "比赛结束（人数不足）警报",
    gameend_desc = "因人数不足导致比赛结束的计时器。",
    
    lord_cmd = "lord",
    lord_name = "领主（伊弗斯和洛克霍拉）警报",
    lord_desc = "对伊弗斯森林之王和洛克霍拉冰封之王召唤情况进行警告",
    
    boss_cmd = "boss",
    boss_name = "首领血量警报",
    boss_desc = "对首领血量状态进行警告",
	
	
	--lord trigger
	
	--rez trigger
		--activate check on death -> scan for not dead, when not dead -> expect this to be the timer
		--getting rez'd / corpse rez / canceling spirit rez / ankh etc
	
	trigger_gyUnderAttack = "(.+) is under attack! If left unchecked, the (.+) will capture it!", --CHAT_MSG_MONSTER_YELL
	trigger_towerUnderAttack = "(.+) is under attack! If left unchecked, the (.+) will destroy it!", --CHAT_MSG_MONSTER_YELL
	trigger_defend = "(.+) was taken by the (.+)!", --CHAT_MSG_MONSTER_YELL
	
	trigger_mine = "The (.+) has taken the (.+)! Its supplies will now be used for reinforcements!", --CHAT_MSG_MONSTER_YELL
	
	msg_DrekHp = "德雷克塔尔血量：",
	msg_VannHp = "范达尔血量：",
    
	msg_galvDead = "加尔范上尉阵亡",
	msg_balindaDead = "巴琳达·斯通赫尔斯上尉阵亡",
	msg_korrakDead = "科拉克·血怒者阵亡",
    
	trigger_gameStart = "(.+) (.+) until the battle for Alterac Valley begins.",
	trigger_gameHasStarted = "The battle for Alterac Valley has begun!",
	bar_gameStart = "比赛开始",
    
	--msg to be confirmed once it gets below 2 minutes
	trigger_gameEnd = "Not enough players. This game will close in (.+) (.+).",
	bar_gameEnd = "比赛结束",
	Alliance = "Alliance",
	Horde = "Horde",
    }
end)

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-11
    cmd = "Alterac",
    
    towers_cmd = "towers",
    towers_name = "塔楼警报",
    towers_desc = "对塔楼情况进行警告",

    gy_cmd = "gy",
    gy_name = "墓地警报",
    gy_desc = "对墓地情况进行警告",
    
    mine_cmd = "mine",
    mine_name = "矿洞警报",
    mine_desc = "对矿洞情况进行警告",
    
    rez_cmd = "rez",
    rez_name = "复活计时器",
    rez_desc = "显示灵魂复活的计时器。",
    
    start_cmd = "start",
    start_name = "游戏开始计时器",
    start_desc = "游戏开始前的倒计时。",
    
    captain_cmd = "captain",
    captain_name = "队长死亡警报",
    captain_desc = "对队长的死亡进行警告",
    
    korrak_cmd = "korrak",
    korrak_name = "科拉克死亡警报",
    korrak_desc = "对科拉克死亡情况进行警告",
    
    gameend_cmd = "gameend",
    gameend_name = "比赛结束（人数不足）警报",
    gameend_desc = "因人数不足导致比赛结束的计时器。",
    
    lord_cmd = "lord",
    lord_name = "领主（伊弗斯和洛克霍拉）警报",
    lord_desc = "对伊弗斯森林之王和洛克霍拉冰封之王召唤情况进行警告",
    
    boss_cmd = "boss",
    boss_name = "首领血量警报",
    boss_desc = "对首领血量状态进行警告",
	
	
	--lord trigger
	
	--rez trigger
		--activate check on death -> scan for not dead, when not dead -> expect this to be the timer
		--getting rez'd / corpse rez / canceling spirit rez / ankh etc
	
	trigger_gyUnderAttack = "(.+) is under attack! If left unchecked, the (.+) will capture it!", --CHAT_MSG_MONSTER_YELL
	trigger_towerUnderAttack = "(.+) is under attack! If left unchecked, the (.+) will destroy it!", --CHAT_MSG_MONSTER_YELL
	trigger_defend = "(.+) was taken by the (.+)!", --CHAT_MSG_MONSTER_YELL
	
	trigger_mine = "The (.+) has taken the (.+)! Its supplies will now be used for reinforcements!", --CHAT_MSG_MONSTER_YELL
	
	msg_DrekHp = "德雷克塔尔血量：",
	msg_VannHp = "范达尔血量：",
    
	msg_galvDead = "加尔范上尉阵亡",
	msg_balindaDead = "巴琳达·斯通赫尔斯上尉阵亡",
	msg_korrakDead = "科拉克·血怒者阵亡",
    
	trigger_gameStart = "(.+) (.+) until the battle for Alterac Valley begins.",
	trigger_gameHasStarted = "The battle for Alterac Valley has begun!",
	bar_gameStart = "比赛开始",
    
	--msg to be confirmed once it gets below 2 minutes
	trigger_gameEnd = "Not enough players. This game will close in (.+) (.+).",
	bar_gameEnd = "比赛结束",
	Alliance = "联盟",
	Horde = "部落",
    }
end)

local timer = {
    towers = 60*5,
    graveyards = 60*5,
	mines = 60*5, -- to be confirmed
}
local icon = {
    alliance = "inv_bannerpvp_02",
    horde = "inv_bannerpvp_01",
	
	gameStart = "inv_misc_pocketwatch_01",
	gameEnd = "inv_misc_pocketwatch_01",
}
local color = {
	alliance = "Blue",
	horde = "Red",
	
	gameStart = "White",
	gameEnd = "White",
}
local syncName = {
    gy = "AV_GraveYards"..module.revision,
    tower = "AV_Towers"..module.revision,
	
	drek50 = "AV_Drek50"..module.revision,
	drek40 = "AV_Drek40"..module.revision,
	drek30 = "AV_Drek30"..module.revision,
	drek20 = "AV_Drek20"..module.revision,
	drek10 = "AV_Drek10"..module.revision,
	
	vann50 = "AV_Vann50"..module.revision,
	vann40 = "AV_Vann40"..module.revision,
	vann30 = "AV_Vann30"..module.revision,
	vann20 = "AV_Vann20"..module.revision,
	vann10 = "AV_Vann10"..module.revision,
	
	galvDead = "AV_GalvDead"..module.revision,
	balindaDead = "AV_BalindaDead"..module.revision,
	korrakDead = "AV_KorrakDead"..module.revision,
	
	gameStart = "AV_GameStart"..module.revision,
	gameStarted = "AV_GameStarted"..module.revision,
	
	gameEnd = "AV_GameEnd"..module.revision,
	countPlayers = "AV_CountPlayers"..module.revision,
}

function module:OnRegister()
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("MINIMAP_ZONE_CHANGED")
end

function module:OnEnable()
    --self:RegisterEvent("CHAT_MSG_SAY") --debug
	
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SYSTEM")
	self:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")
	
	--self:RegisterEvent("CHAT_MSG_BATTLEGROUND")
	--self:RegisterEvent("CHAT_MSG_BG_SYSTEM_HORDE")
	--self:RegisterEvent("CHAT_MSG_BG_SYSTEM_ALLIANCE")
	
	
	self:RegisterEvent("UNIT_HEALTH")
	
    self:ThrottleSync(8, syncName.gy)
    self:ThrottleSync(8, syncName.tower)
	
	self:ThrottleSync(8, syncName.drek50)
	self:ThrottleSync(8, syncName.drek40)
	self:ThrottleSync(8, syncName.drek30)
	self:ThrottleSync(8, syncName.drek20)
	self:ThrottleSync(8, syncName.drek10)
	
	self:ThrottleSync(8, syncName.vann50)
	self:ThrottleSync(8, syncName.vann40)
	self:ThrottleSync(8, syncName.vann30)
	self:ThrottleSync(8, syncName.vann20)
	self:ThrottleSync(8, syncName.vann10)
	
	self:ThrottleSync(8, syncName.galvDead)
	self:ThrottleSync(8, syncName.balindaDead)
	self:ThrottleSync(8, syncName.korrakDead)
	
	self:ThrottleSync(8, syncName.gameStart)
	self:ThrottleSync(8, syncName.gameStarted)
	
	self:ThrottleSync(8, syncName.gameEnd)
	self:ThrottleSync(4, syncName.countPlayers)
end

function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:CheckForWipe(event)
end

function module:ZONE_CHANGED_NEW_AREA(msg)
	--if UnitName("Player") == "Dreadsome" then DEFAULT_CHAT_FRAME:AddMessage("here") end
	if GetZoneText() ~= "Alterac Valley" or self.core:IsModuleActive(module.translatedName) then
		return
	end

	self.core:EnableModule(module.translatedName)
end

function module:MINIMAP_ZONE_CHANGED(msg)
	self:ZONE_CHANGED_NEW_AREA()
end

function module:CHAT_MSG_SAY(msg)
	--debug
	if UnitName("Player") == "Dreadsome" then
		if msg == "test" then
			self:Sync(syncName.gameEnd .. " " .. 68)
		end
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
    if string.find(msg, L["trigger_gyUnderAttack"]) then
		local _, _, gy, faction = string.find(msg, L["trigger_gyUnderAttack"])
		if gy and faction then
			
			self:RemoveBar(gy)
			
			if faction == L["Alliance"] then
				self:Bar(gy, timer.graveyards, icon.alliance, true, color.alliance)
			elseif faction == L["Horde"] then
				self:Bar(gy, timer.graveyards, icon.horde, true, color.horde)
			end
		end
	
	elseif string.find(msg, L["trigger_towerUnderAttack"]) then
		local _, _, tower, faction = string.find(msg, L["trigger_towerUnderAttack"])
		if tower and faction then
			
			self:RemoveBar(tower)
			
			if faction == L["Alliance"] then
				self:Bar(tower, timer.towers, icon.alliance, true, color.alliance)
			elseif faction == L["Horde"] then
				self:Bar(tower, timer.towers, icon.horde, true, color.horde)
			end
		end
	
	elseif string.find(msg, L["trigger_defend"]) then
		local _, _, obj, faction = string.find(msg, L["trigger_defend"])
		if obj then 
			self:RemoveBar(obj)
		end
		
	elseif string.find(msg, L["trigger_mine"]) then
		local _, _, faction, mine = string.find(msg, L["trigger_mine"])
		if mine and faction then
			
			self:RemoveBar(mine)
			
			if faction == L["Alliance"] then
				self:Bar(mine, timer.mines, icon.alliance, true, color.alliance)
			elseif faction == L["Horde"] then
				self:Bar(mine, timer.mines, icon.horde, true, color.horde)
			end
		end
	end
end

function module:CHAT_MSG_BG_SYSTEM_NEUTRAL(msg)
	if string.find(msg, L["trigger_gameStart"]) then
		local _, _, startTime, minSec = string.find(msg, L["trigger_gameStart"])
		if minSec == "minute" then
			startTime = (tonumber(startTime) * 60)
		elseif minSec == "seconds" then
			startTime = tonumber(startTime)
		end
		self:Sync(syncName.gameStart .. " " .. startTime)
	
	elseif msg == L["trigger_gameHasStarted"] then
		self:Sync(syncName.gameStarted)
	end
end


function module:CHAT_MSG_SYSTEM(msg)
	if string.find(msg, L["trigger_gameEnd"]) then
		local _, _, endTime, minSec = string.find(msg, L["trigger_gameEnd"])
		if minSec == "mins" then
			endTime = (tonumber(endTime) * 60)
		elseif minSec == "secs" then
			endTime = tonumber(endTime)
		end
		self:Sync(syncName.gameEnd .. " " .. endTime)
	end
end

function module:UNIT_HEALTH(msg)
	if UnitName(msg) == bbdrekthar then
		local health = UnitHealth(msg)
		if UnitName("Player") == "Dreadsome" then DEFAULT_CHAT_FRAME:AddMessage("德雷克塔尔: "..health) end
		if health >= 48 and health <= 52 then
			self:Sync(syncName.drek50)
		elseif health >= 38 and health <= 42 then
			self:Sync(syncName.drek40)
		elseif health >= 28 and health <= 32 then
			self:Sync(syncName.drek30)
		elseif health >= 18 and health <= 22 then
			self:Sync(syncName.drek20)
		elseif health >= 8 and health <= 12 then
			self:Sync(syncName.drek10)
		end
	elseif UnitName(msg) == bbvanndarstormpike then
		local health = UnitHealth(msg)
		if UnitName("Player") == "Dreadsome" then DEFAULT_CHAT_FRAME:AddMessage("范达尔·雷矛: "..health) end
		if health >= 48 and health <= 52 then
			self:Sync(syncName.vann50)
		elseif health >= 38 and health <= 42 then
			self:Sync(syncName.vann40)
		elseif health >= 28 and health <= 32 then
			self:Sync(syncName.vann30)
		elseif health >= 18 and health <= 22 then
			self:Sync(syncName.vann20)
		elseif health >= 8 and health <= 12 then
			self:Sync(syncName.vann10)
		end
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if (msg == string.format(UNITDIESOTHER, bbcaptaingalvangar)) then
		self:Sync(syncName.galvDead)
	elseif (msg == string.format(UNITDIESOTHER, bbcaptainbalindastonehearth)) then
		self:Sync(syncName.balindaDead)
	elseif (msg == string.format(UNITDIESOTHER, bbkorrakthebloodrager)) then
		self:Sync(syncName.korrakDead)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.drek50 and self.db.profile.boss then
		self:DrekHp(50)
	elseif sync == syncName.drek40 and self.db.profile.boss then
		self:DrekHp(40)
	elseif sync == syncName.drek30 and self.db.profile.boss then
		self:DrekHp(30)
	elseif sync == syncName.drek20 and self.db.profile.boss then
		self:DrekHp(20)
	elseif sync == syncName.drek10 and self.db.profile.boss then
		self:DrekHp(10)
	
	elseif sync == syncName.vann50 and self.db.profile.boss then
		self:VannHp(50)
	elseif sync == syncName.vann40 and self.db.profile.boss then
		self:VannHp(40)
	elseif sync == syncName.vann30 and self.db.profile.boss then
		self:VannHp(30)
	elseif sync == syncName.vann20 and self.db.profile.boss then
		self:VannHp(20)
	elseif sync == syncName.vann10 and self.db.profile.boss then
		self:VannHp(10)
		
	elseif sync == syncName.galvDead and self.db.profile.captain then
		self:GalvDead()
	elseif sync == syncName.balindaDead and self.db.profile.captain then
		self:BalindaDead()
	elseif sync == syncName.korrakDead and self.db.profile.korrak then
		self:KorrakDead()
		
	elseif sync == syncName.gameStart and rest and self.db.profile.start then
		self:GameStart(rest)
	elseif sync == syncName.gameStarted and rest and self.db.profile.start then
		self:GameStarted()
	
	elseif sync == syncName.gameEnd and rest and self.db.profile.gameend then
		self:GameEnd(rest)
	elseif sync == syncName.countPlayers and self.db.profile.gameend then
		self:CountPlayers()
	end
end

function module:DrekHp(hp)
	self:Message(L["msg_DrekHp"]..hp.."%", "Important", false, nil, false)
end

function module:VannHp(hp)
	self:Message(L["msg_VannHp"]..hp.."%", "Important", false, nil, false)
end

function module:GalvDead()
	self:Message(L["msg_galvDead"], "Important", false, nil, false)
end

function module:BalindaDead()
	self:Message(L["msg_balindaDead"], "Important", false, nil, false)
end

function module:KorrakDead()
	self:Message(L["msg_korrakDead"], "Important", false, nil, false)
end

function module:GameStart(rest)
	local startTime = tonumber(rest)
	self:Bar(L["bar_gameStart"], startTime, icon.gameStart, true, color.gameStart)
end

function module:GameStarted()
	self:RemoveBar(L["bar_gameStart"])
	self:Sound("BikeHorn")
end

function module:GameEnd(rest)
	local endTime = tonumber(rest)
	self:Bar(L["bar_gameEnd"], endTime, icon.gameEnd, true, color.gameEnd)
	
	self:CancelDelayedSync(syncName.countPlayers)
	self:DelayedSync(5, syncName.countPlayers)
end

function module:CountPlayers()
	--this updates the data from scoreboard without opening it
	RequestBattlefieldScoreData()
	
	local numScores = GetNumBattlefieldScores()
	local numHorde = 0
	local numAlliance = 0
	for i=1, numScores do
		name, killingBlows, honorableKills, deaths, honorGained, faction, rank, race, class = GetBattlefieldScore(i);
		if ( faction ) then
			if ( faction == 0 ) then
				numHorde = numHorde + 1
			else
				numAlliance = numAlliance + 1
			end
		end
	end
	
	if numHorde >= 15 and numAlliance >= 15 then
		self:RemoveBar(L["bar_gameEnd"])
	else
		self:DelayedSync(5, syncName.countPlayers)
	end
	--DEFAULT_CHAT_FRAME:AddMessage("部落玩家: "..numHorde.." // 联盟玩家: "..numAlliance)
end
