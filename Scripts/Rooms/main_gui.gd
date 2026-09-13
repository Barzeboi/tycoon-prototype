extends CanvasLayer
class_name MainGui



func _open_build_menu():
	$VehicleCreation.visible = true
	$MainRoom.visible = false
	
func _close_build_menu() -> void:
	$VehicleCreation.visible = false
	$MainRoom.visible = true
