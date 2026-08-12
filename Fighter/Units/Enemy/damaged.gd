extends Node
class_name EnemyDamaged

@export var max_hp := 3
@export var hp := 3

func _ready():
	%AnimatedSprite2D.animation_finished.connect(_on_animation_finished)
	%ProgressBar.max_value = max_hp
	%ProgressBar.value = hp
	

func hit_by_jab(damage):
	hp -= damage
	%ProgressBar.value = hp
	if hp > 0:
		%AnimatedSprite2D.play("hurt")
	else:
		print('dead')
	

func _on_animation_finished():
	if %AnimatedSprite2D.animation == 'hurt':
		%AnimatedSprite2D.play("default")
