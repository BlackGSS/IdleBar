extends BaseButton

@export var bottleType = 0
@export var moneyAmount = 2

func _ready():
	disabled = true
	PubSub.bottle_refilled.connect(_on_bottle_refilled)
	PubSub.bottle_placed.connect(_on_bottle_created)

func _on_button_down():
	var bottles = get_tree().get_nodes_in_group("Bottles" + str(bottleType))
	var currentNotEmptyFills = Array()
	var currentNotEmptyBottles = Array()
	for bottle in bottles:
		#we shouldn't do this, we're accessing to the childs of a scene
		var filling = bottle.get_node("BottleDraw/Fill")
		if(filling.size.y > 0):
			currentNotEmptyFills.append(filling)
			currentNotEmptyBottles.append(bottle)
	
	if(currentNotEmptyFills.size() > 0):
		for i in range(currentNotEmptyFills.size() -1, -1, -1):
			var fill = currentNotEmptyFills[i]
			fill.sip()
			currentNotEmptyBottles[i].active_money_label(moneyAmount)
			PubSub.clickDrinkBottle.emit(moneyAmount)
			if(fill.size.y == 0):
				currentNotEmptyFills.erase(fill)

	if(currentNotEmptyFills.size() == 0):
		disabled = true

func _on_bottle_created(bottleType):
	if(disabled && bottleType == self.bottleType):
		disabled = false;

func _on_bottle_refilled(type):
	if(bottleType == type):
		disabled = false
