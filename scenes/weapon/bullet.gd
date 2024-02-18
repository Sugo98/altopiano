extends CharacterBody2D
var speed : float = 0
var angle : float = 0

func _physics_process(delta):
	velocity = Vector2(speed*delta, 0).rotated(angle)
	move_and_slide()
