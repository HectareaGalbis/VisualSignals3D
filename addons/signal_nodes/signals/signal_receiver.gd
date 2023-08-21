@tool
extends SignalReceiverBase

class_name SignalReceiver

signal receive_signal

func _init():
	color = Color(1,1,1)
	emitter_class = "SignalEmitter"

