extends Node2D
class_name PlayerCharacter

# signal placed on root node - allows other scenes to listen to player
signal interactSignal

@onready var prevent_battle_timer = $"Prevent Battle Timer"
var preventBattle: bool = false
@onready var enemy_detector = $CharacterBody2D/EnemyDetector

	
func _on_enemy_detector_area_entered(area):
	if area.is_in_group("Enemy") and !preventBattle:
		print("Enemy detected - engage battle  ", area.get_parent().name)
		enemy_detector.set_deferred("monitoring", false)
		prevent_battle_timer.start()
		SceneManager.eneterBattleScene(area.get_parent().name)
	pass # Replace with function body.


func _on_prevent_battle_timer_timeout():
	print("Let the battles commence")
	enemy_detector.set_deferred("monitoring", true)
	preventBattle = false
	pass # Replace with function body.
