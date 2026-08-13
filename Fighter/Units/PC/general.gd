extends Node

#general controller

@onready var animation_player_node = %AnimationPlayer
@onready var animated_sprite_2d_node = %AnimatedSprite2D

@onready var move_script = %Move
@onready var attack_script = %Attack


func _process(_delta) -> void:
	if !isAnimating():
		move_script.handle_movement()
		attack_script.handle_attack()


func isAnimating() -> bool:
	if animated_sprite_2d_node.is_playing() or animation_player_node.is_playing():
#	add all uninteruptable animations here
		if animation_player_node.current_animation == "jab": 
			return true
		else:
			return false
	else:
		return false
