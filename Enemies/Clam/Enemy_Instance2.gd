extends Node2D

onready var global = get_node("/root/Global")
onready var Enemy = load("res://Enemies/Clam/Clam.tscn")
export var prob = 0.8
var c = 1

func _ready():
	randomize()


func _on_Timer_timeout():
	for ch in range(c):
		if global.c3 < 4:
			var enemy = Enemy.instance()
			enemy.position.x = 512
			enemy.position.y = 100
			add_child(enemy)
			global.c3 += 1
		else: 
			pass
		
		
