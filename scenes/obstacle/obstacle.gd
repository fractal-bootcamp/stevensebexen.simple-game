extends Area2D

@export var velocity_dir: Vector2
@export var velocity_coeff = 500
@export var lifetime = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity_dir * delta * velocity_coeff
	lifetime -= delta
	if lifetime <= 0:
		queue_free()
