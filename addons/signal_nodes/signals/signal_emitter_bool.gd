@tool
extends SignalEmitterBase

class_name SignalEmitterBool

signal emit_signal(arg : bool)

func _init():
	color = Color.CRIMSON

func _connect(receiver_node : SignalReceiverBool):
	emit_signal.connect(func(arg : bool): receiver_node.receive_signal.emit(arg))
	

func emit(arg : bool):
	emit_signal.emit(arg)
