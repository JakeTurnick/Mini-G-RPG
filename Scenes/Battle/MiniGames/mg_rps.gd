extends Mini_Game


enum RPS_move { ROCK, PAPER, SCISSORS }
var player_selection : RPS_move

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Section: Player controls
# Updates selection
func _on_rock_btn_pressed():
	player_selection = RPS_move.ROCK
	pass # Replace with function body.

func _on_paper_btn_pressed():
	player_selection = RPS_move.PAPER
	pass # Replace with function body.

func _on_scissors_btn_pressed():
	player_selection = RPS_move.SCISSORS
	pass # Replace with function body.

# TODO: Update UI with icon, selected button
func update_player_selection():
	match player_selection:
		RPS_move.ROCK:
			pass
		RPS_move.PAPER:
			pass
		RPS_move.SCISSORS:
			pass
	pass
	
func on_end():
	emit_signal("MG_Finished")
