extends Control

onready var global = get_node("/root/Global")

func _ready():
	pass

func _on_Button_pressed():
	global.lives = 100
	global.score = 0
	get_tree().change_scene("res://Screens/Start Screen/Start.tscn")

func _on_Button2_pressed():
	get_tree().quit()
