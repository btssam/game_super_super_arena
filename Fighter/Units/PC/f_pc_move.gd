extends Node

#this script handles movement


@onready var character_body_node = get_owner()
@onready var animated_sprite_2d_node = %AnimatedSprite2D
@onready var hitbox_node = %Hitbox


var horizontal_movement_axis := 0.0
var vertical_movement_axis := 0.0

@onready var stats = %Stats


func handle_movement() -> void:
	horizontal_movement_axis = Input.get_axis("Left", "Right")
	vertical_movement_axis = Input.get_axis("Up", "Down")
	character_body_node.velocity.x = horizontal_movement_axis * stats.movement_speed
	character_body_node.velocity.y = vertical_movement_axis * stats.movement_speed
	if character_body_node.velocity.x != 0.0:
		animated_sprite_2d_node.play("move")
		animated_sprite_2d_node.flip_h = horizontal_movement_axis < 0
		if animated_sprite_2d_node.flip_h:
			hitbox_node.scale.x = -1.0
		else:
			hitbox_node.scale.x = 1.0
	elif character_body_node.velocity.y != 0.0:
		animated_sprite_2d_node.play("move")
	else:
		animated_sprite_2d_node.play("default")
	character_body_node.move_and_slide()
