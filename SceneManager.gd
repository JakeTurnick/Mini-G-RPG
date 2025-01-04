extends Node

var overworldOrphan
# ----- GODOT DOCS EXAMPLE
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	var testabs = get_tree().root.get_node("/root/Game")
	var testrel = get_tree().root.get_node("./Game")
	#print("abs:", testabs, " rel:", testrel)
	
	var transitionCanvas = ResourceLoader.load("res://Scenes/Statics/LoadingCanvas.tscn").instantiate()
	get_tree().root.add_child(transitionCanvas, false, Node.INTERNAL_MODE_FRONT)
	transitionCanvas.get_child(0).PlayFadeIn()
	await get_tree().create_timer(2.0).timeout
	var current_scene = get_tree().root.get_node("/root/Game").get_child(0)
	# It is now safe to remove the current scene.
	current_scene.free()
	# Load the new scene.
	var nextScene = ResourceLoader.load(path).instantiate()
	# Add it to the active scene, as child of root.
	get_tree().root.get_node("/root/Game").add_child(nextScene)
	transitionCanvas.get_child(0).QueueFadeOut()
	#TODO - find a better wait to await animation length or wait till animation is done
	await get_tree().create_timer(1.0).timeout
	transitionCanvas.free()
	
func eneterBattleScene():
	call_deferred("_deferred_eneterBattleScene")
	pass
	
func _deferred_eneterBattleScene():
	## Method : Pause overworld scene
	var overworld_scene = get_tree().root.get_node("/root/Game").get_child(0)
	overworld_scene.process_mode = Node.PROCESS_MODE_DISABLED
	
	# Load an play transistion
	var transitionCanvas = ResourceLoader.load("res://Scenes/Statics/LoadingCanvas.tscn").instantiate()
	get_tree().root.add_child(transitionCanvas, false, Node.INTERNAL_MODE_FRONT)
	transitionCanvas.get_child(0).PlayFadeIn()
	await get_tree().create_timer(2.0).timeout
	
	

	
	## Method : orphan child
	#overworldOrphan = overworld_scene
	# Pause game overworld - to be unpaused in leaveBattleScene()
	#get_tree().root.remove_child(overworld_scene)
	
	var nextScene = ResourceLoader.load("res://Scenes/Battle/BattleScene.tscn").instantiate()
	# Add it to the active scene, as child of root.
	get_tree().root.get_node("/root/Game").add_child(nextScene)
	transitionCanvas.get_child(0).QueueFadeOut()
	#TODO - find a better wait to await animation length or wait till animation is done
	await get_tree().create_timer(1.0).timeout
	transitionCanvas.free()
	pass
	
func leaveBattleScene():
	call_deferred("_deferred_leaveBattleScene")
	pass
	
func _deferred_leaveBattleScene():
	# Load an play transistion
	var transitionCanvas = ResourceLoader.load("res://Scenes/Statics/LoadingCanvas.tscn").instantiate()
	get_tree().root.add_child(transitionCanvas, false, Node.INTERNAL_MODE_FRONT)
	transitionCanvas.get_child(0).PlayFadeIn()
	await get_tree().create_timer(2.0).timeout
	
	## Method : Pause overworld scene
	var overworld_scene = get_tree().root.get_node("/root/Game").get_child(0)
	overworld_scene.process_mode = Node.PROCESS_MODE_INHERIT
	
	#print("Should be orphans overworld node ", overworldOrphan)
	# Child 1 should be battle scene
	var battle_scene = get_tree().root.get_node("/root/Game").get_child(1)
	# release battleScene
	battle_scene.queue_free()
	transitionCanvas.get_child(0).QueueFadeOut()
	#TODO - find a better wait to await animation length or wait till animation is done
	await get_tree().create_timer(1.0).timeout
	transitionCanvas.free()
	
	# Unpause game overworld
	#overworld_scene.ProcessMode = ProcessMode.PROCESS_MODE_DISABLED
	pass
