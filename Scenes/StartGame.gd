extends Button

func _ready():
	pressed.connect(self.start_game)

func start_game():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
