extends Area2D

export var letter = "H"

onready var anim = get_node("AnimatedSprite")
onready var parent = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play(letter)

func _on_Buttons_body_entered(body):
	if body is KinematicBody2D:
		Songs.get_node("button").play()
		visible = false
		if letter == "H":
			parent.buttonH = true
			parent.get_node("Huds/Hbutton").visible = true
		elif letter == "V":
			parent.buttonV = true
			parent.get_node("Huds/VHbutton").visible = true
		elif letter == "R":
			parent.buttonR = true
			parent.get_node("Huds/Rbutton").visible = true
