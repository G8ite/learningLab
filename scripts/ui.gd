extends Control 

@onready var rich_text_label = $PanelContainer/RichTextLabel 
@onready var label_text = $PanelContainer2/Label
@onready var pass_button = $TextureButton

var text_typer: TextTyper = null 

func _ready() -> void:
	print("PassButton visible: ", pass_button.visible)
	text_typer = TextTyper.new()  
	text_typer.set_rich_text_label(rich_text_label) 
	add_child(text_typer) 

func update_dialogue_ui(dialog: Dictionary) -> void:
	rich_text_label.text = dialog["text"] 

	text_typer.start_typing(dialog["text"], 0.05) 


func _on_pass_button_pressed():
	text_typer.show_full_text()
