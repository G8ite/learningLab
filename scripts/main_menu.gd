extends Node2D

func _on_jouer_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_quitter_pressed():
	get_tree().quit()
