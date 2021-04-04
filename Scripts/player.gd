extends KinematicBody2D

onready var parent = get_parent()
onready var anim = $AnimatedSprite

# Variáveis setadas externamente (são bem importantes)

export (float) var SPEED = 200
export (float) var JUMP_SPEED = 600
export (float) var GRAVITY = 30
export (float) var DASH_SPEED = 1000


# Variáveis auxiliares
var movedir = 0
var velocity = Vector2(0,0)
var death = false

func _ready():
	pass


	#Atualiza todo momento
func _physics_process(delta):
	
	#Em qualquer estado, faz o flip do sprite, collision do ataque e partículas
	if(movedir > 0):              
		if(anim.flip_h == true):
			anim.flip_h = false
	elif(movedir < 0):
		if(anim.flip_h == false):
			anim.flip_h = true

	
	#Movimento do player
func _apply_movement():
	if !parent.movePlatformH and !parent.movePlatformV and !parent.rotatePlatform:
		movedir = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
#	else:
#		movedir = 0
		
	velocity.x = movedir * SPEED
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, Vector2(0,-1))
