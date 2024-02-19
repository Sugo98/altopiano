extends CharacterBody2D
var speed : float = 0
var angle : float = 0

func _physics_process(delta):
	velocity = delta * speed * Vector2.RIGHT.rotated(rotation)
	move_and_slide()
