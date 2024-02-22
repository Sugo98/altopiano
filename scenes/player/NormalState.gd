extends CharacterState

@export var shooting_state : CharacterState

func update_stats():
	movement_speed = player.movement_speed

func state_process(delta):
	#use weapon
	if Input.is_action_just_pressed("1st_player_use_weapon"):
		use_weapon()
		next_state = shooting_state
	
	move_player()
	
