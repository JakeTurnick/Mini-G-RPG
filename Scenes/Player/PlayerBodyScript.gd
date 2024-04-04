extends CharacterBody2D
class_name PlayerCharacterBody


const SPEED = 75
const SprintMultiplier = 1.5
const JUMP_VELOCITY = -400.0

@onready var PlayerSprite = $AnimatedSprite2D
@onready var mainParent: PlayerCharacter = self.get_parent()

var GamePaused : bool = false

func _physics_process(_delta):

	if Input.is_action_just_released("Interact"):
		#print("interact with ...")
		interact() # emits signal for scene holding player

	# Get the input direction and handle the movement/deceleration.
	var x = Input.get_axis("Left", "Right")
	var y = Input.get_axis("Up", "Down")
	var playerSpeed = 1
	
	var inputDirection = Input.get_vector("Left", "Right", "Up", "Down")
	if (Input.is_action_pressed("Sprint")):
		velocity = inputDirection * SPEED * SprintMultiplier
		playerSpeed = SprintMultiplier
	else: 
		velocity = inputDirection * SPEED
		playerSpeed = 1
	
	if (x == 1 and y == 0):
		PlayerSprite.play("WalkRight", playerSpeed)
	elif (x == 1 and y == -1):
		PlayerSprite.play("WalkUpRight", playerSpeed)
	elif (x == 1 and y == 1):
		PlayerSprite.play("WalkDownRight", playerSpeed)
	elif (x == -1 and y == 0):
		PlayerSprite.play("WalkLeft", playerSpeed)
	elif (x == -1 and y == -1):
		PlayerSprite.play("WalkUpLeft", playerSpeed)
	elif (x == -1 and y == 1):
		PlayerSprite.play("WalkDownLeft", playerSpeed)
	elif (x == 0 and y == -1):
		PlayerSprite.play("WalkUp", playerSpeed)
	elif (x == 0 and y == 1):
		PlayerSprite.play("WalkDown", playerSpeed)
	else:
		PlayerSprite.stop()
	move_and_slide()

func interact():
	mainParent.interactSignal.emit()
