@tool
extends SignalReceiverBase

class_name SignalReceiverTwoParam

signal receive_signal(arg1, arg2)

func _init():
	color = Color(0.4,0.4,0.4)
	emitter_class = "SignalEmitterTwoParam"
