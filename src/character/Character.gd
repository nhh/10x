extends CharacterBody2D

@export var speed = 300
@export var gravity = 200

@onready var _animated_sprite = $AnimatedSprite2D
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_sprite.play("default", 0.1)
	timer.connect("timeout", func(): timer.stop())
	
func foo():
	_animated_sprite.play("default", 0.1)
	return Signal(timer, "timout")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#await foo()
	pass

func jump():
	if(Input.is_action_just_pressed("jump") && timer.is_stopped()):
		timer.start(0.1)
	
	# as long as the timer is running, we are jumping -> decrease veloc 	
	if(!timer.is_stopped()):
		velocity.y -= 350
		

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity.x = input_direction.x * speed	
	jump()
	velocity.y += gravity

func _physics_process(delta):		
	get_input()		
	move_and_slide()
