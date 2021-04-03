extends Area2D

export var letter = "H"

onready var anim = get_node("AnimatedSprite")
onready var parent = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play(letter)

func _on_Buttons_body_entered(body):
	if body is KinematicBody2D:
		visible = false
		if letter == "H":
			parent.buttonH = true
		elif letter == "V":
			parent.buttonV = true
		elif letter == "R":
			parent.buttonR = true
