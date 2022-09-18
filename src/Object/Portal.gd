tool
extends Area2D

export var nextScene: PackedScene
onready var tpAnimationPlayer: = $AnimationPlayer

func _on_Portal_body_entered(body: PhysicsBody2D):
	teleport()

func _get_configuration_warning():
	return "NextScene Property is Empty" if  not nextScene else ""

func teleport():
	tpAnimationPlayer.play("Teleport")
	yield(tpAnimationPlayer, "animation_finished")
	get_tree().change_scene_to(nextScene)
