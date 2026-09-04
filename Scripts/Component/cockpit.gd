extends ShipComponent


func _ready() -> void:
	event_call.stats_call.emit(component_stats)
	print("Go!")
