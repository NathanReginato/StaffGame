extends Area2D

signal new_coin

func _on_body_entered(body):
	if "is_player" in body and body.is_player and visible:
		$AudioStreamPlayer2D.play()
		hide()
		new_coin.emit()
