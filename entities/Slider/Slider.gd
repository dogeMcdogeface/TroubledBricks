extends CharacterBody2D


const SPEED = 500.0

func _physics_process(delta):

	velocity.y = 0


	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("slider_left", "slider_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var collision = move_and_collide(velocity * delta)
	velocity.y = 0
