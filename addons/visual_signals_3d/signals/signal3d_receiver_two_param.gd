@tool
extends Signal3DReceiverBase

class_name Signal3DReceiverTwoParam

signal receive_signal(arg1, arg2)

func _init():
	color = Color(0.4,0.4,0.4)
	emitter_class = "Signal3DEmitterTwoParam"
