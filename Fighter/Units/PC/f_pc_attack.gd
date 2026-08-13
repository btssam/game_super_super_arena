extends Node

#this script handles movement

@onready var animation_player_node = %AnimationPlayer
@onready var hitbox_node = %Hitbox

@onready var stats = %Stats

func _ready():
	hitbox_node.area_entered.connect(_on_area_entered)
	
func handle_attack() -> void:
	if Input.is_action_just_pressed("A"):
		animation_player_node.play("jab")


func _on_area_entered(area_that_entered: Area2D) -> void:
	if area_that_entered.is_in_group("enemy_hurtbox"):
		var damaged := area_that_entered.get_owner().get_node_or_null("Scripts/Damaged") as EnemyDamaged
		if damaged:
			damaged.hit_by_jab(stats.jab_damage)
