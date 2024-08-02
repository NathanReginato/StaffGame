extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.contact_monitor = true
	self.max_contacts_reported = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



