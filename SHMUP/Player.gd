extends Area2D

export var speed = 100
export var rotateSpeed = 5
var screenSize 
var playerDir = Vector2.UP
var targetDir = Vector2.UP
var canMove = false
var mousePos

func _ready():
	screenSize = get_viewport_rect().size
	canMove = true
	print("Ready")
	#$CollisionShape2D.disabled = true
	#hide()
	
func _process(delta):
	if canMove :
		mousePos = get_viewport().get_mouse_position()
		print(str(mousePos))
		targetDir = mousePos - position
		
		playerDir = lerp(playerDir.normalized(), targetDir.normalized(), delta * rotateSpeed)
		
		look_at((position + playerDir.normalized()))
		position += playerDir.normalized() * delta * speed; 
