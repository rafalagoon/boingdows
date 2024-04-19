extends RigidBody2D


signal position_change(new_position:Vector2)

var position_prev: Vector2 = Vector2.ONE * -10000

var reset_state: bool = false

var new_pos: Vector2 = Vector2.ZERO


func _process(delta: float) -> void:
	if position != position_prev:
		position_change.emit(position)
		position_prev = position


func _integrate_forces(state):
	if reset_state:
		state.transform = Transform2D(0.0, new_pos)
		reset_state = false


func update_position (_new_pos: Vector2):
	new_pos = _new_pos
	
	reset_state = true


func _on_body_entered(body: Node) -> void:
	$AudioStreamPlayer2D.play()




