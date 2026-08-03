class_name SurvivalPlayer
extends CharacterBody2D

## Minimal controllable player for the Phase 1 movement/camera spike.
## Movement is free-form; aiming is read from the mouse position.

@export var move_speed: float = 220.0
@export var player_color: Color = Color("#d9e6f2")
@export var outline_color: Color = Color("#253241")
@export var aim_color: Color = Color("#f0b45b")

@onready var camera: Camera2D = $Camera2D

func _ready() -> void:
	queue_redraw()

func _physics_process(_delta: float) -> void:
	var input_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_vector * move_speed
	move_and_slide()
	queue_redraw()

func _draw() -> void:
	# Temporary visual placeholder: body, outline and a mouse-facing aim line.
	draw_circle(Vector2.ZERO, 14.0, outline_color)
	draw_circle(Vector2.ZERO, 10.0, player_color)

	var aim_direction := get_global_mouse_position() - global_position
	if aim_direction.length_squared() > 1.0:
		aim_direction = aim_direction.normalized()
		draw_line(aim_direction * 8.0, aim_direction * 25.0, aim_color, 4.0, true)

func get_aim_direction() -> Vector2:
	var direction := get_global_mouse_position() - global_position
	return direction.normalized() if direction.length_squared() > 1.0 else Vector2.RIGHT
