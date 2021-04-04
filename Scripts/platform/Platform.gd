extends StaticBody2D

onready var parent = get_parent()

export var espinhos = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if espinhos:
		$Area2D/CollisionShape2D.disabled = false
		$Sprite.play("thorns")
		$Thorn1.disabled = false
		$Thorn2.disabled = false
		$CollisionShape2D.disabled = true
	else:
		$Area2D/CollisionShape2D.disabled = true
		$Sprite.play("normal")
		$Thorn1.disabled = true
		$Thorn2.disabled = true
		$CollisionShape2D.disabled = false


func _on_Area2D_body_entered(body):
	if body is KinematicBody2D:
		Songs.get_node("spikes").play()
		parent.get_node("Player").position = parent.initialPos
