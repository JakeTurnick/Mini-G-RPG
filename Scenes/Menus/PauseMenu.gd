extends Control


var GamePaused : bool = false

func _ready():
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	hide()

func _process(_delta):
	pass
	"""if Input.is_action_just_pressed("Menu"):
		print("pause? ", GamePaused)
		if !GamePaused:
			pause()
		else:
			unpause()
			"""
func pause():
	print("pause the game")
	GamePaused = true
	get_tree().paused = true
	show()
	#get_node("/Main").paused = true
	#var PauseCanvas = ResourceLoader.load("res://Scenes/Menus/PauseMenu.tscn").instantiate()
	#get_tree().root.add_child(PauseCanvas, false, Node.INTERNAL_MODE_FRONT)
	
func unpause():
	print("unpause")
	GamePaused = false
	get_tree().paused = false
	hide()
