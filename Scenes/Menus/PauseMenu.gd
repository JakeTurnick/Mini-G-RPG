extends Control


func mainMenuButton():
	SceneManager.goto_scene("res://Scenes/Menus/StartMenu.tscn")

func unpauseButton():
	Main.TogglePause()
