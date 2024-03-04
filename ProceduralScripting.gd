extends TileMap

var agentPos = Vector2(0,0)
var gridAround = []

var itr = 0
var maxIterations = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	generate_random()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func generate_random():
	while itr < maxIterations:
		var randomRoom = randi_range(0,1)
		set_cell(0, agentPos, 0, Vector2(randomRoom,0))
		gridAround = [Vector2(agentPos.x - 1, agentPos.y), Vector2(agentPos.x + 1, agentPos.y), 
			Vector2(agentPos.x, agentPos.y - 1), Vector2(agentPos.x, agentPos.y + 1)]
		
		var randomCell = randi_range(0,3)
		if get_cell_atlas_coords(0, gridAround[randomCell], false) == Vector2i(-1,-1):
			agentPos = gridAround[randomCell]
			itr += 1
		
		
