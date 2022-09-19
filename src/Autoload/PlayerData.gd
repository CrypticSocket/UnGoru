extends Node

signal scoreUpdated
signal playerDied

var score: = 0 setget set_score
var deaths: = 0 setget set_deaths

func set_score(value : int):
	score = value
	emit_signal("scoreUpdated")
	
func set_deaths(value : int):
	deaths = value
	emit_signal("playerDied")
	
func reset(score:int = 0):
	score = score
	deaths = 0
