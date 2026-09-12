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

static var market_array: Array = []

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

static var sales_score: float
static var total_sales_score: float
static var marketing: float
static var price: int
static var sales_amount
static var ship_name: String

static var base_transport_speed: float
static var base_comfort: float
static var base_weight: float
static var base_accum_maneuverability: float

static var weight: float
static var accum_quality: float
static var quality: float
static var accum_efficiency: float
static var efficiency: float = 0.0
static var power: float
static var accum_maneuverability: float
static var thrust: float
static var speed: float
static var maneuverability: float
static var load_capacity: float
static var transport_speed: float = 0.0
static var accum_comfort: float
static var comfort: float
static var attack: float
static var defense: float
static var shielding: float
static var hyper_fuel: float

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
	sales_score = 0.0

func _stats_send() -> void:
	event_call.stats_send.emit(self)
	
