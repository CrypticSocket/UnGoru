extends Control

onready var sceneTree: = get_tree()
onready var pausedOverlay: ColorRect = get_node("PauseOverlay")
onready var scoreLabel: Label = get_node("Label")
onready var pauseText: Label = get_node("PausedText")

var paused: = false setget set_paused

func _ready():
	PlayerData.connect("scoreUpdated", self, "updateInterface")
	PlayerData.connect("playerDied", self, "_onPlayerDied")
	updateInterface()
	
func updateInterface():
	scoreLabel.text = "Score: %s" % PlayerData.score
	
func _onPlayerDied():
	self.paused = true
#	pauseText.text = "You died!!"
	
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("Pause"):
		self.paused = !paused
		sceneTree.set_input_as_handled()

func set_paused(value: bool):
	paused = value
	sceneTree.paused = value
	pausedOverlay.visible = value
	
