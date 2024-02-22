extends CharacterState

@export var normal_state : CharacterState
@onready var timer_shooting : Timer = $ShootingTimer
var shooting_time : float = 0.5

func update_stats():
	movement_speed = player.movement_speed * player.shooting_slowdown

func state_process(delta):
	#use weapon
	if weapon.is_automatic:
		if Input.is_action_pressed("1st_player_use_weapon"):
			use_weapon()
			timer_shooting.start(shooting_time)
	else:
		if Input.is_action_just_pressed("1st_player_use_weapon"):
			use_weapon()
			timer_shooting.start(shooting_time)
	move_player()
	
	if timer_shooting.is_stopped():
		next_state = normal_state

func on_enter():
	timer_shooting.start(shooting_time)
