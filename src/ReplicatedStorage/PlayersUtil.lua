local PlayerUtil = {}

local Players = game:GetService("Players")

function PlayerUtil.GetFriendsInServer(x)
    local friends = {}
    local friendsInServer = {}

    for i, player in Players:GetPlayers() do
        if i == x then
            --print(player.Name)

            local function iterPageItems(pages)
                return coroutine.wrap(function()
                    local pagenum = 1
                    while true do
                        for _, item in ipairs(pages:GetCurrentPage()) do
                            coroutine.yield(item, pagenum)
                        end
                        if pages.IsFinished then
                            break
                        end
                        pages:AdvanceToNextPageAsync()
                        pagenum = pagenum + 1
                    end
                end)
            end
            
            -- Then, get a FriendPages object for their friends
            local friendPages = Players:GetFriendsAsync(player.UserId)
            -- Iterate over the items in the pages. For FriendPages, these
            -- are tables of information about the friend, including Username.
            -- Collect each username in a table
            local usernames = {}
            for item, _pageNo in iterPageItems(friendPages) do
                table.insert(usernames, item.Username)
            end
            
            friends = usernames 
            --print(friends)
        end
    end

    for _, player in Players:GetPlayers() do
        for _, friend in friends do
            if player.Name == friend then
                table.insert(friendsInServer, friend)
            end
        end
    end

    return friendsInServer
end

function PlayerUtil.GetPlayersQuantity()
    return #Players:GetPlayers()
end

return PlayerUtil