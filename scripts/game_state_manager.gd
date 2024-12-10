extends Node

const JSON_PATH = "res://scripts/dialog.json"
var dialogues = {}

# Chargement de l'état du jeu
func load_game_state(save_path: String) -> Dictionary:
	var game_state = {}
	var file = FileAccess.open(save_path, FileAccess.READ)
	if file:
		game_state = file.get_var()  # Charger tout l'état du jeu à partir du fichier
		file.close()
	else:
		print("Aucun état de sauvegarde trouvé pour le chemin: ", save_path)
	return game_state

# Sauvegarde de l'état du jeu
func save_game_state(save_path: String, game_state: Dictionary) -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file:
		file.store_var(game_state)  # Enregistrer tout l'état du jeu dans un fichier
		file.close()
	else:
		print("Impossible d'enregistrer l'état de sauvegarde pour le chemin: ", save_path)

# Chargement des dialogues
func load_dialogues() -> void:
	var file = FileAccess.open(JSON_PATH, FileAccess.READ)
	if file:
		var json_data = file.get_as_text()
		file.close()

		var json = JSON.new()
		var parse_result = json.parse(json_data)

		if parse_result == OK:
			dialogues = json.get_data()
			if dialogues.has("dialogs"):
				print("Les dialogues ont été chargés avec succès.")
			else:
				print("Erreur : clé 'dialogs' manquante dans le JSON.")
		else:
			print("Erreur lors du parsing du JSON :", parse_result)
	else:
		print("Erreur : impossible de charger le fichier JSON des dialogues")

# Récupération d'un dialogue spécifique
func get_dialog(dialog_id: int) -> Dictionary:
	if dialogues.has("dialogs"):
		for dialog in dialogues["dialogs"]:
			if dialog["id"] == dialog_id:
				return dialog
	else:
		print("Erreur : clé 'dialogs' introuvable.")
	return {}
