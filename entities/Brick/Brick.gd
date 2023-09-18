@tool
extends "res://Entities/Wall/Wall.gd"

@onready var MyMaterial = $Sprite2D.get_material()
@onready var Animator = $AnimationPlayer

@export var level = 1
@export var Unbreakable = false
@export var Unkillable = false

var color = [
	Color(1.0, 0.0, 0.0),    # Red
	Color(0.0, 1.0, 0.0),    # Green
	Color(0.0, 0.0, 1.0),    # Blue
	Color(1.0, 1.0, 0.0),    # Yellow
	Color(1.0, 0.0, 1.0),    # Magenta
	Color(0.0, 1.0, 1.0),     # Cyan
	Color(1.0, 1.0, 1.0)     # White
]


func _ready():
	update_style()

func _process(delta):
	if Engine.is_editor_hint():
		update_style()


func hit(collision):
	if Unbreakable:
		pass
	elif level > 1:
		level -= 1
	elif !Unkillable:
		kill()
	
	update_style()
	MyMaterial.set_shader_parameter("normal", collision.get_normal().rotated(-global_rotation))
	Animator.stop()
	Animator.play("brick_shine")


func update_style():
	MyMaterial.set_shader_parameter("level",color[level-1])

func award_points():
	return level


func kill():
	queue_free()
	pass
