@tool
extends SignalEmitterBase

class_name SignalEmitterInt

signal emit_signal(arg : int)

func _init():
	color = Color.AQUAMARINE

func _connect(receiver_node : SignalReceiverInt):
	emit_signal.connect(func(arg : int): receiver_node.receive_signal.emit(arg))
	

func emit(arg : int):
	emit_signal.emit(arg)
