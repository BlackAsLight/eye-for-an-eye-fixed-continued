--EYE FOR AN EYE CONTROL.lua

script.on_event(defines.events.on_entity_died, function(event)
	if event.entity.force == game.forces.enemy then
		game.forces["enemy"].evolution_factor = game.forces["enemy"].evolution_factor - 0.000001
	end
end)

script.on_event(defines.events.on_entity_damaged, function(event)
	local damage_modifier = 0.2
	local target = event.entity
	local attacker = event.cause
	local damage_amount = event.original_damage_amount
	local damage_type = event.damage_type

	if attacker and target.force == game.forces['player'] and attacker.force == game.forces.enemy and attacker.is_entity_with_health then
		attacker.damage(damage_amount*damage_modifier,target.force,'electric')
	end
end)
