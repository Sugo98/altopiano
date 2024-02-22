extends Node

class_name CharacterState
var next_state : CharacterState = null

var player : CharacterBody2D
var weapon : Node2D

var movement_speed : float
var can_move : bool = true
var can_be_hit : bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_stats():
	pass

func state_input(event : InputEvent):
	pass
	
func on_exit():
	pass
	
func on_enter():
	pass

func state_process(delta):
	print("Hello")

func move_player() -> void:
	#get movement axis
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
	player.velocity = movement_speed * move_direction 
	player.move_and_slide()
	player.update_animation(move_direction)

func use_weapon():
	weapon.use()
