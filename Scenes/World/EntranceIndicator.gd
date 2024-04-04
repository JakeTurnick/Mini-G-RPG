extends Node2D
class_name EntranceIndicator

@export var ToLevelPath : String ## Path a given indicator leads to
@export var FromLocation : String
var playerAtEntrance : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.visible = false ## Default behavior is invisible

func _on_area_2d_body_entered(_body): ## Show indicator and play animation when player is on entrance
	playerAtEntrance = true
	$AnimatedSprite2D.visible = true
	$AnimatedSprite2D.play("Flash")

func _on_area_2d_body_exited(_body): ## Hide indicator and stop animation when player leaves entrance
	playerAtEntrance = false
	$AnimatedSprite2D.visible = false
	$AnimatedSprite2D.stop()

func _on_player_character_interact_signal(): ## Signal from player to interact
	if (playerAtEntrance):
		SceneManager.goto_scene(ToLevelPath)
