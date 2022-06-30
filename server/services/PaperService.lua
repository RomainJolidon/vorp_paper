PaperService = {}
Core = {}
VorpInv = exports.vorp_inventory:vorp_inventoryApi()
local paperhashName = "p_paper01x"

Citizen.CreateThread(function()
    TriggerEvent("getCore", function(dic)
        Core = dic;
    end)
end)

PaperService.OnServerResourceStart = function(resource)
    if resource ~= GetCurrentResourceName() then
        return
    end

    VorpInv.RegisterUsableItem(paperhashName, function (data)
        local source = data.source
        local metadata = data.item.metadata

        if metadata.message ~= nil and metadata.author ~= nil then
            TriggerClientEvent("paper:openLetter", source, metadata.message, metadata.author)
        elseif metadata.title ~= nil and metadata.ingrs ~= nil then
            TriggerClientEvent("paper:openRecipe", source, metadata.title, metadata.ingrs)
        else
            TriggerClientEvent("paper:writeMessage", source)
        end
    end)
end

PaperService.SetMessage = function (message)
    local _source = source
    local sourceCharacter = Core.getUser(_source).getUsedCharacter

    local author = sourceCharacter.firstname .. ' ' .. sourceCharacter.lastname

    VorpInv.subItem(_source, paperhashName, 1, {})
    VorpInv.addItem(_source, paperhashName, 1, {message= tostring(message), author=author, description= "Message de " .. author})
end

PaperService.ReceiveLetter = function(message, author)
    local _source = source

    --VorpInv.subItem(_source, paperhashName, 1, {})
    VorpInv.addItem(_source, paperhashName, 1, {message= tostring(message), author=author, description= "Message de " .. author})
end

