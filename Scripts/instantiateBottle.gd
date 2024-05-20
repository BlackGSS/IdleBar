extends Node2D

const bottleScene = preload("res://Scenes/bottle1.tscn")
signal bottle_created(bottle)

func _on_button_down():
	var newBottle = bottleScene.instantiate()
	newBottle.add_to_group("Bottles1")
	add_child(newBottle)
	bottle_created.emit(newBottle);
