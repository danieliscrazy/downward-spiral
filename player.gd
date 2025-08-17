extends CharacterBody2D
@onready var _animated_sprite = $AnimatedSprite2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0
var shutdownvar = 1
var jeff = 1
func _ready() -> void:
	await get_tree().process_frame
	$Sign3.hide()
	$Sign2.hide()
	$Sign1.hide()
	$Sign4.hide()
	$Sprite2D.hide()
	$AudioStreamPlayer2D.play()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		if Input.is_action_pressed("down"):
			velocity += get_gravity() * delta * 3
			velocity = velocity * shutdownvar
			_animated_sprite.play("duck")
		else:
			velocity += get_gravity() * delta

	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		velocity.y = velocity.y * shutdownvar
		_animated_sprite.play("jump")
		

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		velocity.x = velocity.x * shutdownvar
		if velocity.x > 0:
			_animated_sprite.flip_h = false
		elif velocity.x < 0:
			_animated_sprite.flip_h = true
		if is_on_floor() and !Input.is_action_just_pressed("jump"):
			_animated_sprite.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.x = velocity.x * shutdownvar
		if !Input.is_action_just_pressed("jump") and is_on_floor():
			_animated_sprite.play("idle")

	move_and_slide()


func _on_sign_body_entered(body: Node2D) -> void:
	$Sign3.show()
	pass # Replace with function body.


func _on_sign_body_exited(body: Node2D) -> void:
	$Sign3.hide()
	pass # Replace with function body.


func _on_death_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_death_body_exited(body: Node2D) -> void:
	position = Vector2(1, 1)
	pass # Replace with function body.


func _on_sign_2_body_entered(body: Node2D) -> void:
	$Sign2.show()
	pass # Replace with function body.


func _on_sign_2_body_exited(body: Node2D) -> void:
	$Sign2.hide()
	pass # Replace with function body.


func _on_sign_3_body_entered(body: Node2D) -> void:
	$Sign1.show()
	pass # Replace with function body.


func _on_sign_3_body_exited(body: Node2D) -> void:
	$Sign1.hide()
	pass # Replace with function body.


func _on_dummy_body_entered(body: Node2D) -> void:
	$Sign4.show()
	pass # Replace with function body.


func _on_dummy_body_exited(body: Node2D) -> void:
	$Sign4.hide()
	pass # Replace with function body.


func _on_door_body_entered(body: Node2D) -> void:
	if jeff == 1:
		jeff = 0
	else:
		$Sprite2D.show()
		print("test")
		shutdownvar = 0
	pass # Replace with function body.
