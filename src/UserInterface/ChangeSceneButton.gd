tool
extends Button

export(String, FILE) var nextScenePath: = ""

func _on_PlayButton_button_up():
	get_tree().change_scene(nextScenePath)

func _get_configuration_warning():
	return "Next Scene Path is empty" if nextScenePath == "" else ""
