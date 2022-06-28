-- modified version of https://github.com/Joelrau/S1x-IW6x-g_log-script (permission to use by author)

if (game:getdvar("gamemode") ~= "mp") then
    return
end

-- function player_damage(self_, inflictor, attacker, damage, dflags, mod, weapon, vPoint, vDir, hitLoc)
--     self_:println("s")
-- end

level:onnotify("player_spawned", function(player)
    setSnip(player)
end)

-- level:onnotify("changed_class",function(player) 
--     player:clientiprintln(player.name)
-- end)
-- make sure this function invokes to the original if you're not modifying anything - you want the original logic to still run
local change_class = nil


function setSnip(player)
    player:unsetperk("specialty_pistoldeath" , true)
    player:unsetperk("specialty_grenadepulldeath" , true)
    player:unsetperk("specialty_armorvest" , true)
    change_class = game:detour("maps/mp/gametypes/_menus", "_id_5BB2", function(self_, var0)
        -- change class event here!
        change_class.invoke(self_, var0)
        setSnip(self_)
    end)
    if player:getcurrentweapon() ~= "h1_m40a3_mp_a#none_f#base" then
        player:takeallweapons()
        player:giveweapon("h1_m40a3_mp_a#none_f#base")
        player:giveweapon("h1_m40a3_mp_a#acog_f#base")
        game:ontimeout(function()
        player:switchtoweapon("h1_m40a3_mp_a#none_f#base")
        end, 100)
      end
end
-- init()
