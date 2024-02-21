extends CharacterState

#func state_input(event : InputEvent):
	#if Input.is_action_pressed("1st_player_use_weapon"):
		#weapon.use()
		#print("shot")

func state_process(delta):
	if weapon.is_automatic:
		if Input.is_action_pressed("1st_player_use_weapon"):
			weapon.use()
	else: #weapon_manual
		if Input.is_action_just_pressed("1st_player_use_weapon"):
			weapon.use()
	
	var move_direction = Vector2(0,0)
	if Input.is_action_pressed("1st_player_move_up"):
		move_direction.y = -1
	if Input.is_action_pressed("1st_player_move_down"):
		move_direction.y = 1
	if Input.is_action_pressed("1st_player_move_left"):
		move_direction.x = -1
	if Input.is_action_pressed("1st_player_move_right"):
		move_direction.x = 1
	
	move_direction = move_direction.normalized()
	player.velocity = player.movement_speed * move_direction 
	player.move_and_slide()
	player.update_animation(move_direction)
