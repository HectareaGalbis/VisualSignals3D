@tool
extends Signal3DReceiverBase

class_name Signal3DReceiverBool

signal receive_signal(arg : bool)

func _init():
	color = Color.CRIMSON
	emitter_class = "Signal3DEmitterBool"
