extends KinematicBody2D

onready var Bullet = load("res://Enemies/Projectiles/Bone.tscn")

export var move_probability = 0.5
export var shoot_probability = 0.7
export var speed = 100
onready var w = int(get_viewport_rect().size.x)
onready var h = int(get_viewport_rect().size.y)
var damage = 0
var velocity = Vector2(100,0)
var velocity2 = Vector2(-100,10)


func _ready():
	randomize()

func _physics_process(delta):
	move_and_slide(velocity)



func shoot():
	var bullet = Bullet.instance()
	bullet.position = position + Vector2(0,15)
	get_node("/root/Game/Bones").add_child(bullet)


func _on_Shoot_timeout():
	if randf() < move_probability:
		shoot()



func _on_Area2D_body_entered(body):
	if body.name == "Box2":
		velocity.x = -100
		$Sprite.flip_h = true
		#velocity.y = 10
	if body.name == "Box1":
		velocity.x = 100
		$Sprite.flip_h = false
		#velocity.y = -10
		
		
