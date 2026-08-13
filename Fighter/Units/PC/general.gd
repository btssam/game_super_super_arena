extends Node

#general controller

@onready var animation_player_node = %AnimationPlayer
@onready var animated_sprite_2d_node = %AnimatedSprite2D

@onready var f_pc_move_script = %F_PC_Move
@onready var f_pc_attack_script = %F_PC_Attack


func _process(_delta) -> void:
	if !isAnimating():
		f_pc_move_script.handle_movement()
		f_pc_attack_script.handle_attack()


func isAnimating() -> bool:
	if animated_sprite_2d_node.is_playing() or animation_player_node.is_playing():
#	add all uninteruptable animations here
		if animation_player_node.current_animation == "jab": 
			return true
		else:
			return false
	else:
		return false
