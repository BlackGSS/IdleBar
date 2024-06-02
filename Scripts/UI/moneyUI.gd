extends Node

func _on_main_update_money(money):
	$Panel/MoneyLabel.set_text(str(money));
