extends Node2D

## Temporary Phase 1 test level.
## Uses simple draw calls so the movement/camera spike has no art dependency.

@export var grid_size: float = 64.0
@export var world_rect := Rect2(-640.0, -360.0, 1280.0, 720.0)

func _ready() -> void:
	queue_redraw()

func _draw() -> void:
	draw_rect(world_rect, Color("#17202a"), true)

	var start_x = floor(world_rect.position.x / grid_size) * grid_size
	var start_y = floor(world_rect.position.y / grid_size) * grid_size
	var end_x := world_rect.end.x
	var end_y := world_rect.end.y

	for x in range(int(start_x), int(end_x) + 1, int(grid_size)):
		draw_line(Vector2(x, world_rect.position.y), Vector2(x, world_rect.end.y), Color("#202c38"), 1.0)
	for y in range(int(start_y), int(end_y) + 1, int(grid_size)):
		draw_line(Vector2(world_rect.position.x, y), Vector2(world_rect.end.x, y), Color("#202c38"), 1.0)

	# Temporary room/cover shapes. Collision geometry is defined in the scene.
	draw_rect(Rect2(-420, -220, 300, 80), Color("#475563"), true)
	draw_rect(Rect2(120, -180, 80, 300), Color("#475563"), true)
	draw_rect(Rect2(-80, 140, 360, 64), Color("#475563"), true)
	draw_string(ThemeDB.fallback_font, Vector2(-580, -310), "SURVIVAL — movement and camera test", HORIZONTAL_ALIGNMENT_LEFT, -1, 18, Color("#c8d6e5"))
	draw_string(ThemeDB.fallback_font, Vector2(-580, 330), "WASD: move   Mouse: aim   ESC: release mouse", HORIZONTAL_ALIGNMENT_LEFT, -1, 16, Color("#9fb3c8"))
