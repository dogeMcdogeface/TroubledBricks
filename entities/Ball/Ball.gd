extends CharacterBody2D

signal collided(body)


@export var speed = 1000.0
@export var direction = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	velocity.y = speed
	velocity = velocity.rotated(direction)

func _physics_process(delta):
	
	##TODO:
	##Switch between arcade and realistic graviy
	
	##TODO:
	##Switch between arcade and realistic bouncing
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal().rotated(randr(0.00)))
		collided.emit(collision.get_collider())
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit(collision)

func randr(val):
	return randf_range(-val, val)

