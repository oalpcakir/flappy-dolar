extends Node2D

const PIPE_SPEED = Vector2(-200, 100)
const PIPE_GAP = 200

var pipeTimer = 0

class Pipe extends Sprite2D:
	var velocity = Vector2.ZERO

func _ready():
	pass

func _process(delta):
	pipeTimer -= delta

	if pipeTimer <= 0:
		create_pipe()
		pipeTimer = randf_range(1, 3)  # Adjust the timing of pipe creation here

func create_pipe():
	var pipe = Pipe.new()
	var pipeTexture = preload("res://banka.png")  # Replace with the path to your pipe texture
	pipe.texture = pipeTexture
	pipe.position = Vector2(get_viewport_rect().size.x, randf_range(-500,-100))  # Adjust the vertical position of the pipe here
	pipe.velocity = PIPE_SPEED

	get_parent().add_child(pipe)  # Add the pipe as a child of the main scene

func _physics_process(delta):
	for pipe in get_parent().get_children():
		if pipe is Pipe:
			pipe.position += pipe.velocity * delta

			if pipe.position.x < -pipe.texture.get_width():
				pipe.queue_free()

	var previousPipePos = Vector2.ZERO

	for pipe in get_parent().get_children():
		if pipe is Pipe:
			if pipe.position.x > previousPipePos.x:
				previousPipePos = pipe.position
