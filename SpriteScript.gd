extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(640,360)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_label_pressed(KEY_W):
		position.y -= 300 * delta
	if Input.is_key_label_pressed(KEY_A):
		position.x -= 300 * delta
	if Input.is_key_label_pressed(KEY_S):
		position.y += 300 * delta
	if Input.is_key_label_pressed(KEY_D):
		position.x += 300 * delta
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position.y -= 300 * delta


