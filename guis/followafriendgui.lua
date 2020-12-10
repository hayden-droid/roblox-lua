--The whole script has not been tested, change it your likings
function GetFriends(player) --I do not feel like upvaluing it
    return player:GetFriendsOnline(200) --max is 200
end
function GetFriendsInGame(friends)
    local new_friends = {} --dont mean it like thatl
    local placeid = game.PlaceId
    local temp
    for x = 1, #friends do
        temp = friends[x]
        if (temp.IsOnline) then
            if (temp.PlaceId == placeid) then
                new_friends[#new_friends + 1] = temp
            end
        end
    end
    return new_friends
end
--you could make a gui that selects a friend, and maybe hit follow friendinto game
--if you do you then do
function FollowFriend(player, userId)
    --player == main player, userId == the player to follow
    --(if this was for the gui, and the player hit the follow button for the player, you would provide the VisitorId from the online friends table)
    local tp = game:GetService("TeleportService")
    local success, emsg, placeId, instanceId = tp:GetPlayerPlaceInstanceAync(userId)
    if (success) then
        tp:TeleportToPlaceInstance(placeId, instanceId, player)
    else
        script.Parent.JoinAFriend.Text = "Offline"
    end
end    
script.Parent.SearchButton.MouseButton1Down:connect(FollowFriend)
