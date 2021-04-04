extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var text = "\n\n		The F-One Button was separated from its family.\n\n		With help from other lost buttons,\n\n		it'll have to solve puzzles to get home once more."
	#create a timer to print text like a typewriter
	var t = Timer.new()
	t.set_wait_time(.04)
	t.set_one_shot(true)
	self.add_child(t)

	for letter in text:
		t.start()
		self.add_text(letter)
		yield(t, "timeout")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
