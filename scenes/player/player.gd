extends CharacterBody2D
signal use_weapon
var animation : Node
var move_direction : Vector2
var animation_direction : String

const player_velocity = 450.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 0


func _physics_process(delta):
	
	move_direction = Vector2(0,0)
	if Input.is_action_pressed("1st_player_move_up"):
		move_direction.y = -1
	if Input.is_action_pressed("1st_player_move_down"):
		move_direction.y = 1
	if Input.is_action_pressed("1st_player_move_left"):
		move_direction.x = -1
	if Input.is_action_pressed("1st_player_move_right"):
		move_direction.x = 1
	update_animation()
	
	if Input.is_action_just_pressed("1st_player_move_use_weapon"):
		use_weapon.emit()
	
	move_direction = move_direction.normalized()
	velocity = player_velocity * move_direction 
	move_and_slide()

func _ready():
	animation = $AnimationPlayer

func update_animation():
	if move_direction.x > 0:
		animation_direction = "right"
	elif move_direction.x < 0:
		animation_direction = "left"
	elif move_direction.y < 0:
		animation_direction = "up"
	elif move_direction.y > 0:
		animation_direction = "down"
		
	if move_direction.length() > 0: 
		animation.play("walk_" + animation_direction)
	else:
		animation.play("idle_" + animation_direction)
