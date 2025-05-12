# scripts/Main.gd
extends Node2D

@export var shop_scene: PackedScene
var coins = 100

@onready var coin_label = $CanvasLayer/Label

func _ready():
	update_coin_ui()

func place_shop(position: Vector2):
	if coins >= 50:
		var shop = shop_scene.instantiate()
		shop.position = position
		add_child(shop)
		shop.income_generated.connect(add_coins)
		coins -= 50
		update_coin_ui()
	else:
		print("Not enough coins!")

func update_coin_ui():
	coin_label.text = "Coins: %d" % coins

func add_coins(amount: int):
	coins += amount
	update_coin_ui()

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var tile_pos = $TileMap.local_to_map(event.position)
		var world_pos = $TileMap.map_to_local(tile_pos)
		place_shop(world_pos)
