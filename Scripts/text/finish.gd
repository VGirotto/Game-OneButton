extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var text = "\n\n		Go back to your keyboard!\n\n\n\n		It's the end of your adventure!"
	#create a timer to print text like a typewriter
	var t = Timer.new()
	t.set_wait_time(.04)
	t.set_one_shot(true)
	self.add_child(t)

	for letter in text:
		t.start()
		self.add_text(letter)
		yield(t, "timeout")
