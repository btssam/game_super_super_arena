extends Node

#general controller

@onready var animation_player = %AnimationPlayer
@onready var animated_sprite = %AnimatedSprite2D

@onready var move_script = %Move
@onready var attack_script = %Attack


func _physics_process(_delta) -> void:
	if !isAnimating():
		move_script.handle_movement()
		attack_script.handle_attack()


func isAnimating() -> bool:
	if animated_sprite.is_playing() or animation_player.is_playing():
#	add all uninteruptable animations here
		if animation_player.current_animation == "jab": 
			return true
		else:
			return false
	else:
		return false
