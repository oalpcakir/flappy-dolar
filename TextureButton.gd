extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func toggle_visibility() -> void:
	visible = not visible


func _on_timer_timeout():
	visible = true
	pass # Replace with function body.

