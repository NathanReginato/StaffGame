extends Camera2D

func _ready():
	$Clipboard.visible == false

func _process(delta):
	pass

func _on_close_button_pressed():
	$Clipboard.visible = false
	$Button.visible = true

func _on_button_pressed():
	$Clipboard.visible = true
	$Button.visible = false
