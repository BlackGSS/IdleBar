extends Node2D

@export var type = 0

var click_radius = 25
var positionHandlerOffset = 8;
var dragging = false
var onAreaShelf = false
var onAreaBottle = false
var placed = false
var areaPosition = Vector2.ZERO
var originalPosition = Vector2.ZERO
var zIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	zIndex = z_index;
	originalPosition = global_position
	
func _input(event):
	if(!placed):
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
			global_position = Vector2(event.position.x, event.position.y + positionHandlerOffset)

		if(onAreaShelf && !dragging && !onAreaBottle):
			global_position = Vector2(event.position.x, areaPosition.y)
			placed = true
			PubSub.bottle_placed.emit(type);
			return
		
		if(!dragging):
			global_position = originalPosition

func _on_area_entered(area):
	print_debug("Entering" + area.name);
	if(!area.name.contains("Bottle")):
		onAreaShelf = true;
		areaPosition = area.global_position;
	else:
		onAreaBottle = true;

func _on_area_exited(area):	
	if(!area.name.contains("Bottle")):
		onAreaShelf = false;
	else:
		onAreaBottle = false;

func _on_refill_button_down():
	PubSub.bottle_refilled.emit(type)
	$BottleDraw/Fill.refill()
	
func active_money_label(moneyAmount):
	$MoneyGraphic/AnimationPlayer.stop(true)
	$MoneyGraphic/Label.text = "+" + str(moneyAmount)
	$MoneyGraphic/AnimationPlayer.play("moneyEarningText")
