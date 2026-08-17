extends Node

#this script handles movement

@onready var body = get_owner()
@onready var animated_sprite = %AnimatedSprite2D
@onready var hitbox = %Hitbox


var horizontal_movement_axis := 0.0
var vertical_movement_axis := 0.0

@onready var stats = %Stats


func handle_movement() -> void:
	horizontal_movement_axis = Input.get_axis("Left", "Right")
	vertical_movement_axis = Input.get_axis("Up", "Down")
	body.velocity.x = horizontal_movement_axis * stats.movement_speed
	body.velocity.y = vertical_movement_axis * stats.movement_speed
	if body.velocity.x != 0.0:
		animated_sprite.play("move")
		animated_sprite.flip_h = horizontal_movement_axis < 0
		if animated_sprite.flip_h:
			hitbox.scale.x = -1.0
		else:
			hitbox.scale.x = 1.0
	elif body.velocity.y != 0.0:
		animated_sprite.play("move")
	else:
		animated_sprite.play("default")
	body.move_and_slide()
