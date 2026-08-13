extends Node
class_name EnemyAI

@export var target: Node2D
@export var move_speed:= 120.0
@export var attack_range:= 180.0
@export var target_cooldown:= 0.8

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

func _physics_process(delta: float) -> void:
	if target == null:
		idle()
		return
	attack_cooldown_remaining = maxf(attack_cooldown_remaining - delta, 0.0)
	distance_to_target = body.global_position.distance_to(target.global_position)
	if distance_to_target > attack_range:
		move_toward_target()
	else:
		stop_and_attack()

func move_toward_target() -> void:
	direction_to_target = body.global_position.direction_to(target.global_position)
	body.velocity = direction_to_target * move_speed
	body.move_and_slide()
	animated_sprite.play("move")
	animated_sprite.flip_h = direction_to_target.x > 0.0
	if animated_sprite.flip_h:
		hitbox.scale.x = -1.0
	else:
		hitbox.scale.x = 1.0

func stop_and_attack():
	body.velocity = Vector2.ZERO
	body.move_and_slide()


func idle():
	body.velocity = Vector2.ZERO
	body.move_and_slide()
	animated_sprite.play("default")
