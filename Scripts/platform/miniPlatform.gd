extends StaticBody2D

onready var parent = get_parent()

var enable
var move

export var time = 2
export var invisible = false
export var moveH = false
export var moveV = false
export var rotate = false
export var spikes = false
export var upSpike = true

# Called when the node enters the scene tree for the first time.
func _ready():
	move = false
	if invisible:
		$Timer.start(time)
		enable = true
	if spikes:
		if $SmallSpikes:
			$SmallSpikes.visible = true
			$SmallSpikes/CollisionShape2D.disabled = false
			if upSpike:
				$SmallSpikes.position = Vector2(0, -9.822)
				$SmallSpikes.rotation = 0
			else:
				$SmallSpikes.position = Vector2(0, 9.822)
				$SmallSpikes.rotation = 180
		else:
			print("existe")
			$LargeSpikes.visible = true
			$LargeSpikes/CollisionShape2D.disabled = false
			if upSpike:
				$LargeSpikes.position = Vector2(0, -9.822)
				$LargeSpikes.rotation = 0
			else:
				$LargeSpikes.position = Vector2(0, 9.822)
				$LargeSpikes.rotation = 180

func _on_Timer_timeout():
	if enable:
		$CollisionShape2D.disabled = true
		$Sprite.play("disable")
		enable = false
	else:
		$CollisionShape2D.disabled = false
		$Sprite.play("enable")
		enable = true

func _physics_process(delta):
	if parent.movePlatformH:
		if moveH:
			if Input.is_action_pressed("ui_left"):
				position.x -= 5
			elif Input.is_action_pressed("ui_right"):
				position.x += 5
	if parent.movePlatformV:
		if moveV:
			if Input.is_action_pressed("ui_up"):
				position.y -= 5
			elif Input.is_action_pressed("ui_down"):
				position.y += 5
	if parent.rotatePlatform:
		if rotate:
			if Input.is_action_pressed("ui_up"):
				rotation_degrees -= 5
			elif Input.is_action_pressed("ui_down"):
				rotation_degrees += 5
			
