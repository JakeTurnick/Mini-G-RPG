extends Node

#@onready var StartMenuScene = preload("res://Scenes/Menus/StartMenu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_INHERIT
	pass
	#add_child(StartMenuScene.instantiate())


func pauseGame():
	get_tree().paused = true

func unpauseGame():
	get_tree().paused = false
