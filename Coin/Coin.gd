extends KinematicBody2D

const GRAVITY = 75.0
var velocity = Vector2()
onready var HUD = get_node("/root/Game/HUD")

export var speed = Vector2(0,3)
export var damage = 25


onready var effect_explosion = get_node("/root/Game/Sound_Effects/Coin")
onready var NeedBool = true

func play_sound(sound):
	if NeedBool == true:
		sound.play()

func _ready():
	randomize()
	play_sound(effect_explosion)

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	var motion = velocity * delta
	move_and_collide(motion)
	
	if position.y > get_viewport().size.y + 100:
		queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		HUD.update_score(damage)
		queue_free()
	
	

