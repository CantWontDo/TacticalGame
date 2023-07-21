extends Camera2D

func _ready():
	global_position = GameGrid.calculate_map_position(Vector2.ONE);
func _physics_process(delta):
	var input : Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down");
	
	position += input * 10.0;
	
	if Input.is_action_just_released("scrolldown"):
		zoom /= 2;
	if Input.is_action_just_released("scrollup"):
		zoom *= 2;
	
	if Input.is_action_pressed("ui_left"):
		rotation += 1;
