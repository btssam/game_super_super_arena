extends Node
class_name PlayerDamaged

#handles incoming damage from enemies and dying

@export var hp := 1
@export var is_dead := false

@onready var animated_sprite := %AnimatedSprite2D
@onready var animation_player := %AnimationPlayer
@onready var hp_bar = %HPBar
@onready var stats = %Stats


func _ready():
	hp_bar.max_value = stats.max_hp
	hp = stats.max_hp
	hp_bar.value = hp

func hit_by_jab(damage):
	if is_dead:
		return
	hp -= damage
	hp_bar.value = hp
	if hp > 0:
		call_deferred("play_hurt_after_interrupt")
	else:
		is_dead = true
		#animated_sprite.stop()
		#face_dead_animation()
		#animation_player.play("dead")



func play_hurt_after_interrupt():
	animation_player.stop()
	animated_sprite.stop()
	animated_sprite.play("hurt")
