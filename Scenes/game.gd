extends Node

enum Game_Types { NOGAME, RPS }

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

# Function for matching strings (MiniGame groupname) into Game_Types
# Keeps logic on game.gd instead of spreading it elsewhere
# This is called in from player
func match_game_types(MiniGame_Name):
	var minigame
	match MiniGame_Name:
		"NOGAME": # Else condition - for errors
			minigame = Game_Types.NOGAME
		"MG_RPS":
			minigame = Game.Game_Types.RPS
	return minigame
# Section: Battle Manager
func load_mini_game(gameType):
	var miniGame
	print("gameType: ", gameType)
	match gameType:
		Game_Types.RPS:
			miniGame = ResourceLoader.load("res://Scenes/Battle/MiniGames/mg_rps.tscn").instantiate()

	get_tree().root.get_node("/root/Game/BattleScene/CanvasLayer/MarginContainer/VBoxContainer/MiniGame").add_child(miniGame)
	pass
