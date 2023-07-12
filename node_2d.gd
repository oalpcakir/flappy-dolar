extends Node2D
signal bird_crash
signal point_score
@onready var skysc = $"Skysc"
var points = 0


func _on_skysc_bird_entered():
	bird_crash.emit()
	stop() # Replace with function body.


func _on_skysc_point_scored():
	point_score.emit() # Replace with function body.
	points += 1

func stop():
	skysc.stop()


