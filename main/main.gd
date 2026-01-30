extends Node
class_name Main

@export var input_te: TextEdit
@export var preview_te: TextEdit
@export var transliterate_btn: Button


func _ready() -> void:
	transliterate_btn.pressed.connect(_transliterate)
	input_te.grab_focus()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("transliterate"):
		_transliterate()


func _transliterate() -> void:
	preview_te.text = input_te.text
