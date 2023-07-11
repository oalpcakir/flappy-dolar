extends Sprite2D

var speed = 400
var angular_speed = PI

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.DOWN*speed
	#position += velocity * delta
	position = position.move_toward(Vector2(0,0), delta * speed)
	pass
	

