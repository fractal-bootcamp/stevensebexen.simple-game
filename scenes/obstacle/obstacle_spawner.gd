extends Node

const SPAWN_INTERVAL = 0.15

var obstacleScene = load("res://scenes/obstacle/obstacle.tscn")
var toNext = SPAWN_INTERVAL

signal obstacle_spawned

func randomPosFromEdge(edge):
	var viewportSize = get_viewport().get_visible_rect().size
	var padding = 50
	
	match edge:
		'top':
			return Vector2(randi_range(-padding, viewportSize[0] + padding), -padding)
		'right':
			return Vector2(viewportSize[0] + padding, randi_range(-padding, viewportSize[1] + padding))
		'bottom':
			return Vector2(randi_range(-padding, viewportSize[0] + padding), viewportSize[1] + padding)
		'left':
			return Vector2(-padding, randi_range(-padding, viewportSize[1] + padding))

func targetRandomViewportPos(source):
	var viewportSize = get_viewport().get_visible_rect().size
	var randomViewportPos = Vector2(randi_range(0, viewportSize[0]), randi_range(0, viewportSize[1]))
	return (randomViewportPos - source).normalized()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	toNext -= delta
	if toNext <= 0:
		toNext = SPAWN_INTERVAL
		var obstacle = obstacleScene.instantiate()
		var edge = ['top', 'right', 'bottom', 'left'][randi_range(0, 3)]
		obstacle.position = randomPosFromEdge(edge)
		obstacle.velocity_dir = targetRandomViewportPos(obstacle.position)
		add_child(obstacle)
		obstacle_spawned.emit()
