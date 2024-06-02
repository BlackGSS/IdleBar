extends BaseButton

@export var price = 0;
@export var bottleType = 0;

signal spawn_bottle(bottleType, price)

func _ready():
	$Label.text = str(price);

func _on_button_down():
	spawn_bottle.emit(bottleType, price)

func _on_main_update_money(money):
	disabled = !(money >= price)
