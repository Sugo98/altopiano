extends Node

var states : Dictionary = {}
@onready var curr_state : EnemyState = $FollowPlayer
@onready var mob : CharacterBody2D = get_parent() #it works

func _ready():
	for child in get_children():
		if child is EnemyState:
			states[child.name] = child
			child.mob = mob
			## DO things with child
		else:
			push_warning("Child " + child.name +" not a EnemyState")
		
	switch_state(states["FollowPlayer"])

func _physics_process(delta):
	curr_state.state_process(delta)

func switch_state(new_state: EnemyState):
	curr_state.on_exit()
	curr_state = new_state
	curr_state.on_enter()
