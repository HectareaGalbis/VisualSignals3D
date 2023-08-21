@tool
extends SignalReceiverBase

class_name SignalReceiverThreeParam

signal receive_signal(arg1, arg2, arg3)

func _init():
	color = Color(0.2,0.2,0.2)
	emitter_class = "SignalEmitterThreeParam"
