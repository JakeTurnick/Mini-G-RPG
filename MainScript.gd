extends Node

## Main container for game - allows for custom logic & handling between scenes
## Useage - instantiate playable scenes, use SceneManager script to handle swaps
@onready var StartMenuScene = preload("res://Scenes/Menus/StartMenu.tscn")
@onready var PauseMenuScene = preload("res://Scenes/Menus/PauseMenu.tscn")
var GamePaused : bool = false


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	Game.add_child(StartMenuScene.instantiate())
	get_tree().root.add_child.call_deferred(PauseMenuScene.instantiate())
	
	# Might not be needed now (visible = false in scene editor)
	# but good to note that call_deferred("") can be used with any string of a named func
	call_deferred("hidePauseOnStart")
	
func hidePauseOnStart():
	var PauseMenu = get_node("/root/PauseMenu")
	PauseMenu.get_child(0).hide()

func _process(_delta):
	if Input.is_action_just_pressed("Menu"):
		TogglePause()

func TogglePause():
	get_tree().paused = not get_tree().paused
	get_node("/root/PauseMenu").get_child(0).visible = not get_node("/root/PauseMenu").get_child(0).visible
