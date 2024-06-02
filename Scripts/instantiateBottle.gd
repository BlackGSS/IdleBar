extends Node2D

const bottle1Scene = preload("res://Scenes/bottle1.tscn")
const bottle2Scene = preload("res://Scenes/bottle2.tscn")
const bottle3Scene = preload("res://Scenes/bottle3.tscn")
signal bottle_created(bottle)
@export var type = 0
var bottleScenes;

func _ready():
	bottleScenes = [bottle1Scene, bottle2Scene, bottle3Scene]

func _on_main_create_bottle(bottleType):
	var newBottle = bottleScenes[bottleType].instantiate()
	newBottle.global_position = Vector2.ZERO
	# Quizas esto de añadirlo a un grupo debería de ir cuando ya se coloca (en el place del bottleMovement
	newBottle.add_to_group("Bottles" + str(bottleType))
	var nodes = get_tree().get_nodes_in_group("Bottles" + str(bottleType))
	newBottle.name = "Bottle" + str(bottleType) + "_" + str(nodes.size())
	add_child(newBottle)
	bottle_created.emit(newBottle);
