@tool
extends Signal3DReceiverBase

class_name Signal3DReceiverFloat

signal receive_signal(arg : float)

func _init():
	color = Color.CHARTREUSE
	emitter_class = "Signal3DEmitterFloat"
