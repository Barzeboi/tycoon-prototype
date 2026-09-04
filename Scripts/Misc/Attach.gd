extends Area2D


@export var collision_distance: float
var collision_array: Array[Array]
var marker: Variant
var marker_position: Vector2

func _ready() -> void:
	event_call.clear_call.connect(_clear_marker)

func _on_mouse_entered() -> void:
	var mouse_pos: Vector2 = get_global_mouse_position()
	for child in get_children():
		collision_distance = child.global_position.distance_to(mouse_pos)
		collision_array.append([child, collision_distance])
	collision_array.sort_custom(func(a,b): return a[1] < b[1])
	marker = collision_array[0][0]
	marker_position = collision_array[0][0].global_position
	event_call.placement.emit(null, true, marker_position)
	
	print(true)

func _on_mouse_exited() -> void:
	event_call.placement.emit(null, false, global_position)
	collision_array.clear()
	print(false)
	
func _clear_marker()-> void:
	if marker == null:
		return
	else:
		marker.get_child(0, false).visible = false
