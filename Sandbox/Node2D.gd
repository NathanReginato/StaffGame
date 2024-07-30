extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$CharacterBody2D.connect("movement",func(direction):
		match direction: 
			1: 
				#Up
				$TileMap.move_local_y(1)
			2:
				#NorthEast
				$TileMap.move_local_x(-1)
				$TileMap.move_local_y(1)
			3:
				#Right
				$TileMap.move_local_x(-1)
			4:
				#SouthEast
				$TileMap.move_local_x(-1)
				$TileMap.move_local_y(-1)
			5:
				#Down
				$TileMap.move_local_y(-1)
			6:
				#SouthWest
				$TileMap.move_local_x(1)
				$TileMap.move_local_y(-1)
			7:
				#Left
				$TileMap.move_local_x(1)
			8:
				#NorthWest
				$TileMap.move_local_x(1)
				$TileMap.move_local_y(1)
	) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
