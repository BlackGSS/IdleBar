extends Node

@onready var refillButton = $RefillButton

func _on_fill_on_bottle_empty():
	refillButton.visible = true
