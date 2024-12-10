extends Node

class_name TextTyper

var typing_speed: float = 0.05  
var rich_text_label: RichTextLabel = null
var full_text: String = ""
var current_char_index: int = 0
var is_typing: bool = false
var time_accumulator: float = 0.0  

func set_rich_text_label(label: RichTextLabel) -> void:
	rich_text_label = label

func start_typing(text: String, speed: float = 0.02) -> void:
	if rich_text_label:
		full_text = text
		typing_speed = speed
		current_char_index = 0
		rich_text_label.visible_characters = 0 
		is_typing = true  
	else:
		print("Erreur: rich_text_label est null dans start_typing.")

func _process(delta: float) -> void:
	if is_typing:
		time_accumulator += delta

		if time_accumulator >= typing_speed:
			if current_char_index < full_text.length():
				current_char_index += 1
				rich_text_label.visible_characters = current_char_index  
				time_accumulator = 0.0 
			else:
				is_typing = false  

func show_full_text() -> void:
	if rich_text_label: 
		rich_text_label.visible_characters = full_text.length() 
		is_typing = false 
	else:
		print("Erreur: rich_text_label est null dans show_full_text.")

func is_text_typing() -> bool:
	return is_typing
