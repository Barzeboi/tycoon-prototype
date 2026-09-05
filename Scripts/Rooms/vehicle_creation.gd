extends CanvasLayer


var placer: Sprite2D
var placer_active: bool = false
var components: Dictionary = {"Cockpit 1": 1,"Cargo 1": 2, "Fuel 1": 3, "Rocket 1": 4 }
var current_component: int
var component_instance: PackedScene
var component_cost: int
var is_placeable: bool = false
var placing_position: Vector2
var cockpit_marker: Vector2
@onready var w_pb: ProgressBar = $StatsDisplay/HBoxContainer/VBoxContainer/Weight/W_PB
@onready var lc_pb: ProgressBar = $StatsDisplay/HBoxContainer/VBoxContainer/LoadCap/LC_PB
@onready var hf_pb: ProgressBar = $StatsDisplay/HBoxContainer/VBoxContainer/Hyperfuel/HF_PB
@onready var s_pb: ProgressBar = $StatsDisplay/HBoxContainer/VBoxContainer/Speed/S_PB
@onready var po_pb: ProgressBar = $StatsDisplay/HBoxContainer/VBoxContainer/Power/PO_PB
@onready var m_pb: ProgressBar = $StatsDisplay/HBoxContainer/VBoxContainer/Maneuver/M_PB
@onready var e_pb: ProgressBar = $StatsDisplay/HBoxContainer/VBoxContainer/Efficiency/E_PB
@onready var c_pb: ProgressBar = $StatsDisplay/HBoxContainer/VBoxContainer/Comfort/C_PB

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	event_call.pressed.connect(_component_button_pressed)
	event_call.placement.connect(_place_component)
	event_call.stats_send.connect(_stats_display)
	event_call.stats_send.connect(_set_display_max)
	cockpit_marker = $Marker2D.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	if is_instance_valid(placer):
		placer.position = mouse_pos
	
func _component_button_pressed(component:Component) -> void:
	if is_instance_valid(placer):
		_delete_placement_visualizer()
	for i: String in components:
		if component.id == components[i]:
			current_component = components[i]
			component_instance = component.scene
			component_cost = component.price
			print(component_instance)
			_create_placement_visualizer(component.visual)
		else:
			print(str(components[i]) + ": false")
	if current_component == 1:
		is_placeable = true
		_place_component(component_instance, is_placeable, cockpit_marker)
		is_placeable = false
		_delete_placement_visualizer()

func _unhandled_input(event: InputEvent) -> void:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
				if placer_active and is_placeable == true:
					_place_component(component_instance,is_placeable, placing_position)
				else:
					printerr("placer_active " + str(placer_active))
					printerr("is_placeable " + str(is_placeable))
	
func _create_placement_visualizer(visual: CompressedTexture2D) -> void:
	placer = Sprite2D.new()
	add_child(placer)
	placer.texture = visual
	placer.modulate.a = .525
	placer_active = true

func _delete_placement_visualizer() -> void:
	placer.free()

func _place_component(comp_inst: PackedScene, plce: bool, comp_position: Vector2) -> void:
	is_placeable = plce
	placing_position = comp_position
	if is_instance_valid(comp_inst) and is_placeable == true:
		var place = comp_inst.instantiate()
		place.global_position = comp_position
		add_child(place)
		print("place")
		is_placeable = false


func _stats_display(stats:StatsandSales) -> void:
	w_pb.value = stats.base_weight
	lc_pb.value = stats.load_capacity
	hf_pb.value = stats.hyper_fuel
	s_pb.value = stats.speed
	po_pb.value = stats.power
	m_pb.value = stats.maneuverability
	e_pb.value = stats.efficiency
	c_pb.value = stats.comfort

func _set_display_max(stats:StatsandSales) -> void:
	w_pb.max_value = stats.weight_max
	lc_pb.max_value = stats.load_cap_max
	hf_pb.max_value = stats.hyper_fuel_max
	s_pb.max_value = stats.speed_max
	po_pb.max_value = stats.power_max
	m_pb.max_value = stats.maneuverability_max
	e_pb.max_value = stats.efficiency_max
	c_pb.max_value = stats.comfort_max


func _on_to_market_button_pressed() -> void:
	$Confirmation.show()
	$TabContainer.hide()
	event_call.sales_entry.emit()
	


func _on_done_button_pressed() -> void:
	pass # Replace with function body.
