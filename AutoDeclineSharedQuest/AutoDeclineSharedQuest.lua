--[[

Auto Decline Shared Quest
by CaptainBlagbird
https://github.com/CaptainBlagbird

--]]


-- Event handler function for EVENT_QUEST_SHARED
local function OnQuestShared(eventCode, questId)
	DeclineSharedQuest(questId)
	d("Quest automatically declined: \""..GetOfferedQuestShareInfo(questId).."\"")
end
EVENT_MANAGER:RegisterForEvent(QuestMap.name, EVENT_QUEST_SHARED, OnQuestShared)