extends CharacterBody2D
@export var speed = 400

@onready var _animated_sprite = $AnimatedSprite2D

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
#
func _process(_delta):
	if Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_right"):
		_animated_sprite.play("WalkNorthEast")
	elif Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_left"):
		_animated_sprite.play("WalkNorthWest")
	elif Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_right"):
		_animated_sprite.play("WalkSouthEast")
	elif Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_left"):
		_animated_sprite.play("WalkSouthWest")
	elif Input.is_action_pressed("ui_right"):
		_animated_sprite.play("WalkEast")
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.play("WalkWest")
	elif Input.is_action_pressed("ui_up"):
		_animated_sprite.play("WalkNorth")
	elif Input.is_action_pressed("ui_down"):
		_animated_sprite.play("WalkSouth")
	else:
		_animated_sprite.stop()


