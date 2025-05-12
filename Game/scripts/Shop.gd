# scripts/Shop.gd
extends Node2D

@export var income_amount = 5
@export var income_interval = 2.0 # seconds

signal income_generated(amount: int)

func _ready():
	start_generating_income()

func start_generating_income():
	_generate_income()

func _generate_income():
	await get_tree().create_timer(income_interval).timeout
	income_generated.emit(income_amount)
	_generate_income()
