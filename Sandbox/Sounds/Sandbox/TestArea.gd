extends Area2D

@onready var tree_text: Label = $TreeText

# Called when the node enters the scene tree for the first time.
func _ready():
	tree_text.set_visible(false)

func _on_body_entered(body):
	tree_text.set_visible(true)


func _on_body_exited(body):
	tree_text.set_visible(false)
