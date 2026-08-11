extends Node

var horizontal_movement_axis := 0.0
var vertical_movement_axis := 0.0
var movement_speed := 200.0

@onready var character_body_node = get_owner()


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !isAnimating():
		handle_movement()
		handle_attack()


func handle_movement():
	horizontal_movement_axis = Input.get_axis("Left", "Right")
	vertical_movement_axis = Input.get_axis("Up", "Down")
	character_body_node.velocity.x = horizontal_movement_axis * movement_speed
	character_body_node.velocity.y = vertical_movement_axis * movement_speed
	if character_body_node.velocity.x != 0.0:
		%AnimatedSprite2D.play("move")
		%AnimatedSprite2D.flip_h = horizontal_movement_axis < 0
	elif character_body_node.velocity.y != 0.0:
		%AnimatedSprite2D.play("move")
	else:
		%AnimatedSprite2D.play("default")
	character_body_node.move_and_slide()

func handle_attack():
	if Input.is_action_just_pressed("A"):
		%AnimatedSprite2D.play("jab")

func isAnimating():
	if %AnimatedSprite2D.is_playing():
#	add all uninteruptable animations here
		if %AnimatedSprite2D.animation == "jab": 
			return true
		else:
			return false
