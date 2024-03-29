extends Node2D
var bullet_scene : PackedScene = preload("res://scenes/weapon/bullet.tscn")
var bullet_speed = 8e3
var bullet_range = 1000
@onready var marker : Node = get_node("Sprite2D/Marker2D")
var spread : float = PI / 72
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func use():
	var bullet : Node = bullet_scene.instantiate()
	bullet.speed = bullet_speed
	bullet.weapon_range  = bullet_range
	bullet.global_rotation = marker.global_rotation + rng.randf_range(-spread,+spread)
	bullet.global_position = marker.global_position
	add_child(bullet)

func point_left():
	$Sprite2D.scale.y = -0.25
	
func point_right():
	$Sprite2D.scale.y = 0.25
