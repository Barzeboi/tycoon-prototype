extends StatsandSales

func _ready() -> void:
	event_call.stats_call.connect(_stats_addition)

func _stats_addition(stats:ComponentStats):
	print("stats!")
	print(stats.weight)
	base_weight += stats.weight
	accum_quality += stats.quality_max
	accum_efficiency += stats.efficiency
	power += stats.power
	base_accum_maneuverability += stats.maneuverability
	load_capacity += stats.load_capacity
	base_transport_speed += stats.transport_speed
	thrust += stats.thrust
	accum_comfort += stats.comfort
	attack += stats.attack
	defense += stats.defense
	shielding += stats.defense
	hyper_fuel += stats.hyper_fuel
	
	if stats.efficiency > 0.0:
		eff_count += 1
	if stats.maneuverability > 0.0:
		man_count += 1
	if stats.comfort > 0.0:
		com_count += 1
		
	print("sales_score: " + str(sales_score))
	_stats_modifiers()
		
func _stats_modifiers():
	count += 1
	
	
	efficiency = (accum_efficiency / eff_count)
	base_comfort = (accum_comfort / com_count)
	
	weight = base_weight + (load_capacity * 0.25) + (hyper_fuel * 0.4)
	accum_maneuverability = base_accum_maneuverability - (weight * 0.15)
	speed = (thrust / (weight * 0.01)) * (efficiency/100)
	comfort = (base_comfort * (quality)) - (load_capacity)

	maneuverability = (accum_maneuverability / man_count)
	
	print("speed: " + str(speed))
	print(str(accum_efficiency) + "/" + str(eff_count))
	
	_stats_send()
