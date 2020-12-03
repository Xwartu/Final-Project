extends Node2D

onready var global = get_node("/root/Global")
onready var Enemy = load("res://Enemies/Pufferfish/Pufferfish.tscn")
export var prob = 0.5
export var prob2 = 0.3
var c = 1

func _ready():
	randomize()

func _on_Timer_timeout():
	for ch in range(c):
		if global.c4 < 1:
			var enemy = Enemy.instance()
			enemy.position.x = 512
			enemy.position.y = -200
			add_child(enemy)
			global.c4 += 1
		else: 
			pass
		
		
