extends CharacterBody2D
@onready var _animated_sprite = $AnimatedSprite2D
signal movement(direction)

func _process(_delta):
	if Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_right"):
		movement.emit(2)
		_animated_sprite.play("WalkNorthEast")
	elif Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_left"):
		movement.emit(8)
		_animated_sprite.play("WalkNorthWest")
	elif Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_right"):
		movement.emit(4)
		_animated_sprite.play("WalkSouthEast")
	elif Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_left"):
		movement.emit(6)
		_animated_sprite.play("WalkSouthWest")
	elif Input.is_action_pressed("ui_right"):
		movement.emit(3)
		_animated_sprite.play("WalkEast")
	elif Input.is_action_pressed("ui_left"):
		movement.emit(7)
		_animated_sprite.play("WalkWest")
	elif Input.is_action_pressed("ui_up"):
		movement.emit(1)
		_animated_sprite.play("WalkNorth")
	elif Input.is_action_pressed("ui_down"):
		movement.emit(5)
		_animated_sprite.play("WalkSouth")
	else:
		movement.emit(0)
		_animated_sprite.stop()
