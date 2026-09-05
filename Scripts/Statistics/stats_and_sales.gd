extends Node
class_name StatsandSales

enum BuyerDemographics
{
	TRANSPORTERS,
	ESCORTS,
	MERCHANTS,
	PIRATE_HUNTERS,
	LUXURY_TRANSPORTERS,
	MERCENARIES,
	BULK_TRADERS,
	WORLD_SHIP_DWELLERS
}

var sales: Array = []

var preferred_demographic: BuyerDemographics = BuyerDemographics.TRANSPORTERS
var expected_price: int
var weight_importance: int
var attack_importance: int
var defense_importance: int
var maneuverability_importance: int
var load_cap_importance: int
var transport_speed_importance: int
var comfort_importance: int
var shield_importance: int
var fuel_importance: int

var sales_score: float
var total_sales_score: float
var marketing: float
var price: int
var sales_amount

var base_transport_speed: float
var base_comfort: float
var base_weight: float
var base_accum_maneuverability: float

var weight: float
var accum_quality: float
var quality: float
var accum_efficiency: float
var efficiency: float = 0.0
var power: float
var accum_maneuverability: float
var thrust: float
var speed: float
var maneuverability: float
var load_capacity: float
var transport_speed: float = 0.0
var accum_comfort: float
var comfort: float
var attack: float
var defense: float
var shielding: float
var hyper_fuel: float

var weight_max: float = 100000.0
var quality_max: float = 100.0
var efficiency_max: float = 100.0
var power_max: float = 10000000.0
var maneuverability_max: float = 100.0
var load_cap_max: float = 50000
var speed_max: float = 500000
var comfort_max: float = 100
var attack_max: float = 100
var defense_max: float = 100
var hyper_fuel_max: int = 20

var previous_stats: Array[Variant]

var count: int
var eff_count: int
var man_count: int
var com_count: int

func _ready() -> void:
	_stats_send()

func _stats_send() -> void:
	event_call.stats_send.emit(self)
