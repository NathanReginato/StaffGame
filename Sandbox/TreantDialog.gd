extends Sprite2D

@onready var label = $TreantText
signal time_for_a_walk

var dialog_list = [
	"Congratulations on getting your first ice cream sandwich Dan!"
	,"You're now officially on the leaderboard."
	,"Press X at anytime to check it out."
	,"The only two ways to gain points are by filling out forms and collecting tokens!"
	,"There may even be one in this office now!"
	,"Good luck!"
	]
	
var first_time = true
var dialog_index = 0
var dialog_tree_index = 0
var willing_to_engage_in_speaking = true
var currently_speaking = false

func _input(event):
	if event.is_action_pressed("ui_select") and currently_speaking:
		var d = dialog_list[dialog_index]
		var d2 = dialog_list
		print("dialog index ", dialog_index, " ", len(d2))
		await set_ticker_text(d)
		await get_tree().create_timer(0.1).timeout
		if dialog_index == len(dialog_list) - 1:
			currently_speaking = false
			visible = false
			willing_to_engage_in_speaking = false
			first_time = false
			dialog_index = 0
		
		if dialog_index < len(dialog_list):
			dialog_index += 1
		

func _on_area_2d_body_entered(body):
	if "is_player" in body and body.is_player == true and willing_to_engage_in_speaking and !currently_speaking and first_time:
		visible = true
		currently_speaking = true
		await set_ticker_text(dialog_list[dialog_index])
		dialog_index += 1

func set_ticker_text(text):
	label.text = ""
	for char in text:
		# Append the character to the variable
		label.text += char
		await get_tree().create_timer(0.0007).timeout
