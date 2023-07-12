extends Sprite2D

var speed = 600
var angular_speed = PI




# Called when the node enters the scene tree for the first time.
func _ready():
	var velocity = Vector2.DOWN*speed
	#position += velocity * delta
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position.move_toward(Vector2(-20,520), speed*delta)
	pass
	


func _on_bird_game_started():
	hide()
	pass # Replace with function body.
