extends Node

#this script handles movement

@onready var animation_player = %AnimationPlayer
@onready var hitbox = %Hitbox

@onready var stats = %Stats

func _ready():
	hitbox.area_entered.connect(_on_area_entered)

#this likely should be made more generic
func _on_area_entered(area_that_entered: Area2D) -> void:
	if area_that_entered.is_in_group("enemy_hurtbox"):
		var damaged := area_that_entered.get_owner().get_node_or_null("Scripts/Damaged") as EnemyDamaged
		if damaged:
			damaged.hit_by_jab(stats.jab_damage)

func handle_attack() -> void:
	if Input.is_action_just_pressed("A"):
		animation_player.play("jab")
