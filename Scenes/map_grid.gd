extends GridContainer


@onready var parchment_lighter: Sprite2D = $parchment_lighter


func _ready() -> void:
	GLOBAL.on_lighter_activated.connect(toggle_lighter_state)

func toggle_lighter_state(is_active: bool):
	parchment_lighter.visible = is_active
