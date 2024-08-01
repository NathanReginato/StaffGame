extends AudioStreamPlayer2D

var play_woof = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playing == false and play_woof == true:
		play()


func _on_area_2d_body_entered(body):
	if "is_player" in body and body.is_player == true:
		play_woof = false
