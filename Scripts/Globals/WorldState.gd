extends Node

signal tick

var month: int = 1
var year: int = 2240
var time_progress: int
var time_speed: int = 1
var world_economy: int
var part_inflation: int
var starting_customer_base: int = 25000
var customer_base: int

func _ready() -> void:
	tick.connect(_tick)
	
func _process(delta: float) -> void:
	if time_progress >= 1000:
		tick.emit()

func _physics_process(delta: float) -> void:
	time_progress += time_speed

func _tick() -> void:
	month += 1
	time_progress = 0
	if month == 13:
		year += 1
		month = 1
		_year_tick()
	
func _year_tick() -> void:
	pass
