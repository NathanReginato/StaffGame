extends Camera2D

func _ready():
	$Clipboard.visible == false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_button_pressed():
	$Clipboard.visible = false


func _on_button_pressed():
	$Clipboard.visible = true
