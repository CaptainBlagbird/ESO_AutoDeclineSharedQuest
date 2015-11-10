--[[

Auto Handle Shared Quests
by CaptainBlagbird
https://github.com/CaptainBlagbird

--]]

-- Addon info
local AddonName = "AutoHandleSharedQuests"
AutoHandleSharedQuests = {}
AutoHandleSharedQuests.SavedVarsDefault = {
	ActionAvA = GetString(SI_AHSQ_ACTION_NONE),
	ActionPvE = GetString(SI_AHSQ_ACTION_NONE)
}

-- Local variables
local doAction = {
	[GetString(SI_AHSQ_ACTION_NONE)] = function(questId)
			-- Nothing
		end,
	[GetString(SI_AHSQ_ACTION_ACCEPT)] = function(questId)
			AcceptSharedQuest(questId)
			d(zo_strformat(GetString(SI_AHSQ_MSG_ACCEPTED), GetOfferedQuestShareInfo(questId)))
		end,
	[GetString(SI_AHSQ_ACTION_DECLINE)] = function(questId)
			DeclineSharedQuest(questId)
			d(zo_strformat(GetString(SI_AHSQ_MSG_DECLINED), GetOfferedQuestShareInfo(questId)))
		end,
}


-- Event handler function for EVENT_QUEST_SHARED
local function OnQuestShared(eventCode, questId)
	-- GetCompletedQuestInfo(questId)
	local ava = AutoHandleSharedQuests.SavedVars.ActionAvA
	local pve = AutoHandleSharedQuests.SavedVars.ActionPvE
	if IsPlayerInAvAWorld() then
		doAction[ava](questId)
	else
		doAction[pve](questId)
	end
end

-- Event handler function for EVENT_PLAYER_ACTIVATED
local function OnPlayerActivated(eventCode)
	-- Set up SavedVariables table
	AutoHandleSharedQuests.SavedVars = ZO_SavedVars:New(AddonName.."_SavedVars", 1, nil, AutoHandleSharedQuests.SavedVarsDefault)
	-- Register events that use SavedVariables
	EVENT_MANAGER:RegisterForEvent(AddonName, EVENT_QUEST_SHARED, OnQuestShared)
	-- Unregister this event
	EVENT_MANAGER:UnregisterForEvent(AddonName, EVENT_PLAYER_ACTIVATED)
end
EVENT_MANAGER:RegisterForEvent(AddonName, EVENT_PLAYER_ACTIVATED, OnPlayerActivated)