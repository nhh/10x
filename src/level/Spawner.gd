extends Node2D

@onready var timer = $Timer
@export var monster: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout", Callable(self, "timeout"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func timeout():
	var spawn := monster.instantiate() as Node2D
	add_child(spawn)
	spawn.global_position = global_position
	timer.start()
