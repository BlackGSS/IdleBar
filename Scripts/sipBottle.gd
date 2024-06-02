extends ColorRect

var lessYSize

# Called when the node enters the scene tree for the first time.
func _ready():
	lessYSize = size.y / 4

func sip():
	size.y -= lessYSize
