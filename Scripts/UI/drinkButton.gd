extends BaseButton

@export var bottleType = 0
signal clickDrinkBottle(bottleType)

func _ready():
	disabled = true

func _on_button_down():
	var bottles = get_tree().get_nodes_in_group("Bottles" + str(bottleType))
	var currentNotEmptyBottles = Array()
	for bottle in bottles:
		var filling = bottle.get_node("BottleDraw/Fill")
		if(filling.size.y > 0):
			currentNotEmptyBottles.append(filling)
	
	if(currentNotEmptyBottles.size() > 0):
		for bottle in currentNotEmptyBottles:
			bottle.sip()
			clickDrinkBottle.emit(bottleType)
			if(bottle.size.y == 0):
				currentNotEmptyBottles.erase(bottle)
	
	if(currentNotEmptyBottles.size() == 0):
		disabled = true

func _on_main_create_bottle(bottleType):
	if(disabled && bottleType == self.bottleType):
		disabled = false;
