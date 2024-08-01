extends Sprite2D
# All of the text to scroll
var dialog_list = [
	"Hello! You must\nbe Dan",
	"Welcome to Camp!\nWoof! I'm here to\nshow you around",
	"Let me show you\nwhere we begin"
]

signal time_for_a_walk
# Number of characters to display
var text_shown_index = 0
var dialog_index = 0
@onready var label = $DoggyText
var shown = false
var showing = false

func _on_area_2d_body_entered(body):
	if "is_player" in body and body.is_player == true and !showing and !shown:
		visible = true
		showing = true
		await set_ticker_text()	
		visible = false
		emit_signal("time_for_a_walk")
	# Move to place

func set_ticker_text():
#	Set the text to the current position + some number of characters
	for dialog in dialog_list:

		# Initialize an empty variable to store characters
		var temp_variable = ""
		# Iterate through each character in the string
		for char in dialog:
			# Append the character to the variable
			temp_variable += char
		
			label.text = temp_variable
			await get_tree().create_timer(0.0007).timeout
	
	await get_tree().create_timer(1).timeout
	shown = true
