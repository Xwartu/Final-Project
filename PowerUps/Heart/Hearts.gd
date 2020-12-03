extends Node2D

onready var Enemy = load("res://Coin/Coin.tscn")
export var prob = 0.2

func _ready():
	randomize()

onready var width = get_viewport().size.x

func _on_Timer_timeout():
	if randf() < prob:
		var enemy = Enemy.instance()
		enemy.position.x = randi() % int(width)
		enemy.position.y = -100
		enemy.speed = Vector2(0, (randi() % 5)+10)
		add_child(enemy)
