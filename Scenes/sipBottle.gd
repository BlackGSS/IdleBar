extends ColorRect

signal on_sip

var lessYSize

# Called when the node enters the scene tree for the first time.
func _ready():
	lessYSize = size.y / 4

func sip():
	size.y -= lessYSize
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
