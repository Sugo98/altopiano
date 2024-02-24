extends EnemyState

var player : CharacterBody2D
@export var speed : float = 200

func on_enter():
	player = get_tree().get_first_node_in_group("Player")
	
func state_process(delta):
	mob.play_animation("walk")
	
	var direction = player.global_position - mob.global_position
	mob.velocity = direction.normalized() * speed
	
	mob.move_and_slide()
