--[[CLEU Arguments
1. CLEU
2. Timestamp
3. Type of event in CLEU
4. hideCaster
5. sourceGUID
6. sourceName
7. sourceFlags
8. sourceRaidFlags
9. destGUID
10. destName
11. destFlags
12. destRaidFlags
13. spellID
14. spellName
15. spellSchool
16. failedType]]--

local soundFile = "Interface\\AddOns\\MeepMerp\\meepmerp.mp3"
local playerName = UnitName("player");

local MeepMerp = CreateFrame("Frame", "MeepMerp")
	MeepMerp:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

	MeepMerp:SetScript("OnEvent", function(self, eventName, ...)
		return self[eventName](self, eventName, ...)
	end)

function MeepMerp:COMBAT_LOG_EVENT_UNFILTERED(event)
	local playerVehicleName = UnitName("vehicle");
	local _, subevent, _, _, sourceName, _, _, _, _, _, _, _, _, _, failureReason = CombatLogGetCurrentEventInfo()

	if (sourceName == playerName or sourceName == playerVehicleName) then
		if subevent == "SPELL_CAST_FAILED" then
			if failureReason == "Out of range" then
				PlaySoundFile(soundFile, "Master");
			end
		end
	else
		return
	end
end

SLASH_SOUNDTOMAKE1 = "/meepmerp"
SlashCmdList.SOUNDTOMAKE = function()
	print("To change the sound made, navigate to <WoW Folder>/Interface/AddOns/MeepMerp/ and change the copy over and rename your sound to meepmerp.mp3")
end