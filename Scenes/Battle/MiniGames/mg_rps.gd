extends Mini_Game


enum RPS_MOVE { ROCK, PAPER, SCISSORS, NULL }
var player_selection : RPS_MOVE = RPS_MOVE.NULL
var enemy_selection : RPS_MOVE = RPS_MOVE.NULL
var rng = RandomNumberGenerator.new()

const ROCK_ICON = preload("res://Scenes/Battle/MiniGames/RPS/rock_icon.tscn")
const PAPER_ICON = preload("res://Scenes/Battle/MiniGames/RPS/paper_icon.tscn")
const SCISSOR_ICON = preload("res://Scenes/Battle/MiniGames/RPS/scissor_icon.tscn")

@onready var label_player_selection = $Control/VBoxContainer/Visuals/HBoxContainer/Label_PlayerSelection
@onready var label_enemy_selection = $Control/VBoxContainer/Visuals/HBoxContainer/Label_EnemySelection
@onready var player_selection_icon = $Control/VBoxContainer/Visuals/HBoxContainer/Label_PlayerSelection/PlayerSelection_Icon
@onready var enemy_selection_icon = $Control/VBoxContainer/Visuals/HBoxContainer/Label_EnemySelection/EnemySelection_Icon

@onready var visuals = $Control/VBoxContainer/Visuals

enum MATCH_STATE { VICTORY, TIE, DEFEAT, NULL }
var match_state : MATCH_STATE = MATCH_STATE.NULL
var match_settled : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func process_match_state():
	if match_state == MATCH_STATE.NULL:
		print("game is still going")
		pass
	else:
		var match_label = Label.new()
		visuals.add_child(match_label, false, Node.INTERNAL_MODE_FRONT)
		match match_state:
			MATCH_STATE.VICTORY:
				match_label.text = "You win!"
			MATCH_STATE.TIE:
				match_label.text = "It's a tie!"
			MATCH_STATE.DEFEAT:
				match_label.text = "You lose!"


func _on_shoot_btn_pressed():
	# Dont repeat logic if match state is settled
	if match_state != MATCH_STATE.NULL:
		return
	# Select enemy choice
	# Potential for weighted range, potential for stats to affect weights
	enemy_selection = rng.randi_range(1,3)
	# TESTING PURPOSES
	enemy_selection = 1
	match enemy_selection:
		1:
			enemy_selection = RPS_MOVE.ROCK
		2: 
			enemy_selection = RPS_MOVE.PAPER
		3: 
			enemy_selection = RPS_MOVE.SCISSORS
			
	#region Compare moves
	match player_selection:
		RPS_MOVE.NULL:
			match_state = MATCH_STATE.NULL
		RPS_MOVE.ROCK:
			match enemy_selection:
				RPS_MOVE.ROCK:
					match_state = MATCH_STATE.TIE
				RPS_MOVE.PAPER: 
					match_state = MATCH_STATE.DEFEAT
				RPS_MOVE.SCISSORS: 
					match_state = MATCH_STATE.VICTORY
			pass
		RPS_MOVE.PAPER:
			match enemy_selection:
				RPS_MOVE.ROCK:
					match_state = MATCH_STATE.VICTORY
				RPS_MOVE.PAPER: 
					match_state = MATCH_STATE.TIE
				RPS_MOVE.SCISSORS: 
					match_state = MATCH_STATE.DEFEAT
			pass
		RPS_MOVE.SCISSORS:
			match enemy_selection:
				RPS_MOVE.ROCK:
					match_state = MATCH_STATE.DEFEAT
				RPS_MOVE.PAPER: 
					match_state = MATCH_STATE.VICTORY
				RPS_MOVE.SCISSORS: 
					match_state = MATCH_STATE.DEFEAT
	#endregion
	process_match_state()

#region Player controls
# Updates selection
# this is a comment
func _on_rock_btn_pressed():
	player_selection = RPS_MOVE.ROCK
	update_player_selection()
	pass # Replace with function body.

func _on_paper_btn_pressed():
	player_selection = RPS_MOVE.PAPER
	update_player_selection()
	pass # Replace with function body.

func _on_scissors_btn_pressed():
	player_selection = RPS_MOVE.SCISSORS
	update_player_selection()
	pass # Replace with function body.
#endregion

## Update UI with icon & label, selected button
func update_player_selection():
	# Only 1 icon allowed
	if player_selection_icon.get_child_count() > 0:
		player_selection_icon.remove_child(player_selection_icon.get_child(0))
	match player_selection:
		RPS_MOVE.ROCK:
			label_player_selection.text = "Rock"
			player_selection_icon.add_child(ROCK_ICON.instantiate())
			pass
		RPS_MOVE.PAPER:
			label_player_selection.text = "Paper"
			player_selection_icon.add_child(PAPER_ICON.instantiate())
			pass
		RPS_MOVE.SCISSORS:
			label_player_selection.text = "Scissors"
			player_selection_icon.add_child(SCISSOR_ICON.instantiate())
			pass
	#TODO - same as above but with enemy
	pass
