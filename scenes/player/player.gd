extends CharacterBody2D
var animation : Node
var move_direction : Vector2
var animation_direction : String

@onready var weapon : Node = $WeaponsManager
@onready var status : Node = $CharacterStateMachine

@export var health : int
@export var movement_speed : float
@export var shooting_slowdown : float
@export var placing_trap_speed : float
@export var rolling_range : float
@export var rolling_speed : float
@export var rolling_cooldown : float
@export var time_of_invulnerability : float

const player_velocity = 450.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 0


func _physics_process(delta):
	pass
	#if Input.is_action_just_pressed("1st_player_next_weapon"):
		#weapon.next_weapon()
	
	#if Input.is_action_just_pressed("1st_player_prev_weapon"):
		#weapon.prev_weapon()

func _ready():
	animation = $AnimationPlayer
	#use_weapon.connect(weapon._on_player_use_weapon)

func update_animation(move_direction):
	if move_direction.x > 0:
		animation_direction = "right"
	elif move_direction.x < 0:
		animation_direction = "left"
	elif move_direction.y < 0:
		animation_direction = "up"
	elif move_direction.y > 0:
		animation_direction = "down"
		
	#if move_direction.y > 0:
		#weapon.z_index = 1
	#if move_direction.y < 0:
		#weapon.z_index = -1
		
	if move_direction.length() > 0: 
		animation.play("walk_" + animation_direction)
	else:
		animation.play("idle_" + animation_direction)
	
	if move_direction.length() > 0:
		#weapon.position = Vector2.RIGHT.rotated(move_direction.angle())
		weapon.point_to(move_direction.angle())
