extends Area2D

onready var animationPlayer: AnimationPlayer = get_node("AnimationPlayer")
#
#func _ready():
#	animationPlayer.


func _on_Coin_body_entered(body: PhysicsBody2D):
	animationPlayer.play("CoinCollected")
