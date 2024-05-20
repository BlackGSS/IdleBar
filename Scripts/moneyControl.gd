extends Node

var money = 0;

#func _on_bottle_created(bottle):
	#bottle.on_timeout_bottle.connect(_on_bottle_money)
#
#func _on_bottle_money(moreMoney):
	#money += moreMoney
