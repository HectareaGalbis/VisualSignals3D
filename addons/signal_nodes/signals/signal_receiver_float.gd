@tool
extends SignalReceiverBase

class_name SignalReceiverFloat

signal receive_signal(arg : float)

func _init():
	color = Color.CHARTREUSE
	emitter_class = "SignalEmitterFloat"
