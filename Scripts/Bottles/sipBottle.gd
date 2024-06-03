extends ColorRect

var originalSize
var lessYSize
signal on_bottle_empty

# Called when the node enters the scene tree for the first time.
func _ready():
	originalSize = size.y
	lessYSize = size.y / 4

func sip():
	size.y -= lessYSize
	if(size.y <= 0):
		on_bottle_empty.emit()

func refill():
	size.y = originalSize
