extends Node3D



func _on_signal_receiver_int_receive_signal(arg : int):
	$OnEven.emit(arg % 2 == 0)
