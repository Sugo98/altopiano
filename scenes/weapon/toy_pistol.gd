extends Node2D

@onready var sprite : Sprite2D = $WeaponPivot/WeaponSprite
@onready var weapon_pivot : Marker2D = $WeaponPivot
@onready var feet_pivot : Marker2D = $FeetPivot
@onready var shoot_point : Marker2D = $WeaponPivot/ShootPoint
@onready var bullet_scene : PackedScene = preload("res://scenes/weapon/bullet.tscn")

@export var bullet_speed : float
@export var weapon_range : float

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
	if angle > 0: #point_down
		sprite.z_index = 1
	else: #point_up
		sprite.z_index = -1

func use():
	var bullet : Node = bullet_scene.instantiate()
	bullet.speed = bullet_speed
	bullet.weapon_range  = weapon_range
	bullet.global_rotation = weapon_pivot.global_rotation # + rng.randf_range(-spread,+spread)
	bullet.global_position = shoot_point.global_position - shadow_height
	bullet.trail_point = shadow_height
	get_tree().root.get_child(0).add_child(bullet)
