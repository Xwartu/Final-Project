extends Control

onready var global = get_node("/root/Global")
onready var score = get_node("/root/Game/HUD/Labels/Score")
onready var lives = get_node("/root/Game/HUD/Labels/Lives")

func _on_Score_high():
	get_tree().change_scene("res://Screens/SceneTransitions/SceneChange2.tscn")

func _ready():
	update_score(0)
	update_lives(0)
	
func update_score(s):
	global.score += s
	score.text = "Score: " + str(global.score)
	if global.score >= 200:
		_on_Score_high()
		update_lives(50)
	
func update_lives(l):
	global.lives += l
	lives.text = "Health: " + str(global.lives)
	if global.lives<= 0:
		get_tree().change_scene("res://Screens/End Screen/End.tscn")
		
