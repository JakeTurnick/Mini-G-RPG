extends Node2D

@onready var player_label = $"CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer/Player options/PlayerLabel"
@onready var enemy_label = $CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer/EnemyLabel
@onready var mini_game_label = $"CanvasLayer/MarginContainer/VBoxContainer/Mini Game Label"


var playerName: String
var enemyName: String
var miniGameName: String
# Called when the node enters the scene tree for the first time.
func _ready():
	player_label.text = playerName
	enemy_label.text = enemyName
	mini_game_label.text = miniGameName
	
	await get_tree().create_timer(2.0).timeout
	SceneManager.leaveBattleScene()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
