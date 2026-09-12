extends Node2D
class_name ShipComponent

@export var component_stats: ComponentStats

func _ready() -> void:
	$Sprite2D.modulate = modulate
