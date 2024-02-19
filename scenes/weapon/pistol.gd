extends Node2D
var bullet_scene : PackedScene = preload("res://scenes/weapon/bullet.tscn")
var bullet_speed = 3e5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_use_weapon():
	var bullet : Node = bullet_scene.instantiate()
	bullet.speed = bullet_speed
	bullet.global_rotation = $Marker2D.global_rotation
	bullet.global_position = $Marker2D.global_position
	add_child(bullet)

func point_left():
	$Sprite2D.scale.y = -0.25
	
func point_right():
	$Sprite2D.scale.y = 0.25
