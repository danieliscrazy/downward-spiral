extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		print("Player entered the area!")
		# You can trigger anything here:
		# play sound, change scene, give item, etc.


func _on_dummy_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
