extends Area2D

onready var animationPlayer: AnimationPlayer = get_node("AnimationPlayer")

export var coinCollectedPoints: = 200

func _on_Coin_body_entered(body: PhysicsBody2D):
	animationPlayer.play("CoinCollected")
	PlayerData.score += coinCollectedPoints
