extends Button

@export var component: Component = Component.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = component.name
	icon = component.visual


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	event_call.pressed.emit(component)
