extends Node2D

var all_weapon : Array[Weapon]
var available_weapons : Array[Weapon]
var equip_weapons : Array[Weapon]
var curr_weapon : Weapon
var curr_id
var n_equip_weapon : int = 0


func _ready():
	curr_weapon = $Pistol
	get_equipped_weapon()

func _physics_process(delta):
	##### DELETE FROM HERE
	if Input.is_action_just_pressed("1st_player_next_weapon"):
		next_weapon()
	if Input.is_action_just_pressed("1st_player_prev_weapon"):
		prev_weapon()
	
	var move_direction = Vector2(0,0)
	if Input.is_action_pressed("1st_player_move_up"):
		move_direction.y = -1
	if Input.is_action_pressed("1st_player_move_down"):
		move_direction.y = 1
	if Input.is_action_pressed("1st_player_move_left"):
		move_direction.x = -1
	if Input.is_action_pressed("1st_player_move_right"):
		move_direction.x = 1
	if move_direction.length() > 0:
		curr_weapon.point_to(move_direction.angle())
	
	if Input.is_action_just_pressed("1st_player_use_weapon"):
		curr_weapon.use()
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
	
func next_weapon():
	switch_to_weapon((curr_id + 1)% n_equip_weapon)

func prev_weapon():
	switch_to_weapon((n_equip_weapon + curr_id - 1)% n_equip_weapon)

func point_to(angle):
	curr_weapon.point_to(angle)

func use():
	pass


