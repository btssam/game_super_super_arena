extends Node

var horizontal_movement_axis := 0.0
var vertical_movement_axis := 0.0
var movement_speed := 200.0

@onready var character_body_node = get_owner()
@onready var animated_sprite_2d_node = %AnimatedSprite2D
@onready var animation_player_node = %AnimationPlayer
@onready var hitbox_node = %Hitbox

#signal

func _ready():
	hitbox_node.area_entered.connect(_on_area_entered)

func _process(_delta) -> void:
	if !isAnimating():
		handle_movement()
		handle_attack()


func handle_movement() -> void:
	horizontal_movement_axis = Input.get_axis("Left", "Right")
	vertical_movement_axis = Input.get_axis("Up", "Down")
	character_body_node.velocity.x = horizontal_movement_axis * movement_speed
	character_body_node.velocity.y = vertical_movement_axis * movement_speed
	if character_body_node.velocity.x != 0.0:
		animated_sprite_2d_node.play("move")
		animated_sprite_2d_node.flip_h = horizontal_movement_axis < 0
		if animated_sprite_2d_node.flip_h:
			hitbox_node.scale.x = -1.0
		else:
			hitbox_node.scale.x = 1.0
	elif character_body_node.velocity.y != 0.0:
		animated_sprite_2d_node.play("move")
	else:
		animated_sprite_2d_node.play("default")
	character_body_node.move_and_slide()

func handle_attack() -> void:
	if Input.is_action_just_pressed("A"):
		animation_player_node.play("jab")


func isAnimating() -> bool:
	if animated_sprite_2d_node.is_playing():
#	add all uninteruptable animations here
		if animation_player_node.current_animation == "jab": 
			return true
		else:
			return false
	else:
		return false

func _on_area_entered(area_that_entered: Area2D) -> void:
	if area_that_entered.is_in_group("enemy_hurtbox"):
		var damaged := area_that_entered.get_owner().get_node_or_null("Scripts/Damaged") as EnemyDamaged
		if damaged:
			damaged.hit_by_jab()
