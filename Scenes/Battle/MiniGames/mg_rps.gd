extends Mini_Game


enum RPS_MOVE { ROCK, PAPER, SCISSORS }
var player_selection : RPS_MOVE
var enemy_selection : RPS_MOVE
var rng = RandomNumberGenerator.new()

enum MATCH_STATE { VICTORY, TIE, DEFEAT }
var match_state : MATCH_STATE

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_shoot_btn_pressed():
	# Select enemy choice
	# Potential for weighted range, potential for stats to affect weights
	enemy_selection = rng.randi_range(1,3)
	match enemy_selection:
		1:
			enemy_selection = RPS_MOVE.ROCK
		2: 
			enemy_selection = RPS_MOVE.PAPER
		3: 
			enemy_selection = RPS_MOVE.SCISSORS
			
	# Update UI
	
	# Compare moves
	match player_selection:
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




# Section: Player controls
# Updates selection
func _on_rock_btn_pressed():
	player_selection = RPS_MOVE.ROCK
	pass # Replace with function body.

func _on_paper_btn_pressed():
	player_selection = RPS_MOVE.PAPER
	pass # Replace with function body.

func _on_scissors_btn_pressed():
	player_selection = RPS_MOVE.SCISSORS
	pass # Replace with function body.

# TODO: Update UI with icon, selected button
func update_player_selection():
	match player_selection:
		RPS_MOVE.ROCK:
			pass
		RPS_MOVE.PAPER:
			pass
		RPS_MOVE.SCISSORS:
			pass
	pass
	
func on_end():
	emit_signal("MG_Finished")
