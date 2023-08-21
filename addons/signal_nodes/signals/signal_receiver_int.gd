@tool
extends SignalReceiverBase

class_name SignalReceiverInt

signal receive_signal(arg : int)

func _init():
	color = Color.AQUAMARINE
	emitter_class = "SignalEmitterInt"
