extends Node2D

func _ready() -> void:
	GameStateManager.load_dialogues()
	var save_path = "res://game_state.dat"
	if not FileAccess.file_exists(save_path):
		print("Aucun fichier de sauvegarde trouvé, création...")
		GameStateManager.initialize_game_state(save_path)
	else:
		print("Fichier de sauvegarde détecté :", save_path)
