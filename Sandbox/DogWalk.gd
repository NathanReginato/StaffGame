extends Path2D

@onready var path_to_follow = $PathFollow2D
@onready var javi_sprite = $"PathFollow2D/Doggy Javi/AnimatedSprite2D"
signal all_done_walking

func _on_sprite_2d_time_for_a_walk():
	javi_sprite.stop()
	while path_to_follow.progress_ratio < 0.17:
		# path_to_follow.progress_ratio += 0.002
		path_to_follow.progress_ratio += 0.05
		await get_tree().create_timer(0.01).timeout
		if !javi_sprite.is_playing():
			javi_sprite.play("walk_down")
	
	javi_sprite.stop()
	while path_to_follow.progress_ratio >= 0.17 and path_to_follow.progress_ratio < 1:
		path_to_follow.progress_ratio += 0.05
		await get_tree().create_timer(0.01).timeout
		if !javi_sprite.is_playing():
			javi_sprite.play("walk_right")
			
	javi_sprite.stop()
	javi_sprite.play("idle_left")
	all_done_walking.emit()
			
	
