@tool
extends Signal3DReceiverBase

class_name Signal3DReceiverInt

signal receive_signal(arg : int)

func _init():
	color = Color.AQUAMARINE
	emitter_class = "Signal3DEmitterInt"
