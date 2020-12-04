extends Node2D

onready var global = get_node("/root/Global")
onready var Enemy = load("res://Enemies/Fish/Fish.tscn")
export var prob = 0.5
export var prob2 = 0.3
var c = 1
var c2 = 0

func _ready():
	randomize()

func _on_Timer_timeout():
	for ch in range(c):
		if global.c2 < 4:
			var enemy = Enemy.instance()
			enemy.position.x = 512
			if randf() < prob2:
				enemy.position.y = 300
			else:
				enemy.position.y = 200
			add_child(enemy)
			global.c2 += 1
		else: 
			pass
		
		
