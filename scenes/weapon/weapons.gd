extends Node2D

var weapons : Dictionary = {
	"pistol" : preload("res://scenes/weapon/pistol.tscn"),
	"shotgun" : preload("res://scenes/weapon/shotgun.tscn")
}

var available_weapon : Array = ["pistol","shotgun"]
var n_weapons : int
var current_weapon_id : int
var current_weapon : Node


# Called when the node enters the scene tree for the first time.
func _ready():
	n_weapons = available_weapon.size()
	current_weapon_id = -1
	next_weapon()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func next_weapon():
	current_weapon_id += 1
	if current_weapon_id >= n_weapons:
		current_weapon_id = 0
	for i in get_children():
		i.queue_free()
	add_child(weapons[available_weapon[current_weapon_id]].instantiate())
	update_current_weapon()
	
func prev_weapon():
	current_weapon_id -= 1
	if current_weapon_id < 0:
		current_weapon_id = n_weapons
	for i in get_children():
		i.queue_free()
	add_child(weapons[available_weapon[current_weapon_id]].instantiate())
	update_current_weapon()
	
func _on_player_use_weapon():
	current_weapon.use()
	
func point_left():
	current_weapon.get_node("Sprite2D").scale.y = -0.25
	
func point_right():
	current_weapon.get_node("Sprite2D").scale.y = 0.25

func update_current_weapon():
	print(get_children())
	current_weapon = get_children().back()
