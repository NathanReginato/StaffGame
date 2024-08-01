extends Path2D

@onready var path_to_follow = $PathFollow2D
@onready var javi_sprite = $"PathFollow2D/Doggy Javi/AnimatedSprite2D"

func _on_sprite_2d_time_for_a_walk():
	print("time for a walk")
	javi_sprite.stop()
	while path_to_follow.progress_ratio < 1:
		path_to_follow.progress_ratio += 0.001
		await get_tree().create_timer(0.01).timeout
		if !javi_sprite.is_playing():
			javi_sprite.play("walk_down")
			#
		#if (path_to_follow.progress_ratio > 0.20) or javi_sprite.is_playing():
			#javi_sprite.stop()
			#javi_sprite.play("walk_right")

		
			
