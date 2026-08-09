extends Node2D

var horizontal_movement_axis := 0.0
var vertical_movement_axis := 0.0
var movement_speed := 200.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	horizontal_movement_axis = Input.get_axis("Left", "Right")
	#print(horizontal_movement_axis)
	vertical_movement_axis = Input.get_axis("Up", "Down")
	#print(vertical_movement_axis)
	%CharacterBody2D.velocity.x = horizontal_movement_axis * movement_speed
	if %CharacterBody2D.velocity.x != 0.0:
		%AnimatedSprite2D.play("move")
		#%AnimatedSprite2D.speed_scale = abs(horizontal_movement_axis)
		%AnimatedSprite2D.flip_h = horizontal_movement_axis < 0
	elif %CharacterBody2D.velocity.y != 0.0:
		%AnimatedSprite2D.play("move")
	else:
		%AnimatedSprite2D.play("default")
		#%AnimatedSprite2D.speed_scale = 1.0
	%CharacterBody2D.velocity.y = vertical_movement_axis * movement_speed
	%CharacterBody2D.move_and_slide()
	


#from other script
#func handle_horizontal_movement() -> void:
	
	#if is_climbing:
		#%CharacterBody2D.velocity.x = 0
	#else:
		#if input_axis:
			#%CharacterBody2D.velocity.x = input_axis * speed
		#else: #stopping gradually
			#%CharacterBody2D.velocity.x = move_toward(%CharacterBody2D.velocity.x, 0, speed)
	#%CharacterBody2D.move_and_slide()
	#update_animations(input_axis)
