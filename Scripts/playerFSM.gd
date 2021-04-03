extends "res://Scripts/state_machine.gd"
var i = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	add_state("parado")
	add_state("walk")
	add_state("jump")
	add_state("fall")
	call_deferred("set_state", states.parado)

func _input(event):
	if !parent.parent.movePlatformH and !parent.parent.movePlatformV and !parent.parent.rotatePlatform:
		if [states.parado, states.walk, states.fall].has(state):    #pulo simples
			if event.is_action_pressed("ui_up") and pilha.size() == 0:
				parent.anim.play("jump")	#inicia animacao
				yield(get_tree().create_timer(0.1), "timeout")
				parent.velocity.y = -parent.JUMP_SPEED    #joga pra cima
				add_pilha("jump")
				print(pilha)

func _state_logic(delta):
	parent._apply_movement()

func _get_transition(delta):
	#print(pilha)
	match state:

		states.parado:
			if !parent.is_on_floor():  #se nao tiver no chão verifica se está pulando ou caindo
				return states.jump
			elif parent.velocity.x != 0: #se tiver em movimento muda para o walk
				return states.walk

		states.walk:
			if !parent.is_on_floor():
				if pilha.size() <= 1 and parent.velocity.y < 0:
					return states.jump
			elif parent.velocity.x == 0:
				return states.parado

		states.jump:
			if parent.velocity.y > 0:  #se começar a cair muda para o estado fall
				return states.fall
				
		states.fall:
			if parent.is_on_floor() or parent.velocity.y == 0:  #se cair no chão acaba o fall
				return states.parado
			if pilha.size() == 0:
				if parent.velocity.y < 0:
					return states.jump
				
	return null

func _enter_state(new_state, old_state):
	#print(new_state)
	match new_state:
		states.parado:
			#print(String(pilha.size()) + "pilha")
			parent.anim.play("idle")
			if pilha.size() > 0:
				remove_pilha()
			
		states.walk:
			#print(String(pilha.size()) + "pilha")
			parent.anim.play("walk")
			if pilha.size() > 0:
				remove_pilha()
			
		states.jump:
			i += 1
			print("jump" + String(i))
			#print("pilha" + String(pilha.size()))
			pass
			
		states.fall:
			yield(get_tree().create_timer(0.10), "timeout")
			parent.anim.play("fall")


func _exit_state(old_state, new_state):
	pass
