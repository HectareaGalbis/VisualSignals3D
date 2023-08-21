@tool
extends Signal3DReceiverBase

class_name Signal3DReceiverOneParam

signal receive_signal(arg)

func _init():
	color = Color(0.6,0.6,0.6)
	emitter_class = "Signal3DEmitterOneParam"
