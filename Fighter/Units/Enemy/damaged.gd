class_name EnemyDamaged
extends Node

func _ready():
	%AnimatedSprite2D.animation_finished.connect(_on_animation_finished)

func hit_by_jab():
	%AnimatedSprite2D.play("hurt")

func _on_animation_finished():
	if %AnimatedSprite2D.animation == 'hurt':
		%AnimatedSprite2D.play("default")
		print('done')
