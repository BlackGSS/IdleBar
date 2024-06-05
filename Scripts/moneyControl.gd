extends Node

var money = 100
signal createBottle(bottleType)
signal updateMoney(money)

func _ready():
	updateMoney.emit(money);
	PubSub.clickDrinkBottle.connect(_earn_money)

func _on_button_bottle_spawn_bottle(bottleType, price):
	if (money >= price):
		money -= price
		createBottle.emit(bottleType);
		updateMoney.emit(money);

func _earn_money(amount):
	money += amount
	updateMoney.emit(money)
