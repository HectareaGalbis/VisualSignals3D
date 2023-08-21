@tool
extends SignalReceiverBase

class_name SignalReceiverBool

signal receive_signal(arg : bool)

func _init():
	color = Color.CRIMSON
	emitter_class = "SignalEmitterBool"
