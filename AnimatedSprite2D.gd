extends AnimatedSprite2D

signal game_started
var isGameStarted = false

var isAnimating = false
const GRAVITY = 900
const FLAP_FORCE = 300
var velocity = Vector2.ZERO
var hasPressedButton = false
const ROTATION_SPEED = 10


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			start_animation()
			velocity.y = -FLAP_FORCE
			hasPressedButton = true
			rotate_to_up()
			start_game()

	elif event is InputEventKey:
		if event.is_action("ui_select") && event.pressed:
			start_animation()
			velocity.y = -FLAP_FORCE
			hasPressedButton = true
			rotate_to_up()
			start_game()

	elif event is InputEventScreenTouch:
		if event.pressed:
			start_animation()
			velocity.y = -FLAP_FORCE
			hasPressedButton = true
			rotate_to_up()
			start_game()

func start_game():
	if !isGameStarted:
		isGameStarted = true
		game_started.emit()
		# Add your game start logic here

func rotate_to_up():
	rotation_degrees = -20

func rotate_to_down():
	rotation_degrees = 10

func _ready():
	if !hasPressedButton and !isAnimating:
		play("flappy_loop")


func start_animation():
	if !isAnimating:
		isAnimating = true
		frame = 0  # Set the initial frame of the animation
		play("flappy")

func release_button():
	if isAnimating:
		isAnimating = false
		stop()

func _process(delta):
	if isAnimating and !is_playing():
		release_button()

func _physics_process(delta):
	if hasPressedButton:
		velocity.y += GRAVITY * delta
	
		if velocity.y < 0:
			rotate_to_up()
		else:
			rotate_to_down()
	
		position += velocity * delta
	var viewport_position = get_viewport_transform().origin
	if position.y + viewport_position.y > 0:
		position += velocity * delta


	var viewport_rect = get_viewport_rect()
	if position.y + viewport_position.y > viewport_rect.size.y:
		position.y = viewport_rect.size.y - viewport_position.y
		velocity.y = 0
		

	if position.y > get_viewport_rect().size.y:
		position.y = get_viewport_rect().size.y
		velocity.y = 0

	if position.y < 0:
		position.y = 0
		velocity.y = 0


