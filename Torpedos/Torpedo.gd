extends KinematicBody2D

onready var global = get_node("/root/Global")
export var damage = 0
export var speed = 8
export var points = 10
onready var HUD = get_node("/root/Game/HUD")
onready var Explosion = load("res://Explosions/Explosion.tscn")
onready var Fish = get_node("/root/Game/Enemy_Instance/Fishs")

func _ready():
	pass
	
func _physics_process(delta):
	position.y -= speed
	
	if global_position.y < -100:
		queue_free()
		
onready var NeedBool = true



func play_sound(sound):
	if NeedBool == true:
		sound.play()


func _on_Area2D_body_entered(body):
	if body.name != "Mine" and body.name != "Whale":
		HUD.update_score(points)
		body.queue_free()
		if body.name == "Fish":
			global.c2 -= 1
		if body.name == "Clam":
			global.c3 -= 1
		if body.name == "Pufferish":
			global.c4 -= 1
		var explosion = Explosion.instance()
		explosion.position = position
		get_node("/root/Game/Explosions").add_child(explosion)
		explosion.get_node("Animation").play()
		queue_free()
	else:
		var explosion = Explosion.instance()
		explosion.position = position
		get_node("/root/Game/Explosions").add_child(explosion)
		explosion.get_node("Animation").play()
		queue_free()
