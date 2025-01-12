extends Node

enum Game_Types { RPS }

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


# Section: Battle Manager
func load_mini_game(gameType):
	var miniGame
	match gameType:
		Game_Types.RPS:
			miniGame = ResourceLoader.load("res://Scenes/Battle/MiniGames/mg_rps.tscn").instantiate()

	get_tree().root.get_node("/root/Game/BattleScene").add_child(miniGame)
	pass
