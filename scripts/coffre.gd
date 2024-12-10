extends Control

var player_inattack_zone = false
var dialogue_ui = null
var dialogue_instance = null

var player_scene = null
var game_state_machine = null

var dialogue_id= 1

func _ready():
	player_scene = get_node("/root/Main/Player") 
	
	if player_scene:
		dialogue_ui = player_scene.get_node("CanvasLayer/Control")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		$AnimatedSprite2D.play("ouverture")
		var control = body.get_node("CanvasLayer/Control")
		control.visible = true
		player_inattack_zone = true
		var game_state = GameStateManager.load_game_state("res://game_state.dat")
		dialogue_id = game_state["current_dialog_id"]
		var dialogue = GameStateManager.get_dialog(dialogue_id)
		if dialogue_ui and dialogue:
			dialogue_ui.update_dialogue_ui(dialogue)
		if dialogue_id < 23:
			dialogue_id = dialogue_id+1
		else:
			dialogue_id = 1
		game_state["current_dialog_id"] = dialogue_id
		GameStateManager.save_game_state("res://game_state.dat", game_state)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		var control = body.get_node("CanvasLayer/Control")
		control.visible = false
		player_inattack_zone = false
