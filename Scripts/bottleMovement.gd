extends Node2D

var click_radius = 25
var dragging = false
var zIndex = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	zIndex = z_index;
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		print((event.position - position).length())
		print(event.position);
		if (event.position - global_position).length() < click_radius:
			if not dragging and event.pressed:
				z_index = 3
				dragging = true
		# Stop dragging if the button is released.
		if dragging and not event.pressed:
			dragging = false
			z_index = zIndex

	if event is InputEventMouseMotion and dragging:
		# While dragging, move the sprite with the mouse.
		global_position = event.position
