# Tickers the text, but goes character by character instead of smoothly, like the previous script.
extends Label

# All of the text to scroll
var dialog_list = [
	"Hello! You must\nbe Dan",
	"Welcome to Camp!\nWoof! I'm here to\n show you around",
	"Let me show you\nwhere we begin"
]
# Number of characters to display
var text_shown_index = 0
var dialog_index = 0


	
	
func set_ticker_text(dialog):
#	Set the text to the current position + some number of characters
	if text_shown_index <= len(dialog):
		text = dialog.substr(0, text_shown_index)
		text_shown_index += 1
	else:
		await Input.is_action_pressed("ui_space")
		dialog_index += 1
		text_shown_index = 0
	
