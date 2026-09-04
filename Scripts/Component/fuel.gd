extends ShipComponent


func _ready():
	event_call.stats_call.emit(component_stats)
