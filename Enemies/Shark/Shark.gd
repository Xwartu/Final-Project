extends KinematicBody2D

onready var player = null 
onready var ray = $RayCast2D
export var speed = 550
export var looking_speed = 100
var damage = 12
onready var HUD = get_node("/root/Game/HUD")
onready var Explosion = load("res://Explosions/Explosion.tscn")
onready var global = get_node("/root/Global")
var direction = 0

func _physics_process(_delta):
	if player == null:
		player = get_node("/root/Game/Player_Instance/Player")
	else:
		ray.cast_to = ray.to_local(player.global_position)
		var x = ray.get_collision_point()
		if position.x < player.global_position.x:
			direction = 1
		if position.x > player.global_position.x:
			direction = -1
		var c = ray.get_collider()
		if c:
			var velocity = ray.cast_to.normalized()*looking_speed
			if c.name == "Player":
				velocity = ray.cast_to.normalized()*speed
			if direction < 0 and !$Sprite.flip_h:
				$Sprite.look_at(x)
				$Sprite.global_rotation_degrees += 180
				$Sprite.flip_h = true
			if direction > 0 and $Sprite.flip_h:
				$Sprite.look_at(x) 
				$Sprite.global_rotation_degrees += 180
				$Sprite.flip_h = false
			move_and_slide(velocity, Vector2(0,0))



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		HUD.update_lives(-damage)
		var explosion = Explosion.instance()
		explosion.position = position
		get_node("/root/Game/Explosions").add_child(explosion)
		explosion.get_node("Animation").play()
		queue_free()
