extends KinematicBody2D

const GRAVITY = 75.0
var velocity = Vector2()
onready var HUD = get_node("/root/Game/HUD")

export var speed = Vector2(0,3)
export var damage = 15

func _ready():
	randomize()

onready var Explosion = load("res://Explosions/Explosion.tscn")

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	var motion = velocity * delta
	move_and_collide(motion)
	
	if position.y > get_viewport().size.y + 100:
		queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		HUD.update_lives(-damage)
		var explosion = Explosion.instance()
		explosion.position = position
		get_node("/root/Game/Explosions").add_child(explosion)
		explosion.get_node("Animation").play()
		queue_free()
	else:
		pass
