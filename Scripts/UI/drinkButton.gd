extends BaseButton

@export var bottleType = 0
signal clickDrinkBottle(bottleType)

func _ready():
	disabled = true

func _on_button_down():
	var bottles = get_tree().get_nodes_in_group("Bottles" + str(bottleType))
	for bottle in bottles:
		var filling = bottle.get_node("BottleDraw/Fill")
		filling.sip()
		if(!disabled && filling.size() == 0):
			disabled = true;

	clickDrinkBottle.emit(bottleType)

func _on_main_create_bottle(bottleType):
	if(disabled && bottleType == self.bottleType):
		disabled = false;
