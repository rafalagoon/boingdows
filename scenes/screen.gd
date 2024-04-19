extends Node2D

const PREV_INI_POS = Vector2i.ONE * -10000

@export var screen_margin_left:int = 2240
@export var screen_margin_bottom:int = 60

@export var force_multiplier:int = 100000

@onready var window_position_prev:Vector2i = PREV_INI_POS


func _ready() -> void:
	get_window().position = get_window_virtual_position_in_screen()


func _notification(what: int) -> void:
	if what == 16:
		return

	match what:
		NOTIFICATION_WM_WINDOW_FOCUS_OUT:
			$VirtualWindow.set_deferred("freeze", true)
			window_position_prev = get_window().position
			
		NOTIFICATION_WM_WINDOW_FOCUS_IN:
			$VirtualWindow.position = get_window_position_in_canvas()
			$VirtualWindow.update_position(get_window_position_in_canvas())
			
			if window_position_prev != PREV_INI_POS:
				var dir = Vector2(get_window().position - window_position_prev).normalized()
				$VirtualWindow.apply_central_force(dir*force_multiplier)
				
			$VirtualWindow.set_deferred("freeze", false)


func get_window_virtual_position_in_screen ():
	return Vector2i(screen_margin_left, screen_margin_bottom) + Vector2i($VirtualWindow.position)


func get_window_position_in_canvas ():
	return Vector2i(get_window().position) - Vector2i(screen_margin_left, screen_margin_bottom)


func _on_window_position_change(new_position: Vector2) -> void:
	get_window().position = Vector2i(screen_margin_left, screen_margin_bottom) + Vector2i(new_position)

	
