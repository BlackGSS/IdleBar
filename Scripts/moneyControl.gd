extends Node

var money = 100
signal createBottle(bottleType)
signal updateMoney(money)

func _ready():
	updateMoney.emit(money);

func _on_button_bottle_spawn_bottle(bottleType, price):
	if (money >= price):
		money -= price
		createBottle.emit(bottleType);
		updateMoney.emit(money);
