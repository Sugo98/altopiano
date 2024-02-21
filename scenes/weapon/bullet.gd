extends CharacterBody2D
var weapon_range : float = 1000
var speed : float = 5000

var trail_point : Vector2
var is_flying : bool

@onready var life_timer : Timer = $LifeTimer
@onready var trail : Line2D = $Trail
@onready var hit_box : CollisionShape2D = $HitBox

func _physics_process(delta):
	move_and_slide()
	trail.add_point(trail_point)
	trail_point += delta*speed*Vector2.LEFT

func _ready():
	trail_point = trail_point.rotated(-rotation)
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
