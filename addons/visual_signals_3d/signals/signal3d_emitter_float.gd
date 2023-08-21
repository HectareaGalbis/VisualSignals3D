@tool
extends Signal3DEmitterBase

class_name Signal3DEmitterFloat

signal emit_signal(arg : float)

func _init():
	color = Color.CHARTREUSE

func _connect(receiver_node : Signal3DReceiverFloat):
	emit_signal.connect(func(arg : float): receiver_node.receive_signal.emit(arg))
	

func emit(arg : float):
	emit_signal.emit(arg)
