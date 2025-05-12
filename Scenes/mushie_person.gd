extends CharacterBody2D


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var _input_direction := Input.get_axis("left", "right")


	move_and_slide()
