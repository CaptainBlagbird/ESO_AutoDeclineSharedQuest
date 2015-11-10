--[[

Auto Handle Shared Quests
by CaptainBlagbird
https://github.com/CaptainBlagbird

--]]

local AddonName = "AutoHandleSharedQuests"

local panelData = {
	type = "panel",
	name = "Auto Handle Shared Quests",
	displayName = "|c70C0DEAuto Handle Shared Quests|r",
	author = "|c70C0DECaptainBlagbird|r",
	version = "1.1",
	registerForRefresh = true,
	registerForDefaults = true,
}

local optionsTable = {
	{
		type = "dropdown",
		name = GetString(SI_AHSQ_DESC_AVA),
		tooltip = GetString(SI_AHSQ_TT_AVA),
		choices = {GetString(SI_AHSQ_ACTION_NONE), GetString(SI_AHSQ_ACTION_ACCEPT), GetString(SI_AHSQ_ACTION_DECLINE)},
		getFunc = function() return AutoHandleSharedQuests.SavedVars.ActionAvA end,
		setFunc = function(str) AutoHandleSharedQuests.SavedVars.ActionAvA = str end,
		default = AutoHandleSharedQuests.SavedVarsDefault.ActionAvA,
	},
	{
		type = "dropdown",
		name = GetString(SI_AHSQ_DESC_PVE),
		tooltip = GetString(SI_AHSQ_TT_PVE),
		choices = {GetString(SI_AHSQ_ACTION_NONE), GetString(SI_AHSQ_ACTION_ACCEPT), GetString(SI_AHSQ_ACTION_DECLINE)},
		getFunc = function() return AutoHandleSharedQuests.SavedVars.ActionPvE end,
		setFunc = function(str) AutoHandleSharedQuests.SavedVars.ActionPvE = str end,
		default = AutoHandleSharedQuests.SavedVarsDefault.ActionPvE,
	},
}

-- Wait until all addons are loaded
local function OnPlayerActivated(eventCode)
	EVENT_MANAGER:UnregisterForEvent(AddonName.."_Settings", EVENT_PLAYER_ACTIVATED)
	if LibStub ~= nil then
		local LAM = LibStub("LibAddonMenu-2.0")
		LAM:RegisterAddonPanel(AddonName.."_Options", panelData)
		LAM:RegisterOptionControls(AddonName.."_Options", optionsTable)
	end
end
EVENT_MANAGER:RegisterForEvent(AddonName.."_Settings", EVENT_PLAYER_ACTIVATED, OnPlayerActivated)