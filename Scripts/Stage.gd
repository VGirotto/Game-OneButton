extends Node2D


export var stage = 1
export var initialX = 42
export var initialY = 353

var initialPos = Vector2(initialX, initialY)

onready var label = get_node("TextMove")

var movePlatformH = false
var movePlatformV = false
var rotatePlatform = false
var buttonH = false
var buttonV = false
var buttonR = false


# Called when the node enters the scene tree for the first time.
func _ready():
	Songs.get_node("sot").connect("finished", self, "_on_SOT_finished")
	if !Songs.get_node("sot").is_playing():
		Songs.get_node("sot").play()

func _on_SOT_finished():
	Songs.get_node("sot").play()

func _input(event):
	if event.is_action_pressed("moveH"):
		if buttonH:
			if !movePlatformV and !rotatePlatform: 
				if movePlatformH:
					movePlatformH = false
					label.visible = false
				else:
					label.set_text("\n			 move platform")
					movePlatformH = true
					label.visible = true
			
	elif event.is_action_pressed("moveV"):
		if buttonV:
			if !movePlatformH and !rotatePlatform: 
				if movePlatformV:
					movePlatformV = false
					label.visible = false
				else:
					label.set_text("\n			 move platform")
					movePlatformV = true
					label.visible = true
			
	elif event.is_action_pressed("rotate"):
		if buttonR:
			if !movePlatformV and !movePlatformH: 
				if rotatePlatform:
					rotatePlatform = false
					label.visible = false
				else:
					label.set_text("\n			 rotate platform")
					rotatePlatform = true
					label.visible = true
