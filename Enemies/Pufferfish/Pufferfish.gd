extends KinematicBody2D

onready var player = null 
onready var ray = $RayCast2D
export var speed = 150
export var looking_speed = 100
var damage = 4
onready var HUD = get_node("/root/Game/HUD")
onready var Explosion = load("res://Explosions/Explosion.tscn")
onready var global = get_node("/root/Global")


func _physics_process(_delta):
	if player == null:
		player = get_node("/root/Game/Player_Instance/Player")
	else:
		ray.cast_to = ray.to_local(player.global_position)
		var c = ray.get_collider()
		if c:
			var velocity = ray.cast_to.normalized()*looking_speed
			if c.name == "Player":
				velocity = ray.cast_to.normalized()*speed
			move_and_slide(velocity, Vector2(0,0))


func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.name == "Player":
		HUD.update_lives(-damage)
		var explosion = Explosion.instance()
		explosion.position = position
		get_node("/root/Game/Explosions").add_child(explosion)
		explosion.get_node("Animation").play()
		queue_free()
