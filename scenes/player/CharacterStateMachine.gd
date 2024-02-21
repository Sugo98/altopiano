extends Node

var states : Array[CharacterState]
@onready var curr_state : CharacterState = $NormalState
@onready var player : CharacterBody2D = get_parent() #it works
@export var weapon : Node2D

func _ready():
	for child in get_children():
		if child is CharacterState:
			states.append(child)
			child.player = player 
			child.weapon = weapon
			## DO things with child
		else:
			push_warning("Child " +child.name+" not a CharacterState")

func _input(event):
	curr_state.state_input(event)
	
func _physics_process(delta):
	curr_state.state_process(delta)
