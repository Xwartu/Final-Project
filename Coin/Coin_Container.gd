extends Node2D

onready var Enemy = load("res://Coin/Coin.tscn")
export var prob = 0.4

func _ready():
	randomize()

onready var width = get_viewport().size.x

func _on_Timer_timeout():
	if randf() < prob:
		var enemy = Enemy.instance()
		enemy.position.x = randi() % int(1.2*float(width))
		enemy.position.y = -100
		enemy.speed = Vector2(1, (randi() % 5)+1)
		add_child(enemy)
		$Timer.start()
