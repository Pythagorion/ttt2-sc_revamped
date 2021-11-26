if SERVER then
    AddCSLuaFile()
    util.PrecacheSound("suicidal_sounds/gameover_theme1.mp3")
    util.PrecacheSound("suicidal_sounds/gameover_theme2.mp3")
    util.PrecacheSound("suicidal_sounds/gameover_theme3.mp3")
    util.PrecacheSound("suicidal_sounds/gameover_theme4.mp3")
    util.PrecacheSound("suicidal_sounds/gameover_theme5.mp3")
    util.PrecacheSound("suicidal_sounds/gameover_theme6.mp3")
    util.AddNetworkString("ttt2_play_a_sound")
    util.AddNetworkString("ttt2_sc_send_anon_msg")
    util.AddNetworkString("ttt2_sc_send_msg")
    util.AddNetworkString("ttt2_sc_send_both_stats")
    util.AddNetworkString("ttt2_sc_send_pers_stats")
    util.AddNetworkString("ttt2_sc_send_map_stats")
end

local playdeathsound = false
local suicidecount = 0

local plys = player.GetAll()
for i = 1, #plys do
    local ply = plys[i]

    ply.personalCount = 0
end

local ttt2_mstack_msgs = GetConVar("ttt2_sc_use_mstack_msgs"):GetBool()
local ttt2_epop_msgs = GetConVar("ttt2_sc_use_epop_msgs"):GetBool()
local ttt2_anon_announce = GetConVar("ttt2_sc_anon_announcement"):GetBool()
local ttt2_pers_count = GetConVar("ttt2_sc_personal_count"):GetBool()
local ttt2_map_count = GetConVar("ttt2_sc_map_count"):GetBool()
local ttt2_play_sound = GetConVar("ttt2_sc_play_sound"):GetBool()

local function ReadSound(FileName)
	local sound
	local filter
	if SERVER then
		filter = RecipientFilter()
		filter:AddAllPlayers()
	end
	if SERVER or !LoadedSounds[FileName] then
		sound = CreateSound(game.GetWorld(), FileName, filter)
		if sound then
			sound:SetSoundLevel(0)
			if CLIENT then
				LoadedSounds[FileName] = {sound, filter}
			end
		end
	else
		sound = LoadedSounds[FileName][1]
		filter = LoadedSounds[FileName][2]
	end
	if sound then
		if CLIENT then
			sound:Stop()
		end
		sound:Play()
	end
	return sound
end

if SERVER then

    hook.Add("PlayerDeath", "ttt2_sc_death_manager", function( victim, inflictor, attacker )
        if victim == attacker or attacker:IsWorld() then
            victim.personalCount = (victim.personalCount or 0) + 1
            suicidecount = suicidecount + 1
            local vicname = victim:Nick()

            -- use mstack messages
            if ttt2_mstack_msgs then

                -- first send the msg about whom died
                if ttt2_anon_announce then
                    LANG.Msg("ttt2_sc_show_no_name", MSG_MSTACK_WARN)
                else
                    LANG.Msg("ttt2_sc_show_a_name", {deadply = vicname}, MSG_MSTACK_WARN)
                end

                -- send out the statics, if wanted
                if ttt2_pers_count and ttt2_map_count then
                    LANG.Msg("ttt2_sc_show_all", {pcount = victim.personalCount, mapcount = suicidecount}, MSG_MSTACK_WARN)
                elseif ttt2_pers_count and not ttt2_map_count then
                    LANG.Msg("ttt2_sc_show_persn", {pcount = victim.personalCount}, MSG_MSTACK_WARN)
                elseif not ttt2_pers_count and ttt2_map_count then
                    LANG.Msg("ttt2_sc_show_map", {mapcount = suicidecount}, MSG_MSTACK_WARN)
                else
                    return 
                end
            end

            -- use epop messages
            if ttt2_epop_msgs then

                -- first send the msg about whom died
                if ttt2_anon_announce then
                    net.Start("ttt2_sc_send_anon_msg")
                    net.Broadcast()
                else
                    net.Start("ttt2_sc_send_msg")
                    net.WriteEntity(victim)
                    net.Broadcast() 
                end

                -- send out the statics, if wanted
                if ttt2_pers_count and ttt2_map_count then
                    net.Start("ttt2_sc_send_both_stats")
                    net.WriteInt(victim.personalCount, 14)
                    net.WriteInt(suicidecount, 14)
                    net.Broadcast()
                elseif ttt2_pers_count and not ttt2_map_count then
                    net.Start("ttt2_sc_send_pers_stats")
                    net.WriteInt(victim.personalCount, 14)
                    net.Broadcast()
                elseif not ttt2_pers_count and ttt2_map_count then
                    net.Start("ttt2_sc_send_map_stats")
                    net.WriteInt(suicidecount, 14)
                    net.Broadcast()
                else
                    return 
                end
            end

            if ttt2_play_sound then
                playdeathsound = true
                death_sound = ReadSound("suicidal_sounds/gameover_theme" .. math.random(1, 6) .. ".mp3")
                death_sound:Play()
            end
        end
    end)
else -- CLIENT
    net.Receive("ttt2_sc_send_anon_msg", function()
        EPOP:AddMessage({
            text = LANG.TryTranslation("ttt2_sc_show_no_name"),
            color = Color(85, 150, 20, 255)},
            nil,
            5,
            nil,
            true
        )
    end)

    net.Receive("ttt2_sc_send_msg", function()
        local victim_name = net.ReadEntity():Nick()

        EPOP:AddMessage({
            text = LANG.GetParamTranslation("ttt2_sc_show_a_name", {deadply = victim_name}),
            color = Color(85, 150, 20, 255)},
            nil,
            5,
            nil,
            true
        )
    end)

    net.Receive("ttt2_sc_send_both_stats", function()
        local pers_count = net.ReadInt(14)
        local map_count = net.ReadInt(14)

        EPOP:AddMessage({
            text = LANG.GetParamTranslation("ttt2_sc_show_all", {pcount = pers_count, mapcount = map_count}),
            color = Color(85, 150, 20, 255)},
            nil,
            5,
            nil,
            true
        )
    end)

    net.Receive("ttt2_sc_send_pers_stats", function()
        local pers_count = net.ReadInt(14)

        EPOP:AddMessage({
            text = LANG.GetParamTranslation("ttt2_sc_show_persn", {pcount = pers_count}),
            color = Color(85, 150, 20, 255)},
            nil,
            5,
            nil,
            true
        )
    end)

    net.Receive("ttt2_sc_send_map_stats", function()
        local map_count = net.ReadInt(14)

        EPOP:AddMessage({
            text = LANG.GetParamTranslation("ttt2_sc_show_map", {mapcount = map_count}),
            color = Color(85, 150, 20, 255)},
            nil,
            5,
            nil,
            true
        )
    end)
end
