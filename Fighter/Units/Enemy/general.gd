extends Node

#decides if unit is busy

@onready var ai_script := %AI as EnemyAI
@onready var damaged_script := %Damaged as EnemyDamaged
@onready var animated_sprite := %AnimatedSprite2D
@onready var animation_player := %AnimationPlayer

@export var isBusy:= false

func _physics_process(delta):
	if damaged_script.is_dead:
		#ai_script.stop_motion()
		return
		

	if is_busy():
		ai_script.stop_motion()
		return
	
	ai_script.handle_ai(delta)

#dont run ai becaue an animation/action is happening
func is_busy() -> bool:
	if animation_player.is_playing():
		return true
	if animated_sprite.animation == "hurt" and animated_sprite.is_playing():
		return true
	if animated_sprite.animation == "jab" and animated_sprite.is_playing():
		return true
	return false
