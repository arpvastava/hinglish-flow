extends Node
class_name TransliterateLLM

signal transliteration_received

@export_multiline var system_prompt: String
@export var http_request: HTTPRequest


func _ready() -> void:
	http_request.request_completed.connect(_on_request_completed)


func ask_gemini(text: String) -> void:
	var url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent?key=%s" % ENV.GEMINI_API
	
	var data = {
		"system_instruction": {
			"parts": [
				{
					"text": system_prompt
				}
			]
		},
		"contents": [
			{
				"parts": [
					{
						"text": text
					}
				]
			}
		]
	}
	
	var error = http_request.request(
		url,
		[
			"Content-Type: application/json"
		],
		HTTPClient.METHOD_POST,
		JSON.stringify(data)
	)
	
	if error != OK:
		print("An error occured in HTTP request")


func _on_request_completed(result: int, response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	if result != 0 or response_code != 200:
		print("Something went wrong")
	
	var data: Dictionary = JSON.parse_string(body.get_string_from_utf8())
	var text: String = data.candidates[0].content.parts[0].text
	transliteration_received.emit(text)
