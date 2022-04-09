script.on_event(defines.events.on_player_created, function(event)
	--Check for sandbox mode... or any mode without a player body.
	local player = game.players[event.player_index]
	local player_chara = player.character or player.cutscene_character
	if not player_chara then
		return
	end
	
	genarmor(player, player_chara)
end)

script.on_init(function(event)
	if settings.startup["TinyStart-init-spawn"].value then
		for _,player in pairs(game.players) do
			local player_chara = player.character or player.cutscene_character
			if player_chara then
				genarmor(player, player_chara)
			end
		end
	end
end)

script.on_event(defines.events.on_pre_player_crafted_item, function(event)
	-- if not event.items or not event.items.valid then return end --Legacy from 0.18.11 bug. Leaving this for reference for now.
	local armor = event.items.find_item_stack("tiny-armor-mk0") or event.items.find_item_stack("tiny-armor-mk1")
	if armor then
		local player = game.players[event.player_index]
		local player_chara = player.character or player.cutscene_character
		local playermaininv = player_chara.get_inventory(defines.inventory.character_main)
		local gridinventory = armor.grid.take_all()
		for gear, cnt in pairs(gridinventory) do
			local inserted = 0
			if playermaininv.can_insert({name=gear, count=cnt}) then
				inserted = playermaininv.insert({name=gear, count=cnt})
			end
			if inserted < cnt then
				--player.print("WARNING: Inventory full.")
				player.surface.spill_item_stack(player.position,{name=gear, count=cnt-inserted})
			end
		end
	end
end)


function genarmor(player, chara)
	local config_roboport_type = fif(settings.get_player_settings(player)["TinyStart-roboport-type"].value == "Basic", true, false)
	local config_marathon_start = settings.startup["TinyStart-marathon-start"].value
	
	-- Since we now have the option to have armor added after map start/player creation
	-- we have to make sure something isn't already there.
	chara.get_inventory(defines.inventory.character_armor).clear()
	-- Create armor and add grid equipment
	chara.insert{name="tiny-armor-mk0", count = 1}
	addgear(player, chara.get_inventory(defines.inventory.character_armor)[1].grid)
	
	local robocount
	
	if config_roboport_type then
		robocount = 20
	else
		robocount = 50
	end
	
	--DyWorld compatibility block
	local robotname
	if script.active_mods["DyWorld"] then
		robotname = "nickel-construction-robot"
	else
		robotname = "construction-robot"
	end
	
	-- Provide construction robots.
	if chara.get_inventory(defines.inventory.character_main).can_insert({name=robotname, count = robocount}) then
		chara.insert{name=robotname, count = robocount}
	end
	
	-- Marathon mode extra resources
	-- I have kind of mixed thoughts about this...
	-- will including this even as an option make the mod less appealing to some?
	-- But it is easier to have a setting than maintaining two variations in parallel...
	if config_marathon_start then
		chara.insert{name="stone-furnace", count = 24} --enough for half of a 24 smelter block, for copper and iron each
		chara.insert{name="electric-mining-drill", count = 24}
		chara.insert{name="steam-engine", count = 6}
		chara.insert{name="boiler", count = 3}
		chara.insert{name="small-electric-pole", count = 50}
		chara.insert{name="transport-belt", count = 300}
		chara.insert{name="offshore-pump", count = 1}
		chara.insert{name="pipe-to-ground", count = 6}
		chara.insert{name="pipe", count = 10}
		chara.insert{name="inserter", count = 57}	--48 (furnaces) + 3 (boilers) + 6 (starter red science facility)
		--enough to get automation, even on high science multiplier settings.
		chara.insert{name="automation-science-pack", count = 10 * game.difficulty_settings.technology_price_multiplier} 
		chara.insert{name="lab", count = 2}
	end
end

function addgear(player, grid)
	local config_fusion = fif(settings.get_player_settings(player)["TinyStart-fusion-solar"].value == "Fusion", true, false)
	local config_shield = settings.get_player_settings(player)["TinyStart-shield"].value
	local config_battery = fif(settings.get_player_settings(player)["TinyStart-battery"].value == "Battery", true, false)
	local config_charged = settings.get_player_settings(player)["TinyStart-spawn-charged"].value
	local config_roboport_type = fif(settings.get_player_settings(player)["TinyStart-roboport-type"].value == "Basic", true, false) 

	if config_fusion then
		grid.put({name = "micro-fusion-reactor-equipment"})
	else
		-- unlike most Lua stuff that starts counting from one, the equipment
		-- grid starts counting from 0. 0,0 is the top left slot.
		grid.put({name = "solar-panel-equipment", position = {0,0}})
		grid.put({name = "solar-panel-equipment", position = {0,1}})
		grid.put({name = "solar-panel-equipment", position = {1,0}})
		grid.put({name = "solar-panel-equipment", position = {1,1}})
	end
	if config_shield == "Fusion" then
		grid.put({name = "micro-fusion-reactor-equipment"})
	elseif config_shield == "Shield" then
		grid.put({name = "energy-shield-equipment"})
	elseif config_shield == "Solar" then
		grid.put({name = "solar-panel-equipment", position = {2,0}})
		grid.put({name = "solar-panel-equipment", position = {2,1}})
		grid.put({name = "solar-panel-equipment", position = {3,0}})
		grid.put({name = "solar-panel-equipment", position = {3,1}})
	else
		grid.put({name = "battery-mk2-equipment"})
		grid.put({name = "battery-mk2-equipment"})
	end
	if config_battery then
		grid.put({name = "battery-mk2-equipment"})
	else
		grid.put({name = "solar-panel-equipment", position = {4,0}})
		grid.put({name = "solar-panel-equipment", position = {4,1}})
	end
	grid.put({name = "battery-mk2-equipment", position = {4,2}})
	if config_roboport_type then
		grid.put({name = "personal-roboport-equipment"})
		grid.put({name = "personal-roboport-equipment"})
	else
		grid.put({name = "personal-roboport-mk2-equipment"})
		grid.put({name = "personal-roboport-mk2-equipment"})
	end
	
	-- charge equipment
	if config_charged then 
		for _, equipment in ipairs(grid.equipment) do
			if equipment.max_shield > 0 then
				equipment.shield = equipment.max_shield
			elseif equipment.max_energy > 0 then
				equipment.energy = equipment.max_energy
			end
		end
	end
end

function fif(condition, if_true, if_false)
  if condition then return if_true else return if_false end
end