extends KinematicBody2D

onready var Bullet = load("res://Enemies/Projectiles/Pearl.tscn")

export var move_probability = 0.5
export var shoot_probability = 0.7
export var speed = 75
var damage = 0
var velocity = Vector2(75,0)


func _ready():
	randomize()

func _physics_process(delta):
	move_and_slide(velocity)



func shoot():
	var bullet = Bullet.instance()
	bullet.position = position + Vector2(0,10)
	get_node("/root/Game/Pearls").add_child(bullet)


func _on_Shoot_timeout():
	if randf() < move_probability:
		shoot()



func _on_Area2D_body_entered(body):
	if body.name == "Box2":
		velocity.x = -75
	if body.name == "Box1":
		velocity.x = 75
