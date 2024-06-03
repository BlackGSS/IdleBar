extends Node

var refillButton
signal on_button_refill

func _ready():
	refillButton = $RefillButton
	_set_visibility(false)

func _on_refill_button_down():
	on_button_refill.emit();
	_set_visibility(false)

func _on_bottle_empty():
	_set_visibility(true)
	
func _set_visibility(active):
	refillButton.visible = active
