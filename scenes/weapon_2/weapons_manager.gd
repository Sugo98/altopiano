extends Node2D

var all_weapon : Array[Weapon]
var available_weapons : Array[Weapon]
var equip_weapons : Array[Weapon]
var curr_weapon : Weapon
var curr_id
var n_equip_weapon : int = 0
var is_automatic : bool = false


func _ready():
	curr_weapon = $Pistol
	get_equipped_weapon()

func _physics_process(delta):
	##### DELETE FROM HERE
	if Input.is_action_just_pressed("1st_player_next_weapon"):
		next_weapon()
	if Input.is_action_just_pressed("1st_player_prev_weapon"):
		prev_weapon()
	##### TO HERE

func get_equipped_weapon():
	for child in get_children():
		if child is Weapon:
			n_equip_weapon += 1
			equip_weapons.append(child)
			child.sleep()
			## DO things with child
		else:
			push_warning("Child " +child.name+" not a CharacterState")
	switch_to_weapon(0)

func switch_to_weapon(id : int):
	curr_weapon.sleep()
	curr_id = id
	curr_weapon = equip_weapons[id]
	curr_weapon.awake()
	is_automatic = curr_weapon.is_automatic
	
func next_weapon():
	switch_to_weapon((curr_id + 1)% n_equip_weapon)

func prev_weapon():
	switch_to_weapon((n_equip_weapon + curr_id - 1)% n_equip_weapon)

func point_to(angle):
	curr_weapon.point_to(angle)

func use():
	curr_weapon.use()


