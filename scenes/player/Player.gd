extends Node2D

@export var moveSpeed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	const ACTIONS = {
		"move_up": Vector2(0, -1),
		"move_right": Vector2(1, 0),
		"move_down": Vector2(0, 1),
		"move_left": Vector2(-1, 0)
	}

	for action in ACTIONS:
		if Input.is_action_pressed(action):
			position += ACTIONS[action] * moveSpeed * delta
