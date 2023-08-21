@tool
extends Signal3DEmitterBase

class_name Signal3DEmitterBool

signal emit_signal(arg : bool)

func _init():
	color = Color.CRIMSON

func _connect(receiver_node : Signal3DReceiverBool):
	emit_signal.connect(func(arg : bool): receiver_node.receive_signal.emit(arg))
	

func emit(arg : bool):
	emit_signal.emit(arg)
