extends KinematicBody2D

export var speed = 4
export var damage = 5
export var points = 0
onready var HUD = get_node("/root/Game/HUD")
onready var Explosion = load("res://Explosions/Explosion.tscn")


func _ready():
	pass
	
func _physics_process(delta):
	position.y += speed
	
	if global_position.y > 900:
		queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		HUD.update_lives(-damage)
		var explosion = Explosion.instance()
		explosion.position = position
		get_node("/root/Game/Explosions").add_child(explosion)
		explosion.get_node("Animation").play()
		queue_free()
	if body.name == "Whale":
		var explosion = Explosion.instance()
		explosion.position = position
		get_node("/root/Game/Explosions").add_child(explosion)
		explosion.get_node("Animation").play()
		queue_free()
	
