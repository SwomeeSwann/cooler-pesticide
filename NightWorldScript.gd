extends Node2D


@onready var floorTile = get_node("/root/Night/TileGen")
@onready var player = get_node("/root/Night/Player")

var pathMaker = Vector2(-3,0)
var trackCell = Vector2()


var borders = Rect2(1, 1, 38, 21)


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_level()
	player.position = Vector2(1560, 920)

func generate_level():
	var walker = Walker.new(Vector2(19, 11), borders)
	var map = walker.walk(500)
	walker.queue_free()
	for location in map:
		floorTile.set_cell(0, location, 0, Vector2i(1,1))
		create_path()
		

func create_path():
	var trackCell = Vector2(pathMaker.x + 1, -5)
	while floorTile.get_cell_atlas_coords(0, trackCell, false) == Vector2i(2, 1):
		pathMaker = trackCell
		trackCell = Vector2(pathMaker.x + 1, -5)
		floorTile.set_cell(0, trackCell, 0, Vector2i(1,1))
		


