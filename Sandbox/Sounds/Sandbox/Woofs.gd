extends Label

var font_alpha = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	while true:
		font_alpha += 0.1
		await get_tree().create_timer(0.05).timeout
