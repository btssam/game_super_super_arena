extends Node
class_name EnemyDamaged

#handles being damaged and dying

@export var max_hp := 3
@export var hp := 3
@export var is_dead := false

@onready var animated_sprite := %AnimatedSprite2D
@onready var animation_player := %AnimationPlayer
@onready var hp_bar = %HPBar


func _ready():
	animated_sprite.animation_finished.connect(_on_sprite_animation_finished)
	animation_player.animation_finished.connect(_on_player_animation_finished)
	
	hp_bar.max_value = max_hp
	hp_bar.value = hp
	

func _on_sprite_animation_finished():
	if animated_sprite.animation == 'hurt':
		animated_sprite.play("default")

func _on_player_animation_finished(anim_name: StringName):
	if anim_name == "dead":
		pass
		
	else:
		pass


func hit_by_jab(damage):
	if is_dead:
		return
	hp -= damage
	hp_bar.value = hp
	if hp > 0:
		animated_sprite.stop()
		#animation_player.stop()
		animation_player.call_deferred("stop")
		animated_sprite.play("hurt")
	else:
		is_dead = true
		animated_sprite.stop()
		face_dead_animation()
		animation_player.play("dead")

func face_dead_animation():
	var direction := 1.0
	var anim = animation_player.get_animation("dead") as Animation
	var sprite_track := anim.find_track(NodePath("AnimatedSprite2D:position"), Animation.TYPE_VALUE)
	var shadow_track := anim.find_track(NodePath("Shadow:position"), Animation.TYPE_VALUE)
	var hp_bar_track := anim.find_track(NodePath("HPBar:position"), Animation.TYPE_VALUE)
	if sprite_track == -1 or shadow_track == -1 or hp_bar_track == -1:
		print('dead track not found on enemy')
		return
	if animated_sprite.flip_h:
		direction = -1.0
	
	for i in anim.track_get_key_count(sprite_track):
		var value: Vector2 = anim.track_get_key_value(sprite_track, i)
		value.x = absf(value.x) * direction
		anim.track_set_key_value(sprite_track, i, value)
	
	for i in anim.track_get_key_count(shadow_track):
		var value: Vector2 = anim.track_get_key_value(shadow_track, i)
		value.x = absf(value.x) * direction
		anim.track_set_key_value(shadow_track, i, value)
		
	var hp_bar_base_x = hp_bar.position.x

	for i in anim.track_get_key_count(hp_bar_track):
		var value: Vector2 = anim.track_get_key_value(hp_bar_track, i)
		var distance_from_base := absf(value.x - hp_bar_base_x)
		value.x = hp_bar_base_x + distance_from_base * direction
		anim.track_set_key_value(hp_bar_track, i, value)
