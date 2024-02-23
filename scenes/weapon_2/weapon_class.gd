extends Node2D
class_name Weapon

@export var damage : float = 10
@export var rate_of_fire : float = 1
@export var is_automatic : bool = false
@export var bullet_speed : float = 5000
@export var weapon_range : float = 750
@export var precision : float = 0.8#from 0 to 1
@export var ammo_size : int = 6
@export var box_ammo_size : int = 4
@export var recoil : float = 5

@onready var sprite : Sprite2D = $WeaponPivot/WeaponSprite
@onready var weapon_pivot : Marker2D = $WeaponPivot
@onready var feet_pivot : Marker2D = $FeetPivot
@onready var shoot_point : Marker2D = $WeaponPivot/ShootPoint
@onready var shoot_shadow : Area2D = $FeetPivot/ShadowShootPoint 
@onready var next_shot_cooldown : Timer = $NextShot
@onready var bullet_scene : PackedScene = preload("res://scenes/weapon_2/bullet.tscn")

var rng = RandomNumberGenerator.new() 

func sleep():
	hide()

func awake():
	show()
	
func use():
	pass

func point_to(angle):
	weapon_pivot.rotation = angle
	feet_pivot.rotation = angle
	if abs(angle) < PI/2: #point_right
		weapon_pivot.scale.y = 1
	else: #point_left
		weapon_pivot.scale.y = -1

func shot_bullet(angle:float):
	var bullet : Node = bullet_scene.instantiate()
	var spread :float = PI / 8.0 * (1 - precision)
	bullet.speed = bullet_speed
	bullet.weapon_range  = weapon_range
	bullet.global_rotation = angle + rng.randf_range(-spread,+spread)
	bullet.global_position = shoot_shadow.global_position
	bullet.trail_starting_point = shoot_point.global_position
	get_tree().root.add_child(bullet)
