extends Actor

export var stompVelocity: = 500.0

func _ready():
	pass # Replace with function body.

func _on_EnemyDetector_area_entered(area: Area2D):
	_velocity = calculateStompVelocity(_velocity, stompVelocity)
	
func _on_EnemyDetector_body_entered(body):
	die()
	
func _physics_process(delta):
	var direction: = get_direction()
	var isJumpInterrupted: = Input.is_action_just_released("jump")
	_velocity = calculateMoveVelocity(_velocity, direction, speed, isJumpInterrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
func get_direction() -> Vector2:
	var x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y = -1.0 if Input.is_action_pressed("jump") and is_on_floor() else 1.0
	return Vector2(x,y)

func calculateMoveVelocity(
	linearVelocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	isJumpInterrupted: bool
):
	var newVelocity = linearVelocity
	newVelocity.x = speed.x * direction.x
	newVelocity.y += gravity * get_process_delta_time()
	if direction.y == -1.0:
		newVelocity.y = direction.y * speed.y
	if isJumpInterrupted and newVelocity.y < 0:
			newVelocity.y = 0.0
	return newVelocity

func calculateStompVelocity(
	linearVelocity: Vector2,
	impulse: float
) -> Vector2:
	var stompVelocity = linearVelocity
	stompVelocity.y = -impulse
	return stompVelocity
	
func die():
	PlayerData.deaths += 1
	queue_free()


