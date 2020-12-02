extends Control

onready var global = get_node("/root/Global")
onready var score = get_node("/root/Game/HUD/Labels/Score")
onready var lives = get_node("/root/Game/HUD/Labels/Lives")

func _ready():
	update_score(0)
	update_lives(0)
	
func update_score(s):
	global.score += s
	score.text = "Score: " + str(global.score)
		
func update_lives(l):
	global.lives += l
	lives.text = "Lives: " + str(global.lives)
	if global.lives<= 0:
		get_tree().change_scene("res://Screens/End Screen/End.tscn")
		
