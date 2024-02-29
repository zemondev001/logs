_G.Config = {
    log = {
        apikey = "d4e674c9-3786-4d43-9c3a-0b6d7b70a257"
    }
}

local requests = (syn and syn.request) or (krnl and request) or (fluxus and fluxus.request) or (electron and http.request) or request or http.request
local host = "http://zemondv.xyz"
local apikey = _G.Config.log.apikey
getgenv().Local=function(data)
    if data==1 then return game.Players.LocalPlayer.Name end
    if data==2 then return game.Players.LocalPlayer.UserId end
end

local json_encode = function(data)
    return game:GetService("HttpService"):JSONEncode(data)
end

function Added(data)
    local update = requests({
        Url = host.."/api/table/add",
        Headers = {
            ["Content-Type"] = "application/json",
        },
        Method = "POST",
        Body = data,
    })
    print("💜 Added Account to ZDVLOGS ")
    return update
end

function Update(data)
    local update = requests({
        Url = host.."/api/table/edit",
        Headers = {
            ["Content-Type"] = "application/json",
        },
        Method = "POST",
        Body = data,
    })
    print("💜 Updatelogs ZDV ")
    return update
end

local SkillAwake = '❌'
local WorldText = '1'

local placeId = game.PlaceId
if placeId == 2753915549 then
	WorldText = '1'
elseif placeId == 4442272183 then
	WorldText = '2'
elseif placeId == 7449423635 then
	WorldText = '3'
end

function Abbreviate(x)
    local abbreviations = {
        "K", -- 4 digits
        "M", -- 7 digits
        "B", -- 10 digits
        "T", -- 13 digits
        "QD", -- 16 digits
        "QT", -- 19 digits
        "SXT", -- 22 digits
        "SEPT", -- 25 digits
        "OCT", -- 28 digits
        "NON", -- 31 digits
        "DEC", -- 34 digits
        "UDEC", -- 37 digits
        "DDEC", -- 40 digits
    }
    if x < 1000 then 
        return tostring(x)
    end

    local digits = math.floor(math.log10(x)) + 1
    local index = math.min(#abbreviations, math.floor((digits - 1) / 3))
    local front = x / math.pow(10, index * 3)

    return string.format("%i%s", front, abbreviations[index])
end

function GetAllMeleeNew()
    combat = 0
    BuyDragonTalon = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true))
    if BuyDragonTalon then
        if BuyDragonTalon == 1 then
            combat = combat + 1
        end
    end
    BuySuperhuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman",true))
    if BuySuperhuman then
        if BuySuperhuman == 1 then
            combat = combat + 1
        end
    end
    BuySharkmanKarate = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true))
    if BuySharkmanKarate then
        if BuySharkmanKarate == 1 then
            combat = combat + 1
        end
    end
    BuyDeathStep = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep",true))
    if BuyDeathStep then
        if BuyDeathStep == 1 then
            combat = combat + 1
        end
    end
    BuyElectricClaw = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true))
    if BuyElectricClaw then
        if BuyElectricClaw == 1 then
            combat = combat + 1
        end
    end
    GodHuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true))
    if GodHuman then
        if GodHuman == 1 then
            combat = combat + 1
        end
    end
    return combat
end

function GetNewAwake()
    local AwakeText = '❌'
    pcall(function ()
        local player = game.Players.LocalPlayer

        if player.Data.DevilFruit.Value == '' then
            return AwakeText
        end
        for _, tool in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if tool:IsA("Tool") and tool.ToolTip == "Blox Fruit" then
                local awakenedMoves = tool:FindFirstChild("AwakenedMoves")
                if awakenedMoves then
                    local moveList = {"Z", "X", "C", "V", "F", "TAP"}
                    local awakenedText = ""

                    for _, moveName in ipairs(moveList) do
                        if awakenedMoves:FindFirstChild(moveName) then
                            awakenedText = awakenedText .. moveName .. " "
                        end
                    end

                    if awakenedText ~= "" then
                        AwakeText = awakenedText:sub(1, -2)
                    end
                end
                break
            end
        end
    end)
    return AwakeText
end

print("Welcome to ZDVxEMU: Script Logs 1.0.1")

function GetGOD()
    CombatText = ''
    GodHuman = tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman",true))
    if GodHuman then
        if GodHuman == 1 then
            CombatText = ' | GOD'
        end
    else
        CombatText = ''
    end
    return CombatText
end

function CheckMirrorFractalNew()
    MirrorFac_Text = false
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if type(v) == "table" then
            if v.Type == "Material" then
                if v.Name == "Mirror Fractal" then
                    MirrorFac_Text = true
                end
            end
        end
    end
    return MirrorFac_Text
end

print("Loading Function: 1")

function GetFruitInU()
    local ReturnText = {}
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
        if type(v) == "table" then
            if v ~= nil then
                if v.Price >= 1000000 then
                    table.insert(ReturnText,string.split(v.Name,"-")[2])
                end
            end
        end
    end

    if #ReturnText ~= 0 then
        return table.concat(ReturnText,", ")
    else
        return "❌"
    end
end

function CheckLevel()
    RaceText = ''
    if game:GetService("Players").LocalPlayer.Data.Level.Value < 2550 then
        RaceText = 'Lv. '..game:GetService("Players").LocalPlayer.Data.Level.Value.." "
    else
        RaceText = 'Lv.2550 [ MAX ] '
    end
    return RaceText
end

print("Loading Function: 2")

local function CheckSGTNew()
    SGT_Text = ''
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
        for i1,v1 in pairs(v) do
            if v1 == 'Soul Guitar' then
                SGT_Text = ' | SG'
            end
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Soul Guitar') or game:GetService("Players").LocalPlayer.Character:FindFirstChild('Soul Guitar') then
                SGT_Text = ' | SG'
            end
        end
    end
    return SGT_Text
end

local function CheckCDKNew()
    CDK_Text = ''
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
        for i1,v1 in pairs(v) do
            if v1 == 'Cursed Dual Katana' then
                CDK_Text = ' | CDK'
            end
        end
    end
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Cursed Dual Katana') or game:GetService("Players").LocalPlayer.Character:FindFirstChild('Cursed Dual Katana') then
        CDK_Text = ' | CDK'
    end
    return CDK_Text
end

local function GetDarkFragment()
    FragmentCount = 0
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")) do
        if type(v) == "table" then
            if v.Type == "Material" then
                if v.Name == "Dark Fragment" then
                    FragmentCount = v.Count
                end
            end
        end
    end
    return FragmentCount
end

local function CheckRaceV()
	ReturnText = '1'
	if game.Players.LocalPlayer.Backpack:FindFirstChild("Awakening") or game.Players.LocalPlayer.Character:FindFirstChild("Awakening") then
		ReturnText = '4'
	elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Wenlocktoad","1") == -2 then
		ReturnText = '3'
	elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3") == -2 then
		ReturnText = '2'
	end
	return ReturnText
end

local function GetRaceTier()
    Tire = ""
    if CheckRaceV() == "4" then
        for i, v in pairs(game:GetService("Players").LocalPlayer.Data.Race:GetChildren()) do
            if v.Name == "C" then
                Tire = ":"..v.Value
            end
        end
    end
    return Tire
end

local function CheckVK()
    VK_Text = false
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryWeapons")) do -- เช็คในกระเป๋า
        for i1,v1 in pairs(v) do
            if v1 == 'Valkyrie Helm' then
                VK_Text = true
            end
        end
    end
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild('Valkyrie Helm') or game:GetService("Players").LocalPlayer.Character:FindFirstChild('Valkyrie Helm') then
        VK_Text = true
    end
    return VK_Text
end

local function getFruit()
    text = ""
    if game.Players.LocalPlayer.Data.DevilFruit.Value == '' then
        text = "❌"
    else
        text = string.split(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value,"-")[2].." ["..game:GetService("Players").LocalPlayer.Backpack[game.Players.LocalPlayer.Data.DevilFruit.Value].Level.Value.."]"
    end
    return text
end

print("Loading Function: 3")

task.spawn(function()
    while true do
            local jsonData = '{"api_key":"'..apikey..'","data":{"active":"true","lastupdate":"true","username":"'..getgenv().Local(1)..'","info":"'..CheckLevel()..''..GetGOD()..CheckCDKNew()..CheckSGTNew()..'","fruit":"'..getFruit()..'","awakenskill":"'..GetNewAwake()..'","allfightingstyles":"'..GetAllMeleeNew()..'","race":"'..game:GetService("Players").LocalPlayer.Data.Race.Value..' ['..CheckRaceV()..GetRaceTier()..']'..'","mirror":"'..CheckMirrorFractalNew()..'","valkyrie":"'..CheckVK()..'","darkfragment":"'..GetDarkFragment()..'","materialinv":"DarkFragment ['..GetDarkFragment()..']'..'","beli":"'..Abbreviate(game.Players.LocalPlayer.Data.Beli.Value)..'","fragment":"'..Abbreviate(game.Players.LocalPlayer.Data.Fragments.Value)..'","fruitinv":"'..GetFruitInU()..'"}}'
            print(jsonData)
            Added(jsonData)
        
            Update(jsonData)
        wait(2)
    end;
end);
