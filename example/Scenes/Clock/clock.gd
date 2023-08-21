extends Node3D


var current_int : int = 0

func _ready():
	$Timer.wait_time = 1


func _on_timer_timeout():
	$OnTick.emit(current_int)
	current_int += 1
