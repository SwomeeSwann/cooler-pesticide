extends Sprite2D

@onready var daytime = get_node("/root/Daytime")
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(640,360)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_label_pressed(KEY_W):
		if get_tree().current_scene == daytime:
			if not position.y < 100:
				position.y -= 300 * delta
		else:
			var floorData = get_node("/root/Night/FloorTiles")
			var mapPos = floorData.local_to_map(Vector2(position.x, position.y - 20))
			if not floorData.get_cell_atlas_coords(0, mapPos, false) == Vector2i(2,1):
				position.y -= 300 * delta
	if Input.is_key_label_pressed(KEY_A):
		if get_tree().current_scene == daytime:
				position.x -= 300 * delta
		else:
			var floorData = get_node("/root/Night/FloorTiles")
			var mapPos = floorData.local_to_map(Vector2(position.x - 15, position.y))
			if not floorData.get_cell_atlas_coords(0, mapPos, false) == Vector2i(2,1):
				position.x -= 300 * delta
	if Input.is_key_label_pressed(KEY_S):
		if get_tree().current_scene == daytime:
				position.y += 300 * delta
		else:
			var floorData = get_node("/root/Night/FloorTiles")
			var mapPos = floorData.local_to_map(Vector2(position.x, position.y + 20))
			if not floorData.get_cell_atlas_coords(0, mapPos, false) == Vector2i(2,1):
				position.y += 300 * delta
	if Input.is_key_label_pressed(KEY_D):
		if get_tree().current_scene == daytime:
				position.x += 300 * delta
		else:
			var floorData = get_node("/root/Night/FloorTiles")
			var mapPos = floorData.local_to_map(Vector2(position.x + 15, position.y))
			if not floorData.get_cell_atlas_coords(0, mapPos, false) == Vector2i(2,1):
				position.x += 300 * delta
	

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and not get_parent() == daytime:
		var floorData = get_node("/root/Night/FloorTiles")
		position = floorData.map_to_local(Vector2(100,100))


