extends CanvasLayer


@onready var date: Label = $BottomUIBar/HBoxContainer/VBoxContainer/Date
@onready var date_pb: ProgressBar = $BottomUIBar/HBoxContainer/VBoxContainer/DatePB

var current_time_string = "%s/%s"

func _ready() -> void:
	WorldState.tick.connect(_tick)
	
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	date_pb.value = WorldState.time_progress

func _tick() -> void:
	date.text = current_time_string % ["%0*d" % [2, WorldState.month], WorldState.year]

func _on_pause_button_pressed() -> void:
	WorldState.time_speed = 0

func _on_1x_button_pressed() -> void:
	WorldState.time_speed = 1

func _on_2x_button_pressed() -> void:
	WorldState.time_speed = 2

func _on_5x_button_pressed() -> void:
	WorldState.time_speed = 5

func _on_build_button_pressed() -> void:
	owner._open_build_menu()
	WorldState.time_speed = 0
