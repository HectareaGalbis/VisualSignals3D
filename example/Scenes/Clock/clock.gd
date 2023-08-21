extends Node3D


@export_range(0.001,4096.0) var wait_time : float = 1.0
@export_range(1,100) var max_int : int = 4

var current_int : int = 0

func _ready():
	$Timer.wait_time = wait_time


func _on_timer_timeout():
	$OnTick.emit(current_int)
	current_int = (current_int + 1) % max_int
