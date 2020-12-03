extends Control

onready var HUD = get_node("/root/Game/HUD")

func _ready():
	pass


func _on_Button_pressed():
	HUD.update_score(200)
