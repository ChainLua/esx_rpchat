-- {[Created By Chick.IDF#0001]} --
-- Chick.IDF#0001
-- All Rights Reserved To ChickSH @2020 

--{Do Not Touch}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	TriggerClientEvent('chat:addMessage', source, {args = {'^1SYSTEM', _U('unknown_command', command_args[1])}})
end)



--[[AddEventHandler("playerDropped", function()
	twtTime[source] = nil
end)]]--


--Ⓘ OOC! DO Not TOUCH
AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

		if Config.EnableESXIdentity then name = GetPlayerName(source) end
		--TriggerClientEvent("me:event", -1, source, message, 2)
		TriggerClientEvent('chat:addMessage', -1, { args = { _U('ooc_prefix', name), message }, color = { 128, 128, 128 } })
	end
end)



--[[RegisterCommand('twt', function(source, args)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local tick = GetGameTimer()
	if not twtTime[source] or twtTime[source] < tick then
		twtTime[source] = tick+180000
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('twt_prefix', name), args }, color = { 255, 255, 255 }, style = "font-size: 1.7vh;background-color: #0099CC;border-radius: 7px;" })
	
		--print(('%s: %s'):format(name, args))
	else
		local mtime, stime = math.floor((twtTime[source]-tick)/60000), math.floor(((twtTime[source]-tick)/1000))%60
		TriggerClientEvent("chatMessage", source, "", {255, 0, 0}, string.format("השתמשת בשירותי הטוויטר כבר, אנא נסה בעוד %d:%02d דקות", mtime, stime))
	end
end, false)]]--



--Ⓘ Staff Announce !DO Not TOUCH
TriggerEvent('es:addGroupCommand', 'staff', "superadmin", function(source, args, user)
    TriggerClientEvent('sendAnnounce', -1,source,table.concat(args, " "))
end, function(source, args, user)
    TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Announce a message to the entire server", params = {{name = "announcement", help = "The message to announce"}}})


--Ⓘ PoliceJob --DO Not TOUCH!
RegisterCommand('police', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerGroup = xPlayer.getGroup()
	if (xPlayer and xPlayer.job and xPlayer.job.name == "police") or playerGroup == "admin" or playerGroup == "superadmin" then
    TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="text-shadow:1px 1px 3px rgba(0,0,0,1);overflow:hidden;word-break: keep-all; text-overflow: ellipsis;padding: 0.1vw ;padding-right:0.1vw;display:inline; margin: 0.2vw; background-color: rgba(0, 0, 255); border-radius: 0px;"><i class="fab fab-twitter"></i> {0}: {1} ^*✯</div>',
        args = {"^*^0משטרת ישראל^r   ", table.concat(args, " ")}
    })
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You Are Not a Cop ✯', style = { ['background-color'] = '#0020ff', ['color'] = '#ffffff' } })
	end
end, false)



--Ⓘ OOC --DO Not TOUCH!
RegisterCommand('ooc', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	--if Config.EnableESXIdentity then name = GetCharacterName(source) end
	
	TriggerClientEvent('chat:addMessage', -1, { args = { "Everyone OOC | "..name..":", args }, color = { 128, 128, 128 } })
end, false)



--Ⓘ EMSJob --DO Not TOUCH!
RegisterCommand('ems', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerGroup = xPlayer.getGroup()
	if (xPlayer and xPlayer.job and xPlayer.job.name == "ambulance") or playerGroup == "admin" or playerGroup == "superadmin" then
	TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="text-shadow:1px 1px 3px rgba(0,0,0,1);overflow:hidden;word-break: keep-all; text-overflow: ellipsis;padding: 0.1vw ;padding-right:0.1vw;display:inline; margin: 0.2vw; background-color: rgba(255, 0, 0); border-radius: 0px;"><i class="fab fab-twitter"></i> {0}: {1} ^*✡</div>',
		args = {"^*^0מגן דוד אדום^r   ", table.concat(args, " ")}
    })
	else
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You Are Not a EMS 🚑', style = { ['background-color'] = '#fb0700', ['color'] = '#ffffff' } })
	end
end, false)



--Ⓘ MechanicJob --DO Not TOUCH!
RegisterCommand('mechanic', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerGroup = xPlayer.getGroup()
	if (xPlayer and xPlayer.job and xPlayer.job.name == "mechanic") or playerGroup == "admin" or playerGroup == "superadmin" then
	TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="text-shadow:1px 1px 3px rgba(0,0,0,1);overflow:hidden;word-break: keep-all; text-overflow: ellipsis;padding: 0.1vw ;padding-right:0.1vw;display:inline; margin: 0.2vw; background-color: rgba(128, 147, 136); border-radius: 0px;"><i class="fab fab-twitter"></i> {0}: {1} ^*🔧</div>',
		args = {"^*מוסך הכוח^r   ", table.concat(args, " ")}
    })
	else
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You Are Not a Mechanic 🔧', style = { ['background-color'] = '#af7717', ['color'] = '#ffffff' } })
	end
end, false)



--Ⓘ ReporterJob --DO Not TOUCH!
RegisterCommand('reporter', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerGroup = xPlayer.getGroup()
	if (xPlayer and xPlayer.job and xPlayer.job.name == "reporter") or playerGroup == "admin" or playerGroup == "superadmin" then
	TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="text-shadow:1px 1px 3px rgba(0,0,0,1);overflow:hidden;word-break: keep-all; text-overflow: ellipsis;padding: 0.1vw ;padding-right:0.1vw;display:inline; margin: 0.2vw; background-color: rgba(51, 153, 255); border-radius: 0px;"><i class="fab fab-twitter"></i> {0}: {1} ^*🔧</div>',
		args = {"^*חדשות 12^r   ", table.concat(args, " ")}
    })
	else
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You Are Not a Reporter 🎥', style = { ['background-color'] = '#3399ff', ['color'] = '#ffffff' } })
	end
end, false)



--Ⓘ CourtJob --DO Not TOUCH!
RegisterCommand('court', function(source, args)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerGroup = xPlayer.getGroup()
	if (xPlayer and xPlayer.job and xPlayer.job.name == "judge") or playerGroup == "admin" or playerGroup == "superadmin" then
	TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="text-shadow:1px 1px 3px rgba(0,0,0,1);overflow:hidden;word-break: keep-all; text-overflow: ellipsis;padding: 0.1vw ;padding-right:0.1vw;display:inline; margin: 0.2vw; background-color: rgba(252, 236, 3, 0.9); border-radius: 0px;"><i class="fab fab-twitter"></i> {0}: {1} ^*♜</div>',
		args = {"^*^0בית המשפט^r   ", table.concat(args, " ")}
    })
	else
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You Are Not a Judge ♜', style = { ['background-color'] = '#5c3d03', ['color'] = '#ffffff' } })
	end
end, false)



--TESTING DO NOT TOUCH
TriggerEvent('es:addGroupCommand', 'testjoin', "superadmin", function(source, args, user)
	TriggerClientEvent('chatMessage', -1, '', { 255, 0, 0 }, '^0' .. '(Testing)' ..  '^0  התחבר ' ..'^8'.. GetPlayerName(source) )
end, false)



--TESTING DO NOT TOUCH
TriggerEvent('es:addGroupCommand', 'testleave', "superadmin", function(source, args, user)
	TriggerClientEvent('chatMessage', -1, '', { 255, 0, 0 }, '^0' .. '(Testing)' ..  '^0  התנתק ' ..'^9'.. GetPlayerName(source) )
end, false)



--Ⓘ DevAnnounceing --DO Not TOUCH!
TriggerEvent('es:addGroupCommand', 'dev', "superadmin", function(source, args, user)
	local prefix = "ⓘ צוות תכנות^r"
	TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="padding: 0.07vw ;font-size:23px;padding-right:0.3vw;overflow:hidden;word-break: keep-all;display:inline; margin: 0.0vw; background-color: rgba(144, 64, 175); border-radius: 0px;"> {0} {1} ⓘ ^* </div>',
		args = {"^*^0צוות תכנות^r:  ", table.concat(args, " ")}
    })
end, false)



--Ⓘ StoryLineAnnounceing --DO Not TOUCH!
TriggerEvent('es:addGroupCommand', 'storyline', "superadmin", function(source, args, user)
	local prefix = "StoryLine"
	TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="padding: 0.07vw ;font-size:23px;padding-right:0.3vw;overflow:hidden;word-break: keep-all;display:inline; margin: 0.0vw; background-color: rgba(0, 250, 0); border-radius: 0px;"> {0} {1} ⓘ ^* </div>',
		args = {"^*סטורי ליין^r:  ", table.concat(args, " ")}
    })
end, false)



--PrivateMessages
local LastPlayer, WantDM, WantSpy = {}, {}, {}

RegisterCommand('msg', function(source, args, user)
    if args[1] then
        if(tonumber(args[1]) and GetPlayerName(tonumber(args[1]))) then
            local xTarget = tonumber(args[1])
            if xTarget == tonumber(source) then
                TriggerClientEvent('chat:addMessage', source, { args = { '^1Messaging System ', 'You cant send message to yourself'}})
            else
                if WantDM[xTarget] == false or WantDM[source] == false then
                    TriggerClientEvent('chat:addMessage', source, { args = { '^1Messaging System ', 'One of the players disabled his private messages.'}})
                else
                    local message = args
                    table.remove(message, 1)
                    if(#message == 0) then
                        TriggerClientEvent('chat:addMessage', source, { args = { '^1Messaging System ', 'You must to type a message'}})
                    else
                        message = table.concat(message, " ")
                        TriggerClientEvent('chat:addMessage', source, {
                        template = "<div style='font-size: calc(2.1vw / 1.77777);display: inline-block;line-height: calc((2.7vw / 1.77777) * 1.2); background-color: rgba(127, 140, 114, 0.5); border-radius: 7px;'><la style='padding: 5px;'><a style='padding: 5px;'>{0}</a><img src='https://cdn0.iconfinder.com/data/icons/thin-communication-messaging/24/thin-0306_chat_message_discussion_bubble_conversation-512.png' style='width:19px;height:15px;'></img></la></div>",
                        args = { ( '^1' .. GetPlayerName(source) .. '(' .. tonumber(source) .. ')^0 to ^2' .. GetPlayerName(xTarget) .. '(' .. xTarget ..')^0 : ' .. message ) }
                        })
                        TriggerClientEvent('chat:addMessage', xTarget, {
                            template = "<div style='font-size: calc(2.1vw / 1.77777);display: inline-block;line-height: calc((2.7vw / 1.77777) * 1.2); background-color: rgba(127, 140, 114, 0.5); border-radius: 7px;'><la style='padding: 5px;'><a style='padding: 5px;'>{0}</a><img src='https://cdn0.iconfinder.com/data/icons/thin-communication-messaging/24/thin-0306_chat_message_discussion_bubble_conversation-512.png' style='width:19px;height:15px;'></img></la></div>",
                            args = { ( '^1' .. GetPlayerName(source) .. '(' .. tonumber(source) .. ')^0 to ^2' .. GetPlayerName(xTarget) .. '(' .. xTarget ..')^0 : ' .. message ) }
                        })
                        for a = 0, GetNumPlayerIndices()-1 do
                            local b = tonumber(GetPlayerFromIndex(a))
                            if WantSpy[b] == true then
                                TriggerClientEvent('chat:addMessage', b, {
                                    template = "<div style='font-size: calc(2.1vw / 1.77777);display: inline-block;line-height: calc((2.7vw / 1.77777) * 1.2); background-color: rgba(127, 140, 114, 0.5); border-radius: 7px;'><la style='padding: 5px;'><a style='padding: 5px;'>{0}</a><img src='https://cdn0.iconfinder.com/data/icons/thin-communication-messaging/24/thin-0306_chat_message_discussion_bubble_conversation-512.png' style='width:19px;height:15px;'></img></la></div>",
                                    args = { ( '^1' .. GetPlayerName(source) .. '(' .. tonumber(source) .. ')^0 to ^2' .. GetPlayerName(xTarget) .. '(' .. xTarget ..')^0 : ' .. message ) }
                                })
                            end
                        end
                        LastPlayer[source] = xTarget
                        LastPlayer[xTarget] =  tonumber(source)
                    end
                end
            end
        else
            TriggerClientEvent('chat:addMessage', source, { args = { '^1Messaging System ', 'There is no player with id ' .. tonumber(args[1])}})
        end
    else
        TriggerClientEvent('chat:addMessage', source, { args = { '^1Messaging System ', 'You must to type a player id'}})
    end
end, false)

RegisterCommand('r', function(source, args, user)
    if args[1] then
        if WantDM[LastPlayer[source]] == false or WantDM[source] == false then
            TriggerClientEvent('chat:addMessage', source, { args = { '^1Messaging System ', 'One of the players disabled his private messages'}})
        else
            local message = args
            message = table.concat(message, " ")
            TriggerClientEvent('chat:addMessage', source, {
                template = "<div style='font-size: calc(2.1vw / 1.77777);display: inline-block;line-height: calc((2.7vw / 1.77777) * 1.2); background-color: rgba(127, 140, 114, 0.5); border-radius: 7px;'><la style='padding: 5px;'><a style='padding: 5px;'>{0}</a><img src='https://cdn0.iconfinder.com/data/icons/thin-communication-messaging/24/thin-0306_chat_message_discussion_bubble_conversation-512.png' style='width:19px;height:15px;'></img></la></div>",
                args = { ( '^1' .. GetPlayerName(source) .. '(' .. tonumber(source) .. ')^0 to ^2' .. GetPlayerName(LastPlayer[source]) .. '(' .. tonumber(LastPlayer[source]) ..')^0 : ' .. message ) }
            })
            TriggerClientEvent('chat:addMessage', LastPlayer[source], {
                    template = "<div style='font-size: calc(2.1vw / 1.77777);display: inline-block;line-height: calc((2.7vw / 1.77777) * 1.2); background-color: rgba(127, 140, 114, 0.5); border-radius: 7px;'><la style='padding: 5px;'><a style='padding: 5px;'>{0}</a><img src='https://cdn0.iconfinder.com/data/icons/thin-communication-messaging/24/thin-0306_chat_message_discussion_bubble_conversation-512.png' style='width:19px;height:15px;'></img></la></div>",
                    args = { ( '^1' .. GetPlayerName(source) .. '(' .. tonumber(source) .. ')^0 to ^2' .. GetPlayerName(LastPlayer[source]) .. '(' .. tonumber(LastPlayer[source]) ..')^0 : ' .. message ) }
            })
        end
    end
end)

RegisterCommand('block', function(source)
    TriggerClientEvent('chat:addMessage', source, { args = { '^1Messaging System ', 'You now turned '.. (WantDM[source] and 'OFF' or 'ON')..' your private messages.'}})
    WantDM[source] = not WantDM[source]
end)

RegisterCommand('spy', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == 'superadmin' or xPlayer.getGroup() == 'admin' then
        TriggerClientEvent('chat:addMessage', source, { args = { '^1Messaging System ', 'You now '.. (WantSpy[source] and 'wont following' or 'following')..' the private messages.'}})
        WantSpy[source] = not WantSpy[source]
    else
        TriggerClientEvent('chat:addMessage', source, { args = { '^1Messaging System ', 'You have no access to this command.'}})
    end
end)
--PrivateMessages




--DO NOT TOUCH THIS
function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end
