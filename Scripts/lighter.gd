class_name lighter
extends Sprite2D

var scale_normal := Vector2(0.25, 0.25)
var scale_active := Vector2(0.30, 0.30)

var color_normal := Color.WHITE
var color_active := Color(0.324, 0.951, 0.36, 1.0)

var is_active := false


func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _on_button_toggled(toggled_on: bool) -> void:
	is_active = toggled_on
	GLOBAL.on_lighter_activated.emit(is_active)
	
	if is_active:
		self_modulate = color_active
		scale = scale_active
	else:
		self_modulate = color_normal
		scale = scale_normal
