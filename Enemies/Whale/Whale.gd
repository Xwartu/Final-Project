extends KinematicBody2D

export var speed = 4
export var damage = 0
export var points = 0
onready var HUD = get_node("/root/Game/HUD")
onready var Explosion = load("res://Explosions/Explosion.tscn")
var velocity = Vector2(60,0)

func _ready():
	randomize()

func _physics_process(delta):
	move_and_slide(velocity)
	
	if global_position.x > 1300:
		queue_free()



func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.name == "Torpedo":
		var explosion = Explosion.instance()
		explosion.position = position
		get_node("/root/Game/Explosions").add_child(explosion)
		explosion.get_node("Animation").play()
