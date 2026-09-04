extends ShipComponent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	event_call.stats_call.emit(component_stats)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
