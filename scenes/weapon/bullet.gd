extends CharacterBody2D
var weapon_range : float = 1000
var speed : float = 5000

var shadow_height : Vector2
var trail_duration : int = 6
var trail_queue : Array[Vector2]
var is_flying : bool


@onready var life_timer : Timer = $LifeTimer
@onready var trail : Line2D = $Trail
@onready var trail_pivot : Marker2D = $TrailPivot
@onready var hit_box : CollisionShape2D = $HitBox


func _physics_process(delta):
	var collision = move_and_collide( velocity*delta )
	draw_trail()
	if collision:
		is_flying = false

func _process(delta):
	pass

func _ready():
	trail_pivot.global_position = global_position + shadow_height
	draw_trail()
	velocity = speed * Vector2.RIGHT.rotated(rotation)
	live_your_life()


func live_your_life():
	is_flying = true
	var life_time = weapon_range / speed
	life_timer.start(life_time)
	await life_timer.timeout
	end_your_life()

func end_your_life():
	velocity = Vector2.ZERO
	is_flying = false
	hit_box.set_deferred("disabled",true)
	life_timer.start(0.5)
	await life_timer.timeout
	queue_free()

func draw_trail():
	trail_queue.append( trail_pivot.global_position )
	if (trail_queue.size() > trail_duration):
		trail_queue.pop_front()
	trail.clear_points()
	for p in trail_queue:
		trail.add_point(to_local(p))
