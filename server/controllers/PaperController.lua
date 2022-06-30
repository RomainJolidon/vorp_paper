RegisterServerEvent("onServerResourceStart")
AddEventHandler("onServerResourceStart", PaperService.OnServerResourceStart)

RegisterServerEvent("paper:setMessage")
AddEventHandler("paper:setMessage", PaperService.SetMessage)

RegisterServerEvent("paper:receiveLetter")
AddEventHandler("paper:receiveLetter", PaperService.ReceiveLetter)

-- Temp For Dev

local paperhashName = "p_paper01x"

RegisterCommand("addLetter", function(source, args, rawCommand)
    -- If the source is > 0, then that means it must be a player.
    if (source > 0) then

        local message = table.concat(args," ")
        message = #message > 0 and message or 'Ceci est une lettre'
        local sourceCharacter = Core.getUser(source).getUsedCharacter

        local author = sourceCharacter.firstname .. ' ' .. sourceCharacter.lastname

        VorpInv.addItem(source, paperhashName, 1, {message = message, author=author, description= "Message de " .. author})
    
    -- If it's not a player, then it must be RCON, a resource, or the server console directly.
    else
        print("This command was executed by the server console, RCON client, or a resource.")
    end
end, false --[[this command is not restricted, everyone can use this.]])

RegisterCommand("addRecipe", function(source, args, rawCommand)
    -- If the source is > 0, then that means it must be a player.
    if (source > 0) then

        if #args < 2 then
            return
        end
        local title = args[1]

        table.remove(args,1)

        VorpInv.addItem(source, paperhashName, 1, {title = title, ingrs=args, description= "Recette de " .. title})

    -- If it's not a player, then it must be RCON, a resource, or the server console directly.
    else
        print("This command was executed by the server console, RCON client, or a resource.")
    end
end, false --[[this command is not restricted, everyone can use this.]])

RegisterCommand("addPaper", function(source, args, rawCommand)
    -- If the source is > 0, then that means it must be a player.
    if (source > 0) then
        VorpInv.addItem(source, paperhashName, 1, {description= "blanc comme neige"})
    
    -- If it's not a player, then it must be RCON, a resource, or the server console directly.
    else
        print("This command was executed by the server console, RCON client, or a resource.")
    end
end, false --[[this command is not restricted, everyone can use this.]])