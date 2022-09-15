extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = Vector2(300, 1000)
var gravity = 3000.0
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.y = max(velocity.y, speed.y)
	velocity = move_and_slide(velocity)
