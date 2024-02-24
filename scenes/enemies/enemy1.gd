extends CharacterBody2D

@onready var animation : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func play_animation(animation_name):
	animation.play(animation_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
