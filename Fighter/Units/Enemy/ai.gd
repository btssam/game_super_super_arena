extends Node
class_name EnemyAI

#handles ai like, attacking and moving

@export var target: Node2D
@export var move_speed:= 120.0
@export var attack_range:= 180.0
@export var attack_cooldown:= 0.8

@onready var body := get_owner() as CharacterBody2D
@onready var animated_sprite := %AnimatedSprite2D
@onready var animation_player := %AnimationPlayer
@onready var hitbox := %Hitbox



var attack_cooldown_remaining := 0.0
var distance_to_target: float
var direction_to_target: Vector2

func _ready() -> void:
	if target == null:
		target = get_tree().get_first_node_in_group("player") as Node2D

func handle_ai(delta: float) -> void:
	if target == null:
		idle()
		return
	attack_cooldown_remaining = maxf(attack_cooldown_remaining - delta, 0.0)
	distance_to_target = body.global_position.distance_to(target.global_position)
#	not a very robust check - will start hitting air if i am above or below enemy
	if distance_to_target > attack_range:
		move_toward_target()
	else:
		stop_and_attack()
	

func move_toward_target() -> void:
	direction_to_target = body.global_position.direction_to(target.global_position)
	body.velocity = direction_to_target * move_speed
	body.move_and_slide()
	animated_sprite.play("move")
	flip_sprite(direction_to_target)

func stop_and_attack():
	direction_to_target = body.global_position.direction_to(target.global_position)
	flip_sprite(direction_to_target)
	body.velocity = Vector2.ZERO
	body.move_and_slide()
#	vvv this needs another pass when i add more animations to the player. with the only animation being the dead animation, it makes sense to return and not run stop_attack() - maybe not true for future anims
	if animation_player.is_playing():
		return
	if attack_cooldown_remaining > 0.0:
		animated_sprite.play("default")
		return
	attack_cooldown_remaining = attack_cooldown
	attack()

func flip_sprite(direction_to_target):
	animated_sprite.flip_h = direction_to_target.x > 0.0
	if animated_sprite.flip_h:
		hitbox.scale.x = 1.0
	else:
		hitbox.scale.x = -1.0
	#animation_player.set_keyframe("dead").position


func attack() -> void:
	#needs replaced with animationplayer to enable hitbox
	animated_sprite.stop()
	animated_sprite.play("jab")
	

func idle():
	body.velocity = Vector2.ZERO
	body.move_and_slide()
	animated_sprite.play("default")

func stop_motion() -> void:
	body.velocity = Vector2.ZERO
	body.move_and_slide()
