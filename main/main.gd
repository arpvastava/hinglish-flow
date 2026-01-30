extends Node
class_name Main

@export_group("UI")
@export var input_te: TextEdit
@export var preview_te: TextEdit
@export var transliterate_btn: Button

@export_group("Functionality")
@export var transliterate_llm: TransliterateLLM


func _ready() -> void:
	transliterate_btn.pressed.connect(_transliterate)
	transliterate_llm.transliteration_received.connect(_on_transliteration_received)
	
	input_te.grab_focus()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("transliterate"):
		_transliterate()


func _transliterate() -> void:
	transliterate_llm.ask_gemini(input_te.text)


func _on_transliteration_received(text: String) -> void:
	preview_te.text = text
