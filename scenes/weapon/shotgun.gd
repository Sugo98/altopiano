extends Node2D
var bullet_scene : PackedScene = preload("res://scenes/weapon/bullet.tscn")
var bullet_speed = 8e3
var spread : float = PI / 36
var N_BULLETS : int = 10
@onready var marker : Node = get_node("Sprite2D/Marker2D")
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func use():
	for i in range(N_BULLETS):
		var bullet : Node = bullet_scene.instantiate()
		bullet.speed = bullet_speed
		bullet.global_rotation = marker.global_rotation + rng.randf_range(-spread,+spread)
		bullet.global_position = marker.global_position
		add_child(bullet)
