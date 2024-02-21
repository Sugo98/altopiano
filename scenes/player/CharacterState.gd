extends Node

class_name CharacterState

var player : CharacterBody2D
var weapon : Node2D

var curr_movement_speed : float
var can_move : bool = true
var can_be_hit : bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func state_input(event : InputEvent):
	pass

func state_process(delta):
	pass
