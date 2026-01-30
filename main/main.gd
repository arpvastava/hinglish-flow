extends Node
class_name Main


@export_group("UI")
@export var input_te: TextEdit
@export var preview_te: TextEdit
@export var transliterate_btn: Button

@export_group("Functionality")
@export var transliterate_llm: TransliterateLLM

var is_transliterating: bool = false:
	get:
		return is_transliterating
	set(value):
		is_transliterating = value
		
		preview_te.text = ""
		transliterate_btn.disabled = is_transliterating


func _ready() -> void:
	transliterate_btn.pressed.connect(_transliterate)
	transliterate_llm.transliteration_received.connect(_on_transliteration_received)
	transliterate_llm.transliteration_failed.connect(_on_transliteration_failed)
	
	input_te.grab_focus()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("transliterate"):
		_transliterate()


func _transliterate() -> void:
	is_transliterating = true
	transliterate_llm.ask_chatgpt(input_te.text)


func _on_transliteration_received(text: String) -> void:
	is_transliterating = false
	preview_te.text = text


func _on_transliteration_failed(_message: String) -> void:
	is_transliterating = false
