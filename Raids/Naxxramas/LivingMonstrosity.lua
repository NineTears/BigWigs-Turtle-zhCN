
local module, L = BigWigs:ModuleDeclaration("Living Monstrosity", "Naxxramas")
local BC = AceLibrary("Babble-Class-2.2")
local bslightningtotem = AceLibrary("Babble-Spell-2.2")["Lightning Totem"]

module.revision = 30067
module.enabletrigger = module.translatedName
module.toggleoptions = {"lightningtotem", "autotarget"}
module.trashMod = true
module.defaultDB = {
	bosskill = false,
}

L:RegisterTranslations("enUS", function() return {
    cmd = "Monstrosity",

    lightningtotem_cmd = "lightningtotem",
    lightningtotem_name = "闪电图腾警报",
    lightningtotem_desc = "召唤闪电图腾时进行警告",

    autotarget_cmd = "autotarget",
    autotarget_name = "自动目标闪电图腾",
    autotarget_desc = "召唤图腾时自动选择为目标",

    trigger_totemUp = "Living Monstrosity casts Lightning Totem.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF
    msg_totemUp = "闪电图腾！",

    trigger_totemDead = "Lightning Totem dies.",--CHAT_MSG_COMBAT_HOSTILE_DEATH
    msg_totemDead = "图腾死了 =)",
} end )

L:RegisterTranslations("zhCN", function() return {
    cmd = "Monstrosity",

    lightningtotem_cmd = "lightningtotem",
    lightningtotem_name = "闪电图腾警报",
    lightningtotem_desc = "召唤闪电图腾时进行警告",

    autotarget_cmd = "autotarget",
    autotarget_name = "自动目标闪电图腾",
    autotarget_desc = "召唤图腾时自动选择为目标",

    trigger_totemUp = "Living Monstrosity casts Lightning Totem.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF
    msg_totemUp = "闪电图腾！",

    trigger_totemDead = "Lightning Totem dies.",--CHAT_MSG_COMBAT_HOSTILE_DEATH
    msg_totemDead = "图腾死了 =)",
} end )

local timer = {
}
local icon = {
	lightningTotem = "Spell_Nature_Lightning"
}
local syncName = {
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "Event")--totem up
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "Event")--totem dead
end

function module:OnSetup()
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:Event(msg)
	if msg == L["trigger_totemUp"] then
		if self.db.profile.lightningtotem then
			self:Message(L["msg_totemUp"], "Urgent", false, nil, false)
			self:WarningSign(icon.lightningTotem, 0.7)
		end
		if self.db.profile.autotarget then
			if UnitClass("Player") == BC["Rogue"] then
				TargetByName(bslightningtotem,true)
				--DEFAULT_CHAT_FRAME:AddMessage("Rogue")
			end
			--if UnitClass("Player") == BC["Paladin"] then
			--	DEFAULT_CHAT_FRAME:AddMessage("Paladin")
			--end
			if UnitClass("Player") == BC["Hunter"] then
				TargetByName(bslightningtotem,true)
				--DEFAULT_CHAT_FRAME:AddMessage("Hunter")
			end
			if UnitClass("Player") == BC["Warrior"] then
				TargetByName(bslightningtotem,true)
				--DEFAULT_CHAT_FRAME:AddMessage("Warrior")
			end
			if UnitClass("Player") == BC["Mage"] then
				TargetByName(bslightningtotem,true)
				--DEFAULT_CHAT_FRAME:AddMessage("Mage")
			end
			if UnitClass("Player") == BC["Warlock"] then
				TargetByName(bslightningtotem,true)
				--DEFAULT_CHAT_FRAME:AddMessage("Warlock")
			end
		end
	elseif msg == L["trigger_totemDead"] and self.db.profile.lightningtotem then
		self:Message(L["msg_totemDead"], "Urgent", false, nil, false)
	end
end
