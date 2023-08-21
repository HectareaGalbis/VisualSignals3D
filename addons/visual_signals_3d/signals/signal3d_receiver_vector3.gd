@tool
extends Signal3DReceiverBase

class_name Signal3DReceiverVector3

signal receive_signal(arg : Vector3)

func _init():
	color = Color.GOLD
	emitter_class = "Signal3DEmitterVector3"
