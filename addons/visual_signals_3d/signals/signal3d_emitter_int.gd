@tool
extends Signal3DEmitterBase

class_name Signal3DEmitterInt

signal emit_signal(arg : int)

func _init():
	color = Color.AQUAMARINE

func _connect(receiver_node : Signal3DReceiverInt):
	emit_signal.connect(func(arg : int): receiver_node.receive_signal.emit(arg))
	

func emit(arg : int):
	emit_signal.emit(arg)
