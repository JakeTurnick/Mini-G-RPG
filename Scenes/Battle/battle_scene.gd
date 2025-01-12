extends Node2D

@onready var player_label = $"CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer/Player options/PlayerLabel"
@onready var enemy_label = $CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer/EnemyLabel
@onready var mini_game_label = $"CanvasLayer/MarginContainer/VBoxContainer/Mini Game Label"
@onready var mini_game = $CanvasLayer/MarginContainer/VBoxContainer/MiniGame

var playerName: String = ""
var enemyName: String = ""
var miniGameName: String = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	if playerName != "":
		player_label.text = playerName
	if enemyName != "":
		enemy_label.text = enemyName
	if miniGameName != "":
		mini_game_label.text = miniGameName
	print("welcome to battle")
	set_process_input(true)
	print(is_processing_input())
	pass # Replace with function body.



func _on_button_pressed():
	SceneManager.leaveBattleScene()
	pass # Replace with function body.


func _on_button_2_pressed():
	Game.load_mini_game(Game.Game_Types.RPS)
	pass # Replace with function body.
