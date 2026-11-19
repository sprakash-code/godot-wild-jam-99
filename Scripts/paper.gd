extends Area2D
class_name Paper

@export var rotate_step := 15.0
@export var translucency := 0.65

var held := false
var grab_offset := Vector2.ZERO

func pick_up() -> void:
	held = true
	grab_offset = global_position - get_global_mouse_position()
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(1.05,1.05), 0.08)
	
func put_down() -> void:
	held = false
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2.ONE, 0.08)
	
func rotate_by(deg: float) -> void:
	rotation_degrees += deg

func _ready() -> void:
	add_to_group("sheets")
	$Sprite2D.self_modulate.a = translucency

func contains_mouse() -> bool:
	var spr := $Sprite2D
	return spr.get_rect().has_point(spr.to_local(get_global_mouse_position()))

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and held:
		global_position = get_global_mouse_position() + grab_offset
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and contains_mouse():
			pick_up()
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed and held:
			put_down()
		elif event.pressed and event.button_index == MOUSE_BUTTON_WHEEL_UP and held:
			rotate_by(rotate_step)
		elif event.pressed and event.button_index == MOUSE_BUTTON_WHEEL_DOWN and held:
			rotate_by(-rotate_step)
	elif event.is_action_pressed('rotate_right') and held:
		rotate_by(rotate_step)
	elif event.is_action_pressed('rotate_left') and held:
		rotate_by(-rotate_step)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
