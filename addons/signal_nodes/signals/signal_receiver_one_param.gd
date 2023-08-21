@tool
extends SignalReceiverBase

class_name SignalReceiverOneParam

signal receive_signal(arg)

func _init():
	color = Color(0.6,0.6,0.6)
	emitter_class = "SignalEmitterOneParam"
