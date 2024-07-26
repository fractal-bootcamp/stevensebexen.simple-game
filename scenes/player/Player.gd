extends Node2D

signal obstacle_touched

@export var move_speed = 600

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
			position += ACTIONS[action] * move_speed * delta
			var half_size = $CollisionShape2D.shape.size / 2
			var viewport_size = get_viewport().get_visible_rect().size
			position = position.clamp(half_size, viewport_size - half_size)


func _on_area_entered(area):
	if area.is_in_group('obstacle'):
		obstacle_touched.emit()
