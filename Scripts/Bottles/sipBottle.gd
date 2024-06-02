extends ColorRect

var originalSize
var lessYSize
signal on_bottle_empty
signal on_bottle_refilled

# Called when the node enters the scene tree for the first time.
func _ready():
	originalSize = size.y
	lessYSize = size.y / 4

func sip():
	size.y -= lessYSize
	if(size.y <= 0):
		on_bottle_empty.emit()

func _on_refill_button_down():
	size.y = originalSize
	on_bottle_refilled.emit()
