extends Sprite2D
# All of the text to scroll
@onready var label = $DoggyText
signal time_for_a_walk

var dialog_list = [
	[
		"Hello! You must\nbe Dan",
		"Welcome to Camp!\nWoof! I'm here to\nshow you around",
		"Let me show you\nwhere we begin"
	],
	[
		"Oh! This gate appears to be locked!",
		"Where's your ice cream sandwich key? ... You don't have any??",
		"There's only one way at camp to get ice cream sandwiches and it's...",
		"FILLING OUT FORMS!!!",
		"Have you filled out any of forms yet? Let's check your status bar.",
		"Crikey, your clipboard is empty! You haven't filled out any forms. Please go to your campanion app and come back when you've got one done."
	]
]

var dialog_index = 0
var dialog_tree_index = 0
var willing_to_engage_in_speaking = true
var currently_speaking = false

func _input(event):
	if event.is_action_pressed("ui_select") and currently_speaking:
		var d = dialog_list[dialog_tree_index][dialog_index]
		var d2 = dialog_list[dialog_tree_index]
		print("dialog index ", dialog_index, " ", len(d2))
		await set_ticker_text(d)
		await get_tree().create_timer(0.1).timeout
		if dialog_index == len(d2) - 1:
			currently_speaking = false
			visible = false
			willing_to_engage_in_speaking = false
			dialog_index = 0
			emit_signal("time_for_a_walk")
		
		if dialog_index < len(d2):
			dialog_index += 1
		

func _on_area_2d_body_entered(body):
	if "is_player" in body and body.is_player == true and willing_to_engage_in_speaking and !currently_speaking:
		visible = true
		currently_speaking = true
		await set_ticker_text(dialog_list[dialog_tree_index][dialog_index])
		dialog_index += 1

func set_ticker_text(text):
	label.text = ""
	for char in text:
		# Append the character to the variable
		label.text += char
		await get_tree().create_timer(0.0007).timeout

func _on_path_2d_all_done_walking():
	dialog_index = 0
	dialog_tree_index += 1
	willing_to_engage_in_speaking = true

