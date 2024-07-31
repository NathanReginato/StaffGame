extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	self.monitoring = true


func _on_body_entered(body):
	print("player entered", body)
	get_node("Gate/AnimatedSprite2D").play("gate_open")
