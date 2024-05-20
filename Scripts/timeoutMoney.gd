extends Node

@export var money = 0

signal on_timeout_bottle(money)

func _on_timeout():
	on_timeout_bottle.emit(money)

#por cada timeout, un sorvito, por lo tanto hay que hacer un controllador que se conecte a esto y le baje a la botella la imagen y otro que cuando la botella esté a 0 haga pup
