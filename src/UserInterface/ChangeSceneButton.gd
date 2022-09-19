tool
extends Button

export(String, FILE) var nextScenePath: = ""

onready var sceneTree: = get_tree()

func _on_PlayButton_button_up():
	sceneTree.paused = false
	sceneTree.change_scene(nextScenePath)

func _get_configuration_warning():
	return "Next Scene Path is empty" if nextScenePath == "" else ""
