extends Label

func _on_visibility_changed():
		var tween = create_tween()
		tween.tween_property(self, "modulate", Color.TRANSPARENT, 1).set_ease(Tween.EASE_OUT)
