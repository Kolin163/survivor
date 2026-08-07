class_name SurvivalCharacter
extends CharacterBody2D

## Shared character scene for the player, NPCs, companions and enemies.
## Controllers and data resources will be attached as the project grows.

@export var character_id: StringName = &"character_placeholder"
@export var move_speed: float = 180.0

func get_aim_direction() -> Vector2:
    var direction := get_global_mouse_position() - global_position
    return direction.normalized() if direction.length_squared() > 1.0 else Vector2.RIGHT
