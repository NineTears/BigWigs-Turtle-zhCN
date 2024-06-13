
local module, L = BigWigs:ModuleDeclaration("Death Talon Wyrmguard", "Blackwing Lair")
local BST = AceLibrary("Babble-SpellTree-2.2")

module.revision = 20041
module.enabletrigger = module.translatedName
module.toggleoptions = {"vulnerability", "warstomp"}
module.trashMod = true

L:RegisterTranslations("enUS", function() return {
    cmd = "Wyrmguard",
    
    warstomp_cmd = "warstomp",
    warstomp_name = "战争践踏警报",
    warstomp_desc = "战争践踏出现时进行警告",
    
    vulnerability_cmd = "vulnerability",
    vulnerability_name = "弱点",
    vulnerability_desc = "弱点发生变化时进行警告",
    
	hit = "hits",
	crit = "crits",
    vuln_bar = "%s 弱点",
    
    warstomp_trigger = "Death Talon Wyrmguard's War Stomp",
    warstomp_bar = "战争践踏 CD",
    
    vulnerability_direct_test = "^[%w]+[%s's]* ([%w%s:]+) ([%w]+) Death Talon Wyrmguard for ([%d]+) ([%w]+) damage%.[%s%(]*([%d]*)",
    vulnerability_dots_test = "^Death Talon Wyrmguard suffers ([%d]+) ([%w]+) damage from [%w]+[%s's]* ([%w%s:]+)%.[%s%(]*([%d]*)",
    vulnerability_message = "弱点：%s！",
    
	fire = "Fire",
	frost = "Frost",
	shadow = "Shadow",
	nature = "Nature",
	arcane = "Arcane",
	
	curseofdoom = "Curse of Doom",
	ignite = "Ignite",
	starfire = "Starfire",
	thunderfury = "Thunderfury",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-11
    cmd = "Wyrmguard",
    
    warstomp_cmd = "warstomp",
    warstomp_name = "战争践踏警报",
    warstomp_desc = "战争践踏出现时进行警告",
    
    vulnerability_cmd = "vulnerability",
    vulnerability_name = "弱点",
    vulnerability_desc = "弱点发生变化时进行警告",
    
	hit = "hits",
	crit = "crits",
    vuln_bar = "%s 弱点",
    
    warstomp_trigger = "Death Talon Wyrmguard's War Stomp",
    warstomp_bar = "战争践踏 CD",
    
    vulnerability_direct_test = "^[%w]+[%s's]* ([%w%s:]+) ([%w]+) Death Talon Wyrmguard for ([%d]+) ([%w]+) damage%.[%s%(]*([%d]*)",
    vulnerability_dots_test = "^Death Talon Wyrmguard suffers ([%d]+) ([%w]+) damage from [%w]+[%s's]* ([%w%s:]+)%.[%s%(]*([%d]*)",
    vulnerability_message = "弱点：%s！",
    
	fire = "Fire",
	frost = "Frost",
	shadow = "Shadow",
	nature = "Nature",
	arcane = "Arcane",
	
	curseofdoom = "Curse of Doom",
	ignite = "Ignite",
	starfire = "Starfire",
	thunderfury = "Thunderfury",
} end )
local timer = {
	warstomp = {8.5, 12.5},
	vulnerability = 599,
}

local icon = {
	warstomp = "Ability_WarStomp",
	vulnerability = "Spell_Shadow_BlackPlague",
	shadow = "spell_shadow_shadowbolt",
	fire = "Spell_Fire_Fire",
	frost = "Spell_Frost_ChillingBlast",
	nature = "spell_nature_healingtouch",
	arcane = "spell_nature_starfall",
}

local syncName = {
	warstomp = "WyrmguardWarstomp"..module.revision
}

local vulnerability = nil
local stompNumber = 1
local deathCount = 0

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_SPELL_PET_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE", "PlayerDamageEvents")
	self:ThrottleSync(0.5, syncName.warstomp)
end

function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	stompNumber = 1
	deathCount = 0
end

function module:OnEngage()
	bwWyrmguardsNatureBar = false
	bwWyrmguardsFrostBar = false
	bwWyrmguardsFireBar = false
	bwWyrmguardsArcaneBar = false
	bwWyrmguardsShadowBar = false
	
	vulnerability = nil
end

function module:OnDisengage()
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, module.translatedName) then
		deathCount = deathCount + 1
		if deathCount >= 3 then
			BigWigs:CheckForBossDeath(msg, self)
		end
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE(msg)
	if self.db.profile.vulnerability then
		local _, _, dmg, school, userspell, partial = string.find(msg, L["vulnerability_dots_test"])
		if dmg and school and userspell then
			if school == BST["Arcane"] then
				if partial and partial ~= "" then
					if tonumber(dmg)+tonumber(partial) >= 250 then
						self:IdentifyVulnerability(school)
					end
				else
					if tonumber(dmg) >= 250 then
						self:IdentifyVulnerability(school)
					end
				end
			elseif school == BST["Fire"] and not string.find(userspell, L["ignite"]) then
				if partial and partial ~= "" then
					if tonumber(dmg)+tonumber(partial) >= 400 then
						self:IdentifyVulnerability(school)
					end
				else
					if tonumber(dmg) >= 400 then
						self:IdentifyVulnerability(school)
					end
				end
			elseif school == BST["Nature"] then
				if partial and partial ~= "" then
					if tonumber(dmg)+tonumber(partial) >= 300 then
						self:IdentifyVulnerability(school)
					end
				else
					if tonumber(dmg) >= 300 then
						self:IdentifyVulnerability(school)
					end
				end
			elseif school == BST["Shadow"] then
				if string.find(userspell, L["curseofdoom"]) then
					if partial and partial ~= "" then
						if tonumber(dmg)+tonumber(partial) >= 3000 then
							self:IdentifyVulnerability(school)
						end
					else
						if tonumber(dmg) >= 3000 then
							self:IdentifyVulnerability(school)
						end
					end
				else
					if partial and partial ~= "" then
						if tonumber(dmg)+tonumber(partial) >= 500 then
							self:IdentifyVulnerability(school)
						end
					else
						if tonumber(dmg) >= 500 then
							self:IdentifyVulnerability(school)
						end
					end
				end
			end
		end
	end
end

function module:PlayerDamageEvents(msg)
	if self.db.profile.vulnerability then
		local _, _, userspell, stype, dmg, school, partial = string.find(msg, L["vulnerability_direct_test"])
		if stype and dmg and school then
			if school == BST["Arcane"] then
				if string.find(userspell, L["starfire"]) then
					if partial and partial ~= "" then
						if (tonumber(dmg)+tonumber(partial) >= 800 and stype == L["hit"]) or (tonumber(dmg)+tonumber(partial) >= 1200 and stype == L["crit"]) then
							self:IdentifyVulnerability(school)
						end
					else
						if (tonumber(dmg) >= 800 and stype == L["hit"]) or (tonumber(dmg) >= 1200 and stype == L["crit"]) then
							self:IdentifyVulnerability(school)
						end
					end
				else
					if partial and partial ~= "" then
						if (tonumber(dmg)+tonumber(partial) >= 600 and stype == L["hit"]) or (tonumber(dmg)+tonumber(partial) >= 1200 and stype == L["crit"]) then
							self:IdentifyVulnerability(school)
						end
					else
						if (tonumber(dmg) >= 600 and stype == L["hit"]) or (tonumber(dmg) >= 1200 and stype == L["crit"]) then
							self:IdentifyVulnerability(school)
						end
					end
				end
			elseif school == BST["Fire"] then
				if partial and partial ~= "" then
					if (tonumber(dmg)+tonumber(partial) >= 1300 and stype == L["hit"]) or (tonumber(dmg)+tonumber(partial) >= 2600 and stype == L["crit"]) then
						self:IdentifyVulnerability(school)
					end
				else
					if (tonumber(dmg) >= 1300 and stype == L["hit"]) or (tonumber(dmg) >= 2600 and stype == L["crit"]) then
						self:IdentifyVulnerability(school)
					end
				end
			elseif school == BST["Frost"] then
				if partial and partial ~= "" then
					if (tonumber(dmg)+tonumber(partial) >= 800 and stype == L["hit"])	or (tonumber(dmg)+tonumber(partial) >= 1600 and stype == L["crit"]) then
						self:IdentifyVulnerability(school)
					end
				else
					if (tonumber(dmg) >= 800 and stype == L["hit"]) or (tonumber(dmg) >= 1600 and stype == L["crit"]) then
						self:IdentifyVulnerability(school)
					end
				end
			elseif school == BST["Nature"] then
				if string.find(userspell, L["thunderfury"]) then
					if partial and partial ~= "" then
						if (tonumber(dmg)+tonumber(partial) >= 800 and stype == L["hit"]) or (tonumber(dmg)+tonumber(partial) >= 1200 and stype == L["crit"]) then
							self:IdentifyVulnerability(school)
						end
					else
						if (tonumber(dmg) >= 800 and stype == L["hit"]) or (tonumber(dmg) >= 1200 and stype == L["crit"]) then
							self:IdentifyVulnerability(school)
						end
					end
				else
					if partial and partial ~= "" then
						if (tonumber(dmg)+tonumber(partial) >= 900 and stype == L["hit"]) or (tonumber(dmg)+tonumber(partial) >= 1800 and stype == L["crit"]) then
							self:IdentifyVulnerability(school)
						end
					else
						if (tonumber(dmg) >= 900 and stype == L["hit"]) or (tonumber(dmg)>= 1800 and stype == L["crit"]) then
							self:IdentifyVulnerability(school)
						end
					end
				end
			elseif school == BST["Shadow"] then
				if partial and partial ~= "" then
					if (tonumber(dmg)+tonumber(partial) >= 1700 and stype == L["hit"]) or (tonumber(dmg)+tonumber(partial) >= 3400 and stype == L["crit"]) then
						self:IdentifyVulnerability(school)
					end
				else
					if (tonumber(dmg) >= 1700 and stype == L["hit"]) or (tonumber(dmg) >= 3400 and stype == L["crit"]) then
						self:IdentifyVulnerability(school)
					end
				end
			end
		end
	end
end

function module:Event(msg)
	if string.find(msg, L["warstomp_trigger"]) then
		self:Sync(syncName.warstomp)
	end
end

function module:BigWigs_RecvSync( sync, rest, nick )
	if sync == syncName.warstomp and self.db.profile.warstomp then
		self:WarStomp(stompNumber)
		stompNumber = stompNumber + 1
		if stompNumber >= 4 then
			stompNumber = 1
		end
	end
end
			
function module:WarStomp(number)
	self:IntervalBar(L["warstomp_bar"]..number, timer.warstomp[1], timer.warstomp[2], icon.warstomp)
end

function module:IdentifyVulnerability(school)
	if not self.db.profile.vulnerability or not type(school) == "string" then return end
	vulnerability = school
	
	if vulnerability == BST["Nature"] and bwWyrmguardsNatureBar == false then
		self:Bar(format(L["vuln_bar"], school), timer.vulnerability, icon.nature, true, "green")
		bwWyrmguardsNatureBar = true
	end
	if vulnerability == BST["Frost"] and bwWyrmguardsFrostBar == false then
		self:Bar(format(L["vuln_bar"], school), timer.vulnerability, icon.frost, true, "blue")
		bwWyrmguardsFrostBar = true
	end
	if vulnerability == BST["Fire"] and bwWyrmguardsFireBar == false then
		self:Bar(format(L["vuln_bar"], school), timer.vulnerability, icon.fire, true, "red")
		bwWyrmguardsFireBar = true
	end
	if vulnerability == BST["Arcane"] and bwWyrmguardsArcaneBar == false then
		self:Bar(format(L["vuln_bar"], school), timer.vulnerability, icon.arcane, true, "pink")
		bwWyrmguardsArcaneBar = true
	end
	if vulnerability == BST["Shadow"] and bwWyrmguardsShadowBar == false then
		self:Bar(format(L["vuln_bar"], school), timer.vulnerability, icon.shadow, true, "black")
		bwWyrmguardsShadowBar = true
	end
end

