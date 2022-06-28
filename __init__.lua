-- Made by sul6an#3330 thanks for h1-dev and h1 community for help
if (game:getdvar("gamemode") ~= "mp") then
    return
end

level:onnotify("player_spawned", function(player)
    setSnip(player)
    removePerks(player)
    player:clientiprintlnbold("Welcome ^:"..player.name.. " ^7to Snip Mod")
end)

function removePerks(player)
    player:unsetperk("specialty_pistoldeath" , false)
    player:unsetperk("specialty_grenadepulldeath" , false)
    player:unsetperk("specialty_armorvest" , false)    
end
function randomCamo()
     camos = {"camo010","camo011","camo012","camo013","camo014"}
     return camos[math.random( 0, 4 )]
end

function setSnip(player)
    local change_class = nil
    
    change_class = game:detour("maps/mp/gametypes/_menus", "_id_5BB2", function(self_, var0)
        -- change class event here!
        change_class.invoke(self_, var0)
        -- if player:getcurrentweapon() ~= "h1_m40a3_mp_a#none_f#base" then
        applySnip(player)
    end)
    applySnip(player)
end

function applySnip(player)
    currCamo = tostring(randomCamo())
    game:ontimeout(function()
        player:takeallweapons()
        removePerks(player)
        player:giveweapon("h1_m40a3_mp_a#none_f#base_"..currCamo.."")
        player:giveweapon("h1_m40a3_mp_a#acog_f#base_"..currCamo.."")
        player:clientiprintln("not ^1allowed "..currCamo.."")
        
        player:switchtoweapon("h1_m40a3_mp_a#none_f#base_"..currCamo.."")
        end, 500)
end
-- init()
