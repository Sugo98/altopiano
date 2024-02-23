extends Node2D

@onready var sprite : Sprite2D = $WeaponPivot/WeaponSprite
@onready var weapon_pivot : Marker2D = $WeaponPivot
@onready var feet_pivot : Marker2D = $FeetPivot
@onready var shoot_point : Marker2D = $WeaponPivot/ShootPoint
@onready var shoot_shadow : Area2D = $FeetPivot/ShadowShootPoint 
@onready var next_shot_cooldown : Timer = $NextShot
@onready var bullet_scene : PackedScene = preload("res://scenes/weapon/bullet.tscn")

@export var damage : int
@export var rate_of_fire : float
@export var is_automatic : bool = false
@export var bullet_speed : float = 5000
@export var weapon_range : float
@export var precision : float #from 0 to 1
@export var ammo_size : int
@export var box_ammo_size : int
@export var recoil : float

var current_ammo : int
var current_box_ammo : int

var rng = RandomNumberGenerator.new()

var shadow_height := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	shadow_height.y = shoot_point.position.y + weapon_pivot.position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func point_to(angle):
	weapon_pivot.rotation = angle
	feet_pivot.rotation = angle
	if abs(angle) < PI/2: #point_right
		weapon_pivot.scale.y = 1
	else: #point_left
		weapon_pivot.scale.y = -1

func use():
	if next_shot_cooldown.is_stopped() and !shoot_shadow.get_overlapping_bodies():
		shoot()
	
func shoot():
	var bullet : Node = bullet_scene.instantiate()
	var spread :float = PI / 8.0 * (1 - precision)
	bullet.speed = bullet_speed
	bullet.weapon_range  = weapon_range
	bullet.global_rotation = weapon_pivot.global_rotation + rng.randf_range(-spread,+spread)
	bullet.global_position = shoot_point.global_position - shadow_height
	bullet.shadow_height = shadow_height
	get_tree().root.add_child(bullet)
	next_shot_cooldown.start(1 / rate_of_fire)
