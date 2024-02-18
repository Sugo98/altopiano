extends Sprite2D
var bullet : Node = preload("res://scenes/weapon/bullet.tscn").instantiate()
var bullet_speed = 30000.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_use_weapon():
	bullet.speed = bullet_speed
	add_child(bullet)
