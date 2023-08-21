@tool
extends SignalReceiverBase

class_name SignalReceiverVector3

signal receive_signal(arg : Vector3)

func _init():
	color = Color.GOLD
	emitter_class = "SignalEmitterVector3"
