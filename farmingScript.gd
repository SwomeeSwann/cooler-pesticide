extends TileMap


@onready var parentNode = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and get_parent() == parentNode:
			var tilePos = local_to_map(event.position)
			if 0 < tilePos.y and tilePos.y < 13:
				set_cell(0, tilePos, 1, Vector2(0,0))
