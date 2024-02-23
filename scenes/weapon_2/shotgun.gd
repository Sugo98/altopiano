extends Weapon

@export var rosa_di_proiettli : int

var current_ammo : int
var current_box_ammo : int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func use():
	if next_shot_cooldown.is_stopped() and !shoot_shadow.get_overlapping_bodies():
		for i in range(rosa_di_proiettli):
			shot_bullet(weapon_pivot.global_rotation)
		next_shot_cooldown.start(1 / rate_of_fire)
		

