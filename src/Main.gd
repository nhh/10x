extends Node2D

var sound : AudioStreamMP3

# Called when the node enters the scene tree for the first time.
func _ready():
	var file = FileAccess.open("res://Assets/Audio/ra-nggyu.mp3", FileAccess.READ)
	sound = AudioStreamMP3.new()
	sound.data = file.get_buffer(file.get_length())
	$AudioStreamPlayer2D.stream = sound
	$AudioStreamPlayer2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
