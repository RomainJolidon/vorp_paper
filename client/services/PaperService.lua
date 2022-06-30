PaperService = {}

PaperService.OpenLetter = function (message, author)
    SendNUIMessage({ action="set_message", message= message, author=author})
    --local ingrs = {"Queue de rat", "aile de corbeau", "Cheveux de bébé"}
    --SendNUIMessage({ action="set_recipe", title="Potion de charme", ingredients=ingrs})
    OpenUI()
end

PaperService.OpenRecipe = function (title, ingrs)
    --local ingrs = {"Queue de rat", "aile de corbeau", "Cheveux de bébé"}
    SendNUIMessage({ action="set_recipe", title=title, ingredients=ingrs})
    OpenUI()
end

PaperService.WriteMessage = function ()
    TriggerEvent('vorpinputs:getInput', "Ecrire", "message", function (text)
        print(text)
        if text ~= nil and #text > 0 and text ~= 'close' then
            TriggerServerEvent("paper:setMessage", text)
        end
    end)
end

function OpenUI()
    SetNuiFocus(true, true)
    SendNUIMessage({ action="open"})
end

PaperService.CloseNUI = function(payload)
    SetNuiFocus(false, false)
    SendNUIMessage({ action="close"})
end