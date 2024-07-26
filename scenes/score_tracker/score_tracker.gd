extends Control

var spawned = 0
var touched = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ObstaclesSpawned.text = str(spawned)
	$ObstaclesTouched.text = str(touched)


func _on_player_obstacle_touched():
	touched += 1
	$ObstaclesTouched.text = str(touched)


func _on_obstacle_spawner_obstacle_spawned():
	spawned += 1
	$ObstaclesSpawned.text = str(spawned)
