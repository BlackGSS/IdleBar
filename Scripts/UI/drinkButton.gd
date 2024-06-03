extends BaseButton

@export var bottleType = 0
signal clickDrinkBottle(bottleType)

func _ready():
	disabled = true
	PubSub.bottle_refilled.connect(_on_bottle_refilled)
	PubSub.bottle_placed.connect(_on_bottle_created)

func _on_button_down():
	var bottles = get_tree().get_nodes_in_group("Bottles" + str(bottleType))
	var currentNotEmptyBottles = Array()
	for bottle in bottles:
		#we shouldn't do this, we're accessing to the childs of a scene
		var filling = bottle.get_node("BottleDraw/Fill")
		if(filling.size.y > 0):
			currentNotEmptyBottles.append(filling)
	
	if(currentNotEmptyBottles.size() > 0):
		for i in range(currentNotEmptyBottles.size() -1, -1, -1):
			var bottle = currentNotEmptyBottles[i]
			bottle.sip()
			clickDrinkBottle.emit(bottleType)
			if(bottle.size.y == 0):
				currentNotEmptyBottles.erase(bottle)

	if(currentNotEmptyBottles.size() == 0):
		disabled = true

func _on_bottle_created(bottleType):
	if(disabled && bottleType == self.bottleType):
		disabled = false;

func _on_bottle_refilled(type):
	if(bottleType == type):
		disabled = false
