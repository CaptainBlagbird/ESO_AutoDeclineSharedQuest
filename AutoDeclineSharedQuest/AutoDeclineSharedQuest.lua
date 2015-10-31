--[[

Auto Decline Shared Quest
by CaptainBlagbird
https://github.com/CaptainBlagbird

--]]

-- Addon info
local AddonName = "AutoDeclineSharedQuest"


-- Event handler function for EVENT_QUEST_SHARED
local function OnQuestShared(eventCode, questId)
	DeclineSharedQuest(questId)
	d("Quest automatically declined: \""..GetOfferedQuestShareInfo(questId).."\"")
end
EVENT_MANAGER:RegisterForEvent(AddonName, EVENT_QUEST_SHARED, OnQuestShared)