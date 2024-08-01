extends Sprite2D
# All of the text to scroll
@onready var label = $DoggyText
signal time_for_a_walk

var _dialog_list = [
	[
		["Hello! You must be Dan."],
		["My name is Javi."],
		["Welcome to Camp. I guess I'll show you around."]
	],
	[
		["Why's this gate locked"],
		["Where's your ice cream sandwich key? ...", "You don't have any??"],
		["There's only one way at camp to get", "ice cream sandwiches and it's...", "by bringing me Diet Coke", "........", "Or", "Filling out your onboarding forms !!!!"],
		["Have you filled out any forms yet?", "Let's check your status bar."],
		["Crikey, your clipboard is empty!",  "You haven't filled out any forms.", "Please go to your Campanion App",  "and come back when you've got one done."]
	]
]
var _intro_dialog_index = 0
var _instructional_dialog_index = 1

var _dialog_index = 0
var _dialog_tree_index = 0
var _willing_to_engage_in_speaking = true
var _currently_speaking = false
var _done_talking

var _speaking_speed = 0.05
var _speaking_pause = 1

func _input(event):
	# Input event handler, don't handle input unless it's a "select" input or
	# Javi is currently speaking
	if event.is_action_pressed("ui_select") and visible and !_currently_speaking and !_done_talking:
		# Get some local variables
		var _current_dialog = _dialog_list[_dialog_tree_index][_dialog_index]
		var _current_dialog_tree = _dialog_list[_dialog_tree_index]

		# Increment dialog 
		if _dialog_index < len(_current_dialog_tree):
			_dialog_index += 1

		await _set_dialog(_current_dialog)

		# If dialog has reached the end
		if _dialog_index == len(_current_dialog_tree):
			visible = false
			_willing_to_engage_in_speaking = false
			_dialog_index = 0
			if _dialog_tree_index == _intro_dialog_index:
				emit_signal("time_for_a_walk")
			if _dialog_tree_index == _instructional_dialog_index:
				_done_talking = true
		
		
func _on_area_2d_body_entered(body):
	if "is_player" in body and body.is_player == true and _willing_to_engage_in_speaking and !visible:
		visible = true
		await _set_dialog(_dialog_list[_dialog_tree_index][_dialog_index])
		# The first dialog is automatic
		_dialog_index += 1

func _on_path_2d_all_done_walking():
	_dialog_index = 0
	_dialog_tree_index += 1
	_willing_to_engage_in_speaking = true

func _set_dialog(text):
	_currently_speaking = true
	# Always reset text when calling ticker text
	label.text = ""
	for line in text:
		label.text = ""
		for char in line:
			# Append the character to the variable
			label.text += char
			await get_tree().create_timer(_speaking_speed).timeout
		await get_tree().create_timer(_speaking_pause).timeout

	_currently_speaking = false 

