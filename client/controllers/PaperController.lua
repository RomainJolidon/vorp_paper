RegisterNetEvent('paper:openLetter')
AddEventHandler('paper:openLetter', PaperService.OpenLetter)

RegisterNetEvent('paper:openRecipe')
AddEventHandler('paper:openRecipe', PaperService.OpenRecipe)

RegisterNetEvent('paper:writeMessage')
AddEventHandler('paper:writeMessage', PaperService.WriteMessage)

--NUI
RegisterNUICallback("NUIFocusOff", PaperService.CloseNUI)