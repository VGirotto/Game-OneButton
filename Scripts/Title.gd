extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept"):
		yield(get_tree().create_timer(0.2), "timeout")
		get_tree().change_scene("res://Scenes/Main.tscn")
