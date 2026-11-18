class_name slot
extends Panel

#@onready var sprite: Sprite2D = $Sprite2D
@onready var button: Button = $Button

var color_highlight := Color(0.49803922, 1, 0.83137256, 0.5)
var color_normal := Color(1.0, 1.0, 1.0, 0.2)


func _ready() -> void:
	button.self_modulate = color_normal
	pass

#region input handlers

func _on_button_button_up() -> void:
	var grid = get_parent() as GridContainer
	print("column: ", (get_index() % grid.columns) + 1)
	#print(gridContainer.columns/get_index())
	pass

func _on_button_mouse_entered() -> void:
	button.self_modulate = color_highlight

func _on_button_mouse_exited() -> void:
	button.self_modulate = color_normal

#endregion input handlers
