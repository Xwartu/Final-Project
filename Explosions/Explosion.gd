extends Node2D


func _on_Animation_animation_finished():
	queue_free()
