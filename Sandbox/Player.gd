extends CharacterBody2D
@export var speed = 400
@onready var _animated_sprite = $AnimatedSprite2D
@onready var leaderboard = $Camera2D/Leaderboard

@onready var _walking_sound : AudioStreamPlayer2D = $AnimatedSprite2D/AudioStreamPlayer2D
var is_player = true
var forms_count = 0

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

	if Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down") || Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right"):
		if !_walking_sound.playing:
			_walking_sound.play()
	elif _walking_sound.playing:
		_walking_sound.stop()

func _on_scene_2_body_entered(body):
	if "is_player" in body and body.is_player == true:
			get_tree().change_scene_to_file("res://Office.tscn")


func _on_sandbox_body_entered(body):
	if "is_player" in body and body.is_player == true:
			get_tree().change_scene_to_file("res://Sandbox.tscn") # Replace with function body.


func _on_form_comleted_button_pressed():
	forms_count += 1

func _input(event):
	if event.is_action_pressed("leaderboard") and leaderboard.visible == false:
		leaderboard.visible = true
		#print("open leaderboard")
		
	elif event.is_action_pressed("leaderboard") and leaderboard.visible == true:
		leaderboard.visible = false
		#print("close leaderboard")
