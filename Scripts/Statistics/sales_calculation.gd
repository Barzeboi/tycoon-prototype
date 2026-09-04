extends StatsandSales


var sales_array: Array = []

func _get_buyer_demographics():
	match preferred_demographic:
		BuyerDemographics.TRANSPORTERS:
			expected_price = 110000
			weight_importance = 90
			attack_importance = 5
			defense_importance = 30
			maneuverability_importance = 80
			load_cap_importance = 25
			transport_speed_importance = 70
			comfort_importance = 60
			shield_importance = 40
			fuel_importance = 50
		BuyerDemographics.ESCORTS:
			expected_price = 145000
			weight_importance = 80
			attack_importance = 55
			defense_importance = 10
			maneuverability_importance = 90
			load_cap_importance = 10
			transport_speed_importance = 60
			comfort_importance = 20
			shield_importance = 80
			fuel_importance = 45
		BuyerDemographics.MERCHANTS:
			expected_price = 195000
			weight_importance = 25
			attack_importance = 5
			defense_importance = 50
			maneuverability_importance = 40
			load_cap_importance = 70
			transport_speed_importance = 30
			comfort_importance = 20
			shield_importance = 70
			fuel_importance = 80
		BuyerDemographics.PIRATE_HUNTERS:
			expected_price = 320000
			weight_importance = 75
			attack_importance = 80
			defense_importance = 30
			maneuverability_importance = 40
			load_cap_importance = 70
			transport_speed_importance = 55
			comfort_importance = 35
			shield_importance = 45
			fuel_importance = 55
		BuyerDemographics.LUXURY_TRANSPORTERS:
			expected_price = 630000
			weight_importance = 100
			attack_importance = 5
			defense_importance = 25
			maneuverability_importance = 60
			load_cap_importance = 20
			transport_speed_importance = 85
			comfort_importance = 100
			shield_importance = 30
			fuel_importance = 65
		BuyerDemographics.MERCENARIES:
			expected_price = 580000
			weight_importance = 30
			attack_importance = 100
			defense_importance = 45
			maneuverability_importance = 45
			load_cap_importance = 20
			transport_speed_importance = 60
			comfort_importance = 15
			shield_importance = 90
			fuel_importance = 60
		BuyerDemographics.BULK_TRADERS:
			expected_price = 855000
			weight_importance = 10
			attack_importance = 20
			defense_importance = 65
			maneuverability_importance = 5
			load_cap_importance = 100
			transport_speed_importance = 25
			comfort_importance = 5
			shield_importance = 60
			fuel_importance = 95
		BuyerDemographics.WORLD_SHIP_DWELLERS:
			expected_price = 21000000
			weight_importance = 0
			attack_importance = 50
			defense_importance = 100
			maneuverability_importance = 5
			load_cap_importance = 100
			transport_speed_importance = 5
			comfort_importance = 75
			shield_importance = 100
			fuel_importance = 90
			
func _sales_calculations(stats) -> void:
	sales_score += (weight * (1+ weight_importance))
	sales_score += (attack * (1+ attack_importance))
	sales_score += (defense * (1 + defense_importance))
	sales_score += (maneuverability * (1 + maneuverability_importance))
	sales_score += (load_capacity * (1 + load_cap_importance))
	sales_score += (transport_speed * (1 + transport_speed_importance))
	sales_score += (comfort * (1 + comfort_importance))
	sales_score += (shielding * (1 + shield_importance))
	sales_score += (hyper_fuel * (1 + fuel_importance))
	
	sales_score *= price * .25
	print("sales!")

func _demographic_changed() -> void:
	_get_buyer_demographics()
