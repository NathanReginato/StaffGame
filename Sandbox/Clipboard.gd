extends Sprite2D

@onready var icecream1 = $"1"
@onready var icecream2 = $"2"
@onready var icecream3 = $"3"
@onready var icecream4 = $"4"
@onready var icecream5 = $"5"

@onready var progress = $"../WaterBottle/WaterProgress"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible == false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_form_completed_button_pressed():
	
	if progress.value <= progress.max_value and icecream1.visible == false:
		icecream1.visible = true
	elif progress.value <= progress.max_value and icecream2.visible == false:
		icecream2.visible = true
	elif progress.value <= progress.max_value and icecream3.visible == false:
		icecream3.visible = true
	elif progress.value <= progress.max_value and icecream4.visible == false:
		icecream4.visible = true
	elif progress.value <= progress.max_value and icecream5.visible == false:
		icecream5.visible = true
		
		
