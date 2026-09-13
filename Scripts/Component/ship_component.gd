extends Node2D
class_name ShipComponent

@export var component_stats: ComponentStats

func _ready() -> void:
	event_call.destroy.connect(_destroy)
	$Sprite2D.modulate = modulate
	
func _destroy() -> void:
	queue_free()
	print("boom")
