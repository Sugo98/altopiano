extends Line2D
@onready var bullet := get_parent()
var queue : Array
@export var MAX_SIZE : int

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var new_position = bullet.global_position
	queue.push_front(new_position)
	if queue.size() > MAX_SIZE:
		queue.pop_back()
	clear_points()
	
	for point in queue:
		add_point(point)
