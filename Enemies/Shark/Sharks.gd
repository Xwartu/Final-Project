extends Node2D

onready var Enemy = load("res://Enemies/Shark/Shark.tscn")
export var prob = 0.7

func _ready():
	randomize()

onready var width = get_viewport().size.x

func _on_Timer_timeout():
	if randf() < prob:
		var enemy = Enemy.instance()
		enemy.position.x = -130
		enemy.position.y = -430
		enemy.speed = Vector2(0, (randi() % 5)+10)
		add_child(enemy)
		$Timer.start()
