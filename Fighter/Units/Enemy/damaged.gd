extends Node
class_name EnemyDamaged

@export var max_hp := 3
@export var hp := 3

func _ready():
	%AnimatedSprite2D.animation_finished.connect(_on_sprite_animation_finished)
	%AnimationPlayer.animation_finished.connect(_on_player_animation_finished)
	
	%ProgressBar.max_value = max_hp
	%ProgressBar.value = hp
	

func hit_by_jab(damage):
	hp -= damage
	%ProgressBar.value = hp
	if hp > 0:
		%AnimatedSprite2D.play("hurt")
	else:
		%AnimatedSprite2D.stop()
		%AnimationPlayer.play("dead")
	

func _on_sprite_animation_finished():
	if %AnimatedSprite2D.animation == 'hurt':
		%AnimatedSprite2D.play("default")

func _on_player_animation_finished(anim_name: StringName):
	if anim_name == "dead":
		print('queue_free?')
	else:
		print(anim_name + " animationplayer animation has finished.")
