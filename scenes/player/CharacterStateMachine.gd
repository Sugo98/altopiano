extends Node

var states : Array[CharacterState]
@onready var curr_state : CharacterState = $Normal
@onready var player : CharacterBody2D = get_parent() #it works
@export var weapon : Node2D

func _ready():
	for child in get_children():
		if child is CharacterState:
			states.append(child)
			child.player = player 
			child.weapon = weapon
			child.update_stats()
			## DO things with child
			print(str(child.name) + " weapon: " + str(child.weapon.name))
		else:
			push_warning("Child " +child.name+" not a CharacterState")
	curr_state
	
func _physics_process(delta):
	curr_state.state_process(delta)
	if curr_state.next_state is CharacterState:
		switch_state(curr_state.next_state)
	player.get_node("Debug").text = curr_state.name

func switch_state(new_state : CharacterState):
	curr_state.next_state = null
	curr_state.on_exit()
	curr_state = new_state
	curr_state.on_enter()
