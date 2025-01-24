extends Node2D
class_name PlayerCharacter

# signal placed on root node - allows other scenes to listen to player
signal interactSignal

@onready var prevent_battle_timer = $"Prevent Battle Timer"
var preventBattle: bool = false
@onready var enemy_detector = $CharacterBody2D/EnemyDetector

	
func _on_enemy_detector_area_entered(enemy_area):
	if enemy_area.is_in_group("Enemy") and !preventBattle:
		print("Enemy detected - engage battle  ", enemy_area.get_parent().name, " ", enemy_area.get_groups())
		# Check group names for MiniGame group
		# Set minigame type
		var MG_Type
		for MG in enemy_area.get_groups():
			if MG.split("_", true, 2)[0] == "MG":
				MG_Type = MG
			else: MG_Type = "NOGAME"
		# Takes string, returns Game.GameTypes
		var minigame = Game.match_game_types(MG_Type)
		
		enemy_detector.set_deferred("monitoring", false)
		prevent_battle_timer.start()
		SceneManager.eneterBattleScene(enemy_area.get_parent().name, minigame)
	pass # Replace with function body.


func _on_prevent_battle_timer_timeout():
	print("Let the battles commence")
	enemy_detector.set_deferred("monitoring", true)
	preventBattle = false
	pass # Replace with function body.
