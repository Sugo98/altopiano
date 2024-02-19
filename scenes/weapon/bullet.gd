extends CharacterBody2D
var weapon_range : float = 500
var speed : float = 1000
var angle : float = 0

func _physics_process(_delta):
	velocity = speed * Vector2.RIGHT.rotated(rotation)
	move_and_slide()

func _ready():
	fade_away()

func fade_away():
	var life_time = weapon_range / speed
	print(life_time)
	await get_tree().create_timer(life_time).timeout
	speed = 0
	await get_tree().create_timer(0.1).timeout
	queue_free()
