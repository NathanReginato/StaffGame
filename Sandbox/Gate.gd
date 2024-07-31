extends Area2D
var _gate_open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.monitoring = true
	get_node("GateInfo").visible = false


func _on_body_entered(body):
	if "is_player" in body and body.is_player == true:
		if _gate_open == false: 
			#get_node("Gate/AnimatedSprite2D").play("gate_open")
			#get_node("Gate/CollisionShape2D").disabled = true
			get_node("GateInfo").visible = true
			#_gate_open = true


func _on_body_exited(body):
	if "is_player" in body and body.is_player == true:
		if get_node("GateInfo").visible:
			get_node("GateInfo").visible = false
		
