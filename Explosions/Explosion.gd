extends Node2D

onready var NeedBool = true

func play_sound(sound):
	if NeedBool == true:
		sound.play()


onready var effect_explosion = get_node("/root/Game/Sound_Effects/Explosion")

func _on_Animation_animation_finished():
	play_sound(effect_explosion)
	queue_free()
