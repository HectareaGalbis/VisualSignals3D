@tool
extends Signal3DReceiverBase

class_name Signal3DReceiverThreeParam

signal receive_signal(arg1, arg2, arg3)

func _init():
	color = Color(0.2,0.2,0.2)
	emitter_class = "Signal3DEmitterThreeParam"
