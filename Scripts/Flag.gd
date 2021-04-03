extends Area2D

onready var parent = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Flag_body_entered(body):
	if body is KinematicBody2D: # é o player
		#terminou fase
		yield(get_tree().create_timer(0.3), "timeout")
		get_tree().change_scene("res://Scenes/stages/Stage" + String(parent.stage+1) + ".tscn")
