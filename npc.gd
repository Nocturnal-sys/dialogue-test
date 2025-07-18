extends StaticBody2D
class_name Npc
@onready var this_sprite: Sprite2D = $sprite
@onready var down: RayCast2D = $Down
@onready var left: RayCast2D = $Left
@onready var right: RayCast2D = $Right
@onready var up: RayCast2D = $Up
@onready var path: PathFollow2D = $Path2D/PathFollow2D
@onready var e: Sprite2D = $Path2D/PathFollow2D/E
@onready var npc: Npc = $"."

@export var lines: Array[String]

var is_colliding := false
var reverse_e := false


func _process(delta: float) -> void:

	path.progress_ratio += 1 * delta

	if down.is_colliding() or up.is_colliding() or left.is_colliding() or right.is_colliding():
		e.visible = true
		is_colliding = true
	else:
		e.visible = false
		is_colliding = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if is_colliding:
			DialogueManager.start_dialogue(global_position, lines)
