extends Control

#var SceneManager = load("res://SceneManager.gd").new()
@onready var transitionSceneResource = preload("res://Scenes/Statics/basic_scene_transition_rect.tscn")
# Called when the node enters the scene tree for the first time.

func _on_start_button_button_up():
	SceneManager.goto_scene("res://Scenes/World/TutorialArea.tscn")


func _on_options_button_button_up():
	print("show options")
	$MarginContainer/HBoxContainer/VBoxContainer/VBoxContainer/OptionsButton/Options_PopupPanel.popup()


func _on_battle_test_button_pressed():
	SceneManager.goto_scene("res://Scenes/World/battle_grounds_test.tscn")
