extends Node
class_name PlayerDamaged

#handles incoming damage from enemies and dying

@export var max_hp := 5
@export var hp := 5
@export var is_dead := false

@onready var animated_sprite := %AnimatedSprite2D
@onready var animation_player := %AnimationPlayer
@onready var hp_bar = %HPBar

func _ready():
	hp_bar.max_value = max_hp
	hp_bar.value = hp
