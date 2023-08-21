@tool
extends Signal3DReceiverBase

class_name Signal3DReceiver

signal receive_signal

func _init():
	color = Color(1,1,1)
	emitter_class = "Signal3DEmitter"

