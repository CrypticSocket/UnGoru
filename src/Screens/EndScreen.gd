extends Control

onready var endGameText: Label = $Label

func _ready():
	endGameText.text = endGameText.text % [PlayerData.score, PlayerData.deaths]
